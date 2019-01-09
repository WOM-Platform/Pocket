import 'package:borsellino/localization/localizations.dart';
import 'package:borsellino/src/prova.dart';
import 'package:borsellino/src/screens/splash/splash.dart';
import 'package:borsellino/src/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WOM Pocket App",
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('it', ''),
      ],
      theme: ThemeData(
        primaryColor: primaryColor,
        backgroundColor: backgroundColor,
//        canvasColor: backgroundColor,
      ),
      home: SplashScreen(),
    );
  }
}

