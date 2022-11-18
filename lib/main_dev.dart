import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wom_pocket/src/blocs/migration/migration_data.dart';
import 'package:wom_pocket/src/database/database.dart';
import 'package:wom_pocket/src/my_logger.dart';
import 'package:wom_pocket/src/services/app_repository.dart';
import 'package:wom_pocket/src/utils/config.dart';

import 'app.dart';
import 'constants.dart';
import 'src/utils/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Drift DB
  final database = MyDatabase();
  final allAims = await database.select(database.aims).get();
  allAims.forEach(print);
  final woms = await database.select(database.wom).get();
  print(woms.length);
  print(woms[0]);
  final myTransactions = await database.select(database.transactions).get();
  print(myTransactions.length);
  print(myTransactions[0]);

  // Firebase
  await Firebase.initializeApp();
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);

  // Hive
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
    App(
      appRepository: AppRepository(),
      migrationData: migrationData,
    ),
  );
}
