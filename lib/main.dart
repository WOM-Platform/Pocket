import 'dart:async';

import 'package:feature_discovery/feature_discovery.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wom_pocket/app.dart';
import 'package:wom_pocket/src/utils/colors.dart';
import 'package:wom_pocket/src/utils/config.dart';

import 'constants.dart';
import 'src/utils/utils.dart';

late String mapStyle;

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await Hive.initFlutter();
    await Hive.openBox('settings');
    flavor = Flavor.RELEASE;
    domain = 'wom.social';
    registryKey = await Utils.getPublicKey();
    mapStyle = await rootBundle.loadString('assets/map_style.txt');
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
      FeatureDiscovery(child: App()),
    );
  },
      (error, stack) =>
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
}

//https://link.wom.social/vouchers/69b20bd6-0d12-4793-97ab-5e01c193320f
//https://link.wom.social/vouchers/a769134e-b2af-4c3c-bdf0-013dc609de7c

// adb shell am start -a android.intent.action.VIEW -d https://link-dev.wom.social/vouchers/9ea48018-e062-42cb-9ceb-b94d877d3be8
// adb shell am start -a android.intent.action.VIEW -d https://link.wom.social/vouchers/aca81697-1e93-49d0-be20-5e3897d09296

//fvm flutter build apk --flavor development -t lib/main_dev.dart
//xcrun simctl openurl booted https://dev.wom.social/vouchers/5722523d-3257-493e-9107-d8954a1fcd91

//xcrun simctl openurl booted https://link.dev.wom.social/vouchers/2bfa24d3-27a7-4a45-816c-39826fc210dd
