import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:wom_pocket/src/my_logger.dart';
import 'package:wom_pocket/src/utils/config.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;
import 'app.dart';
import 'constants.dart';
import 'main.dart';
import 'src/utils/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };

  // Drift DB
/*  final database = MyDatabase();
  final allAims = await database.select(database.aims).get();
  allAims.forEach(print);
  final woms = await database.select(database.wom).get();
  print(woms.length);
  print(woms[0]);
  final myTransactions = await database.select(database.transactions).get();
  print(myTransactions.length);
  print(myTransactions[0]);*/

  // Firebase
  await Firebase.initializeApp();
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);

  // Hive
  await Hive.initFlutter();
  await Hive.openBox('settings');

  flavor = Flavor.DEVELOPMENT;
  domain = 'dev.wom.social';
  logger = Logger(
    printer: PrettyPrinter(
      noBoxingByDefault: true,
      printEmojis: false,
    ),
    filter: ReleaseFilter(),
    output: DevOutput(),
  );
  logger.i('DEV VERSION');
  registryKey = await Utils.getPublicKey();
  mapStyle = await rootBundle.loadString('assets/map_style.txt');
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.red,
  ));

  runApp(FeatureDiscovery(
      child: ProviderScope(
    child: EasyLocalization(
      supportedLocales: [Locale('en'), Locale('it')],
      path: 'assets/lang',
      // <-- change the path of the translation files
      fallbackLocale: Locale('it'),
      child: App(),
    ),
  )));
}
