import 'dart:convert';
import 'dart:io';

import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:drift/drift.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wom_pocket/src/application/aim_notifier.dart';
import 'package:wom_pocket/src/application/transactions_notifier.dart';
import 'package:wom_pocket/src/blocs/map/bloc.dart';
import 'package:wom_pocket/src/database/database.dart';
import 'package:wom_pocket/src/exchange/application/exchange_notifier.dart';
import 'package:wom_pocket/src/migration/application/migration_state.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/migration/data/migration_data.dart';
import 'package:wom_pocket/src/my_logger.dart';
import 'package:wom_pocket/src/new_home/application/wom_stats_notifier.dart';
import 'package:wom_pocket/src/screens/home/widgets/wom_stats_widget.dart';
import 'package:wom_pocket/src/services/transaction_repository.dart';
import 'package:wom_pocket/src/utils/utils.dart';

part 'migration_notifier.g.dart';

@riverpod
class MigrationNotifier extends _$MigrationNotifier {
  MigrationState build() {
    return MigrationStateInitial();
  }

  addPin(String pin) async {
    try {
      state = MigrationStateLoading();
      final woms = (await ref.read(getDatabaseProvider).womsDao.getAllWoms);
      state = MigrationStateData(pin: pin, woms: woms);
    } catch (ex, st) {
      logger.e(ex);
      state = MigrationStateError(ex, st);
    }
  }

  Future exportWom() async {
    final currentState = state;
    if (currentState is! MigrationStateData) {
      return;
    }

    state = MigrationStateLoading();
    final pin = currentState.pin;
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

      final link = '${response.link}/${data.partialKey}';
      final migrationData = MigrationData(
        code: pin,
        link: link,
        importDeadline: response.deadline,
      );

      await ref.read(getDatabaseProvider).womsDao.deleteTable();

      await ref.read(getDatabaseProvider).transactionsDao.addTransaction(
            TransactionsCompanion.insert(
                source: '',
                aim: '',
                timestamp: DateTime.now().millisecondsSinceEpoch,
                type: TransactionType.MIGRATION_EXPORT.index,
                size: data.womCount,
                pin: Value(pin),
                link: Value(link),
                deadline:
                    Value(migrationData.importDeadline.millisecondsSinceEpoch)),
          );
      ref.invalidate(exchangeNotifierProvider);
      ref.invalidate(fetchTransactionsProvider);
      ref.invalidate(totalWomCountProvider);
      ref.invalidate(mapNotifierProvider);
      ref.invalidate(availableWomCountProvider);
      ref.invalidate(fetchWomCountEarnedInTheLastWeekProvider);
      ref.invalidate(fetchWomCountSpentInTheLastWeekProvider);
      logger.i(migrationData.link);
      state = MigrationStateComplete(data: migrationData);
    } catch (ex, st) {
      print(st);
      state = MigrationStateError(ex, st);
    }
  }

  Future<WomExportData> exportWomToJson(String pin) async {
    final woms = (await ref.read(getDatabaseProvider).womsDao.getAllWoms);
    if (woms.isEmpty) {
      print('woms empty');
      throw Exception('Woms table is Empty');
    }
    final dir = await getTemporaryDirectory();
    print(dir.path);
    final migrationDir = Directory('${dir.path}/migration/export');
    final file = File('${migrationDir.path}/woms');
    if (await migrationDir.exists()) {
      await migrationDir.delete(recursive: true);
    }
    await migrationDir.create(recursive: true);
    print('wom da esportare: ${woms.length}');

    final device = await _getDevice();
    final map = <String, dynamic>{
      'device': device,
      'woms': woms.map((e) => e.toJson()).toList(),
    };

    final jsonString = jsonEncode(map);
    await file.writeAsString(jsonString);

    final zipFile = File('${migrationDir.path}/zip_wom_migration');
    await ZipFile.createFromFiles(
        sourceDir: migrationDir, files: [file], zipFile: zipFile);

    final zippedBytes = await zipFile.readAsBytes();
    final key = Utils.getRandomString(28);
    final bytes = Utils.encryptBytesWithAes(zippedBytes, '$key$pin');
    // final encryptedFile = File('${migrationDir.path}/encrypted_zip_woms');
    // await encryptedFile.writeAsBytes(bytes);
    // logger.wtf(bytes.length / 1000);
    // print(file.path);
    return WomExportData(file.path, bytes, key, woms.length);
  }

  _getDevice() async {
    try {
      final deviceInfoPlugin = DeviceInfoPlugin();

      String device = '';

      if (Platform.isAndroid) {
        final deviceInfo =
            await deviceInfoPlugin.deviceInfo as AndroidDeviceInfo;
        device = deviceInfo.model;
      } else if (Platform.isIOS) {
        final deviceInfo = await deviceInfoPlugin.deviceInfo as IosDeviceInfo;
        device = deviceInfo.utsname.machine ?? '';
      }
      return device;
    } catch (ex) {
      return '';
    }
  }
}
