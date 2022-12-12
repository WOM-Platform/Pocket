/*
import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wom_pocket/src/application/aim_notifier.dart';
import 'package:wom_pocket/src/database/extensions.dart';
import 'package:wom_pocket/src/migration/data/migration_data.dart';
import 'package:wom_pocket/src/services/transaction_repository.dart';
import 'package:wom_pocket/src/utils/utils.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../constants.dart';

part 'export_notifier.g.dart';

*/
/*final exportNotifierProvider =
    StateNotifierProvider<ExportNotifier, ExportState>((ref) {
  final migrationData =
      Hive.box<MigrationData>(boxMigrationKey).get(exportedMigrationDataKey);

  return ExportNotifier(
    ref,
    migrationData != null
        ? ExportState.completed(migrationData)
        : ExportState.loading(),
  );
});*//*


@riverpod
class ExportNotifier extends _$ExportNotifier {
  FutureOr<MigrationData> build(String? pin) async {
    final migrationData =
        Hive.box<MigrationData>(boxMigrationKey).get(exportedMigrationDataKey);

    if (migrationData != null) {
      return migrationData;
    }
    return await _exportWom(pin);
  }

  Future _exportWom(String? pin) async {
    if (pin == null) {
      throw Exception();
    }

    try {
      // state = ExportLoading();
      final integerPin = int.tryParse(pin);
      if (integerPin == null) {
        throw Exception('pin must to be integer');
      }

      // v2 all in connector
      // final vouchers = await WomDB.get().getAllWoms();
      // final response =
      //     await read(pocketProvider).createNewMigrationV2(vouchers, pin);

      // v1
      final data = await exportWomToJson(pin);
      final response =
          await ref.read(pocketProvider).createNewMigration(data.bytes, pin);

      final migrationData =
          MigrationData.fromMigrationResponse(response, data.partialKey);
      await Hive.box<MigrationData>(boxMigrationKey)
          .put(exportedMigrationDataKey, migrationData);
      await ref.read(databaseProvider).deleteEverything();
      return migrationData;
    } catch (ex, st) {
      // state = ExportError(Exception(ex.toString()));
      print(st);
      rethrow;
    }
  }

  Future<WomExportData> exportWomToJson(String pin) async {
    final woms = (await ref.read(databaseProvider).womsDao.getAllWoms);
    if (woms.isEmpty) {
      print('woms empty');
      throw Exception('Woms table is Empty');
    }
    final dir = await getTemporaryDirectory();
    print(dir.path);
    final path = '${dir.path}/wom_migration';
    final file = File(path);
    if (await file.exists()) {
      await file.delete();
    }
    print('wom da esportare: ${woms.length}');
    final jsonString = jsonEncode(woms.map((e) => e.toJson()).toList());
    final key = Utils.getRandomString(28);
    final bytes = Utils.encryptWithAes(jsonString, '$key$pin');
    await file.writeAsBytes(bytes);
    print(file.path);
    return WomExportData(file.path, bytes, key);
  }
}
*/
