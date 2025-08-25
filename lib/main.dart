import 'package:easy_localization/easy_localization.dart';

// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:wom_pocket/app.dart';
import 'package:wom_pocket/src/core/my_logger.dart';
import 'package:wom_pocket/src/core/utils/colors.dart';
import 'package:wom_pocket/src/core/utils/config.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:wom_pocket/src/core/constants.dart';
import 'package:wom_pocket/src/core/utils/utils.dart';

late String mapStyle;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Intl
  await EasyLocalization.ensureInitialized();

  // Hive
  await Hive.initFlutter();
  await Hive.openBox('settings');

  flavor = Flavor.RELEASE;
  domain = 'wom.social';
  logger = Logger(
    filter: !isDev && !kDebugMode ? ReleaseFilter() : null,
    output: !isDev && !kDebugMode ? DevOutput() : null,
  );
  registryKey = await Utils.getPublicKey();
  mapStyle = await rootBundle.loadString('assets/map_style.txt');

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: primaryColor,
      systemNavigationBarColor: primaryColor,
      statusBarBrightness: Brightness.light, //iOS
      statusBarIconBrightness: Brightness.light, //Android
    ),
  );

  if (kDebugMode) {
    // Override the default error handling to prevent silent errors
    // from being displayed in the console.
    //
    // In debug mode, we mimic the behavior of not reporting silent errors
    // to Sentry by customizing the error handling process.
    FlutterError.onError = (details) {
      if (details.silent) return;
      FlutterError.presentError(details);
    };
    return startApp();
  }

  // Sentry
  Logger.addLogListener((event) {
    if (event.level == Level.error) {
      Sentry.captureException(
        event.error,
        stackTrace: event.stackTrace,
      );
    }
  });

  //Initialize Sentry for error reporting in production mode
  return SentryFlutter.init(
        (options) {
      options.dsn = 'https://347c6f42c15716fcc049221092932fd3@o4509545347874816.ingest.de.sentry.io/4509545373040720';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
      options.debug = !kReleaseMode;
      options.tracesSampler = (_) => 1.0;
    },
    appRunner: startApp,
  );
}

startApp() {
  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: [
          Locale('en'),
          Locale('it'),
        ],
        path: 'assets/lang',
        // <-- change the path of the translation files
        fallbackLocale: Locale('it'),
        child: App(),
      ),
    ),
  );
}

//https://link.wom.social/vouchers/69b20bd6-0d12-4793-97ab-5e01c193320f
//https://link.wom.social/vouchers/a769134e-b2af-4c3c-bdf0-013dc609de7c

// adb shell am start -a android.intent.action.VIEW -d https://link.dev.wom.social/vouchers/4f4ef4b1-e57b-4517-8eda-75db59caddc2
// adb shell am start -a android.intent.action.VIEW -d wom://transfer/4f4ef4b1-e57b-4517-8eda-75db59caddc2
// adb shell am start -a android.intent.action.VIEW -d https://link.wom.social/vouchers/aca81697-1e93-49d0-be20-5e3897d09296
// adb shell am start -a android.intent.action.VIEW -d https://link.wom.social/connection/Y%2FuOjyJxoidfPNRywyfGqlDopl0kECI29TO1LV43JnJJqfKv8Hmaw%2BnQW8D27fRxIHtdWTId3gyXk2fZeYmS3MNiKMvGAo%2FnjyyvTEcBhxGms263zTKA7D6gvlNwSP2Q

//fvm flutter build apk --flavor development -t lib/main_dev.dart
//xcrun simctl openurl booted https://dev.wom.social/vouchers/5722523d-3257-493e-9107-d8954a1fcd91

//xcrun simctl openurl booted https://link.wom.social/connection/Y%2FuOjyJxoidfPNRywyfGqlDopl0kECI29TO1LV43JnJJqfKv8Hmaw%2BnQW8D27fRxIHtdWTId3gyXk2fZeYmS3MNiKMvGAo%2FnjyyvTEcBhxGms263zTKA7D6gvlNwSP2Q

