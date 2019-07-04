import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocket/app.dart';
import 'package:pocket/src/services/app_repository.dart';
import 'package:pocket/src/utils/colors.dart';

import 'config.dart';

void main() {
  Config.appFlavor = Flavor.RELEASE;

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
