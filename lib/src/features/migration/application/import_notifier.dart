import 'dart:convert';
import 'dart:io';

import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/core/application/pocket_notifier.dart';
import 'package:wom_pocket/src/core/application/transactions_list/transactions_notifier.dart';
import 'package:wom_pocket/src/features/map/application/bloc.dart';
import 'package:wom_pocket/src/core/application/aim_notifier.dart';
import 'package:wom_pocket/src/core/database/database.dart';
import 'package:wom_pocket/src/features/exchange/application/exchange_notifier.dart';
import 'package:wom_pocket/src/core/models/transaction_model.dart';
import 'package:wom_pocket/src/features/root/widgets/wom_stats_widget.dart';
import 'package:wom_pocket/src/features/pin/pin_screen.dart';
import 'package:wom_pocket/src/core/utils/utils.dart';

import 'package:wom_pocket/src/core/my_logger.dart';
import 'package:wom_pocket/src/features/migration/application/import_state.dart';

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

      if (response.completed) {
        state = JustImported();
        return;
      }
      logger.i(response);
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
        zipFile: zipFile,
        destinationDir: migrationDir,
      );

      final womEncryptedJsonFile = File('${migrationDir.path}/woms');
      final womEncryptedJson = await womEncryptedJsonFile.readAsString();
      final map = Map.from(jsonDecode(womEncryptedJson));
      final womList = List<Map<String, dynamic>>.from(map['woms']);
      final totemList = List<Map<String, dynamic>>.from(map['totems'] ?? []);
      final woms = womList.map((e) => WomRow.fromJson(e)).toList();
      final totems = totemList.map((e) => TotemRow.fromJson(e)).toList();
      final device = map['device'] as String;
      logger.i('Hai importato: ${woms.length} wom');
      logger.i('Hai importato: ${totems.length} totems');

      final aims = <String?>{};

      for (int i = 0; i < woms.length; i++) {
        aims.add(woms[i].aim);
      }

      String tmp = '';
      aims.forEach((aim) {
        tmp = tmp + '$aim, ';
      });

      final aimsString = tmp.trim().substring(0, tmp.length - 1);
      logger.i(aimsString);
      logger.i(tmp);

      final tx = TransactionModel(
        id: 0,
        date: DateTime.now(),
        size: woms.length,
        type: TransactionType.MIGRATION_IMPORT,
        source: device,
        aimCode: tmp,
      );

      // await ref.read(getDatabaseProvider).deleteEverything();

      final tId = await ref
          .read(getDatabaseProvider)
          .transactionsDao
          .addTransaction(tx.toTransactionCompanion());

      await ref
          .read(getDatabaseProvider)
          .totemsDao
          .addTotems(totems.map((w) => w.toCompanion(true)).toList());

      final finalWoms =
          woms.map((e) => e.copyWith(transactionId: tId)).toList();
      await ref
          .read(getDatabaseProvider)
          .womsDao
          .addVouchers(finalWoms.map((w) => w.toCompanion(true)).toList());
      await ref.read(pocketProvider).completeMigration(otc, password);

      ref.invalidate(exchangeNotifierProvider);
      ref.invalidate(availableWomCountProvider);
      ref.invalidate(fetchTransactionsProvider);
      ref.invalidate(mapNotifierProvider);
      ref.invalidate(totalWomCountProvider);
      state = ImportCompleted(woms.length);
    } catch (ex, st) {
      logger.e('importWom', error: ex, stackTrace: st);
      state = ImportError(ex, st);
    }
  }
}
