import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocket/app.dart';
import 'package:pocket/src/services/app_repository.dart';
import 'package:pocket/src/utils/colors.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:wom_package/wom_package.dart' show Config, Flavor;

void main() {
  Config.appFlavor = Flavor.RELEASE;
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
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
  ));
}
