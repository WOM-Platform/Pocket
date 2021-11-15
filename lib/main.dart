import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pocket/app.dart';
import 'package:pocket/src/blocs/migration/migration_data.dart';
import 'package:pocket/src/services/app_repository.dart';
import 'package:pocket/src/utils/colors.dart';
import 'package:pocket/src/utils/config.dart';

import 'constants.dart';
import 'src/utils/utils.dart';

void main() async {
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

  runApp(App(
    appRepository: AppRepository(),
    migrationData: migrationData,
  ));
}
