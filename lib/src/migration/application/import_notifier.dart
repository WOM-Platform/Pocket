import 'dart:convert';
import 'dart:io';

import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/constants.dart';
import 'package:wom_pocket/src/application/aim_notifier.dart';
import 'package:wom_pocket/src/application/transactions_notifier.dart';
import 'package:wom_pocket/src/database/database.dart';
import 'package:wom_pocket/src/migration/data/migration_data.dart';
import 'package:wom_pocket/src/migration/ui/export_screen.dart';
import 'package:wom_pocket/src/models/transaction_model.dart';
import 'package:wom_pocket/src/screens/home/widgets/wom_stats_widget.dart';
import 'package:wom_pocket/src/screens/pin/pin_screen.dart';
import 'package:wom_pocket/src/services/transaction_repository.dart';
import 'package:wom_pocket/src/utils/utils.dart';

import '../../my_logger.dart';
import 'import_state.dart';

part 'import_notifier.g.dart';

@riverpod
class ImportNotifier extends _$ImportNotifier {
  ImportState build() {
    return ImportInitial();
  }

  Future<void> importWom(String password) async {
    try {
      state = ImportState.loading();
      final otc = ref.read(deeplinkProvider).otc;
      if (otc == null) throw Exception('Otc is null');
      final response =
          await ref.read(pocketProvider).getInfoAboutMigration(otc, password);
      print(response);
      final responseBytes = await ref
          .read(pocketProvider)
          .retrieveMigrationPayload(otc, password);
      // final file = File.fromRawPath(responseBytes);

      final dir = await getTemporaryDirectory();
      final partialKey = ref.read(deeplinkProvider).migrationPartialKey;
      final migrationDir = Directory('${dir.path}/migration/import');
      if (await migrationDir.exists()) {
        await migrationDir.delete(recursive: true);
      }
      await migrationDir.create(recursive: true);
      final bytes =
          Utils.decryptBytesWithAes(responseBytes, '$partialKey$password');
      final zipFile = File('${migrationDir.path}/zip_encrypted_wom_migration');
      await zipFile.writeAsBytes(bytes);
      await ZipFile.extractToDirectory(
          zipFile: zipFile, destinationDir: migrationDir);

      final womEncryptedJsonFile = File('${migrationDir.path}/woms');
      final womEncryptedJson = await womEncryptedJsonFile.readAsString();
      final map = Map.from(jsonDecode(womEncryptedJson));
      final list =
          List<Map<String, dynamic>>.from(map['woms']);
      final woms = list.map((e) => WomRow.fromJson(e)).toList();
      final device = map['device'] as String;
      print('Hai importato: ${woms.length}');

      final aims = <String?>{};

      for (int i = 0; i < woms.length; i++) {
        aims.add(woms[i].aim);
      }

      String tmp = "";
      aims.forEach((aim) {
        tmp = tmp + "$aim,";
      });

      final aimsString = tmp.substring(0, tmp.length - 1);
      logger.i(aimsString);
      logger.i(tmp);

      final tx = TransactionModel(
        id: 0,
        date: DateTime.now(),
        // country: "italy",
        size: woms.length,
        type: TransactionType.MIGRATION_IMPORT,
        source: device,
        aimCode: tmp,
      );

      // await ref.read(databaseProvider).deleteEverything();

      final tId = await ref
          .read(databaseProvider)
          .transactionsDao
          .addTransaction(tx.toTransactionCompanion());

      final finalWoms =
          woms.map((e) => e.copyWith(transactionId: tId)).toList();
      await ref
          .read(databaseProvider)
          .womsDao
          .addVouchers(finalWoms.map((w) => w.toCompanion(true)).toList());
      await Hive.box<MigrationData>(boxMigrationKey)
          .delete(exportedMigrationDataKey);
      ref.invalidate(fetchTransactionsProvider);
      ref.invalidate(womStatsProvider);
      state = ImportCompleted(woms.length);
    } catch (ex, st) {
      logger.e(ex);
      logger.e(st);
      state = ImportError(ex, st);
    }
  }
}
