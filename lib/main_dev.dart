import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wom_pocket/src/my_logger.dart';
import 'package:wom_pocket/src/services/app_repository.dart';
import 'package:wom_pocket/src/utils/config.dart';
import 'package:pocket/src/blocs/migration/migration_data.dart';


import 'app.dart';
import 'constants.dart';
import 'src/utils/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  await Hive.initFlutter();
  Hive.registerAdapter(MigrationDataAdapter());
  await Hive.openBox('settings');
  final box = await Hive.openBox<MigrationData>('migration');
  final migrationData = box.get(exportedMigrationDataKey);
  logger.i('DEV VERSION');
  flavor = Flavor.DEVELOPMENT;
  domain = 'dev.wom.social';
  registryKey = await Utils.getPublicKey();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.red,
  ));

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => App(
        appRepository: AppRepository(),
        migrationData: migrationData,
      ),
    );
  },
      (error, stack) =>
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
}
