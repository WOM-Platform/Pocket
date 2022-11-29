import 'dart:convert';
import 'dart:io';

import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wom_pocket/src/application/aim_notifier.dart';
import 'package:wom_pocket/src/blocs/migration/export_state.dart';
import 'package:wom_pocket/src/blocs/migration/wom_export.dart';
import 'package:wom_pocket/src/database/database.dart';
import 'package:wom_pocket/src/db/app_db.dart';
import 'package:wom_pocket/src/db/wom_db.dart';
import 'package:wom_pocket/src/screens/migration/export_screen.dart';
import 'package:wom_pocket/src/services/transaction_repository.dart';
import 'package:wom_pocket/src/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../../constants.dart';
import '../../my_logger.dart';
import 'import_state.dart';
import 'migration_data.dart';

final importNotifierProvider =
StateNotifierProvider<ImportNotifier, ImportState>((ref) {
  return ImportNotifier(ref, ImportState.loading()
    // migrationData != null
    //     ? ExportState.completed(migrationData)
    //     : ExportState.loading(),
  );
});

class ImportNotifier extends StateNotifier<ImportState> {
  final Ref ref;

  ImportNotifier(this.ref, state) : super(state ?? const ImportState.loading());

  Future<void> importWom(String password) async {
    try {
      final otc = ref
          .read(deepModelProvider)
          .otc;
      if (otc == null) throw Exception('Otc is null');
      final response =
      await ref.read(pocketProvider).getInfoAboutMigration(otc, password);
      print(response);
      final responseBytes = await ref
          .read(pocketProvider)
          .retrieveMigrationPayload(otc, password);
      // final file = File.fromRawPath(responseBytes);
      final partialKey = ref
          .read(deepModelProvider)
          .migrationPartialKey;
      final json = Utils.decryptWithAes(responseBytes, '$partialKey$password');
      final list = List<Map<String, dynamic>>.from(jsonDecode(json));
      final woms = list.map((e) => WomRow.fromJson(e)).toList();
      print('Hai importato: ${woms.length}');
      await ref.read(databaseProvider).deleteEverything();

      // await ref
      //     .read(databaseProvider)
      //     .womsDao
      //     .addVouchers(woms.map((w) => WomCompanion.insert
      //     id:w.id).toList());
      // await WomDB.get().importVouchers(woms, 12);
    } catch (ex, st) {
      logger.e(ex);
      logger.e(st);
    }
  }
}
