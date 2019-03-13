import 'package:pocket/src/blocs/app_bloc.dart';
import 'package:pocket/src/screens/home/home_screen.dart';
import 'package:pocket/src/services/app_repository.dart';
import 'package:pocket/localization/localizations.dart';
import 'package:pocket/src/blocs/bloc_provider.dart' as myBlocProvider;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket/src/db/transaction_db.dart';
import 'package:pocket/src/screens/home/home.dart';
import 'package:pocket/src/screens/home/home_bloc.dart';
import 'package:pocket/src/screens/intro/intro.dart';
import 'package:pocket/src/screens/settings/settings.dart';
import 'package:pocket/src/screens/settings/settings_bloc.dart';
import 'package:pocket/src/screens/splash/splash_screen.dart';
import 'package:pocket/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

bool fakeModeVar = false;
String fakeData;

class App extends StatefulWidget {
  final AppRepository appRepository;

  App({Key key, @required this.appRepository}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AppBloc _appBloc;

  AppRepository get _appRepository => widget.appRepository;

  @override
  void initState() {
    _appBloc = AppBloc(_appRepository);
//    _appBloc.dispatch(AppStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      bloc: _appBloc,
      child: MaterialApp(
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
          routes: {
            '/': (context) => SplashScreen(),
            '/home': (context) {
              final homeProvider = myBlocProvider.BlocProvider(
                  child: HomeScreen2(), bloc: HomeBloc(TransactionDB.get()));
              return homeProvider;
            },
            '/intro': (context) {
              return IntroScreen();
            },
            '/settings': (context) {
              final settingsProvider = myBlocProvider.BlocProvider(
                  child: SettingsScreen(), bloc: SettingsBloc());
              return settingsProvider;
            },
          }),
    );
  }

//  void _navigateToRoute(BuildContext context, Widget route) {
//    WidgetsBinding.instance.scheduleFrameCallback(
//          (_) {
//        // When you AuthenticationState changed, and you have
//        // pushed a lot widgets, this pop all.
//        // You can change the name '/' for the name
//        // of your route that manage the AuthenticationState.
//        Navigator.popUntil(context, ModalRoute.withName('/'));
//
//        // Also you can change MaterialPageRoute
//        // for your custom implemetation
//        MaterialPageRoute newRoute = MaterialPageRoute(
//          builder: (BuildContext context) {
//            // WillPopScope for prevent to go to the previous
//            // route using the back button.
//            return WillPopScope(
//              onWillPop: () async {
//                // In Android remove this activity from the stack
//                // and return to the previous activity.
//                SystemNavigator.pop();
//                return false;
//              },
//              child: route,
//            );
//          },
//        );
//        Navigator.of(context).push(newRoute);
//      },
//    );
//  }

  @override
  void dispose() {
    _appBloc.dispose();
    super.dispose();
  }
}