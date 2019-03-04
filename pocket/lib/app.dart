import 'package:pocket/localization/localizations.dart';
import 'package:pocket/src/blocs/bloc_provider.dart';
import 'package:pocket/src/db/transaction_db.dart';
import 'package:pocket/src/screens/home/home.dart';
import 'package:pocket/src/screens/home/home_bloc.dart';
import 'package:pocket/src/screens/intro/intro.dart';
import 'package:pocket/src/screens/settings/settings.dart';
import 'package:pocket/src/screens/settings/settings_bloc.dart';
import 'package:pocket/src/screens/splash/splash.dart';
import 'package:pocket/src/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pocket/tmp.dart';

bool fakeModeVar = false;
String fakeData;

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
      //home: SplashScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) {
          final homeProvider = BlocProvider(
              child: HomeScreen(), bloc: HomeBloc(TransactionDB.get()));
          return homeProvider;
        },
        '/intro': (context) {
          return IntroScreen();
        },
        '/settings': (context) {
          final settingsProvider = BlocProvider(
              child: SettingsScreen(), bloc: SettingsBloc());
          return settingsProvider;
        },
      },
    );
  }
}
