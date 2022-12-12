import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wom_pocket/app.dart';
import 'package:wom_pocket/src/services/app_repository.dart';
import 'package:wom_pocket/src/utils/colors.dart';
import 'package:wom_pocket/src/utils/config.dart';
import 'package:wom_pocket/app.dart';
import 'package:wom_pocket/src/migration/data/migration_data.dart';

import 'constants.dart';
import 'src/utils/utils.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await Hive.initFlutter();
    Hive.registerAdapter(MigrationDataAdapter());
    await Hive.openBox('settings');
    final box = await Hive.openBox<MigrationData>('migration');
    final migrationData = box.get(exportedMigrationDataKey);
    flavor = Flavor.RELEASE;
    domain = 'wom.social';
    registryKey = await Utils.getPublicKey();
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: primaryColor,
        systemNavigationBarColor: primaryColor,
        statusBarBrightness: Brightness.light, //iOS
        statusBarIconBrightness: Brightness.light, //Android
      ),
    );

    runApp(
      App(
        migrationData: migrationData,
      ),
    );
  },
      (error, stack) =>
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
}

//https://link.wom.social/vouchers/69b20bd6-0d12-4793-97ab-5e01c193320f
//https://link.wom.social/vouchers/a769134e-b2af-4c3c-bdf0-013dc609de7c

// adb shell am start -a android.intent.action.VIEW -d https://link.dev.wom.social/migration/65a2056f-c745-4b12-97b2-18daf4b95314/TpbZJvpickSHuVAHEmiQXStzq2je
// adb shell am start -a android.intent.action.VIEW -d https://link.wom.social/vouchers/aca81697-1e93-49d0-be20-5e3897d09296

//fvm flutter build apk --flavor development -t lib/main_dev.dart
//xcrun simctl openurl booted https://dev.wom.social/vouchers/5722523d-3257-493e-9107-d8954a1fcd91

//xcrun simctl openurl booted https://link.dev.wom.social/vouchers/2bfa24d3-27a7-4a45-816c-39826fc210dd
