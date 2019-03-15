import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocket/app.dart';
import 'package:pocket/src/services/app_repository.dart';
import 'package:pocket/src/utils/colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: baseIconColor,
  ));

  runApp(App(
    appRepository: AppRepository(),
  ));
}
