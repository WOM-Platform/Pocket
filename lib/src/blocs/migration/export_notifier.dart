import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pocket/src/blocs/migration/export_state.dart';
import 'package:pocket/src/db/app_db.dart';
import 'package:pocket/src/db/wom_db.dart';
import 'package:pocket/src/services/transaction_repository.dart';
import 'package:pocket/src/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../../constants.dart';
import 'migration_data.dart';

final exportNotifierProvider =
    StateNotifierProvider<ExportNotifier, ExportState>((ref) {
  final migrationData =
      Hive.box<MigrationData>(boxMigrationKey).get(exportedMigrationDataKey);

  return ExportNotifier(
    ref.read,
    migrationData != null
        ? ExportState.completed(migrationData)
        : ExportState.loading(),
  );
});

class ExportNotifier extends StateNotifier<ExportState> {
  final Reader read;
  ExportNotifier(this.read, state)
      : super(state ?? const ExportState.loading());

  Future exportWom(String pin) async {
    try {
      state = ExportLoading();
      final integerPin = int.tryParse(pin);
      if (integerPin == null) {
        throw Exception('pin must to be integer');
      }

      // v2 all in connector
      // final vouchers = await WomDB.get().getAllWoms();
      // final response =
      //     await read(pocketProvider).createNewMigrationV2(vouchers, pin);

      // v1
      final data = await Utils.exportWomToJson(pin);
      final response =
          await read(pocketProvider).createNewMigration(data.bytes, pin);

      final migrationData =
          MigrationData.fromMigrationResponse(response, data.partialKey);
      await Hive.box<MigrationData>(boxMigrationKey)
          .put(exportedMigrationDataKey, migrationData);
      // TODO clean wom db
      // await AppDatabase.get().deleteDb();
      state = ExportCompleted(migrationData);
    } catch (ex) {
      state = ExportError(Exception(ex.toString()));
    }
  }
}