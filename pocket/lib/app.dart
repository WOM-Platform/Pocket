import 'package:pocket/src/blocs/pin/bloc.dart';
import 'package:pocket/src/blocs/suggestions/bloc.dart';
import 'package:pocket/src/blocs/transactions/bloc.dart';
import 'package:pocket/src/screens/home/home_screen.dart';
import 'package:pocket/src/screens/pin/pin_screen.dart';
import 'package:pocket/src/services/app_repository.dart';
import 'package:pocket/localization/localizations.dart';
import 'package:pocket/src/blocs/bloc_provider.dart' as myBlocProvider;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket/src/db/transaction_db.dart';
import 'package:pocket/src/screens/home/home_bloc.dart';
import 'package:pocket/src/screens/intro/intro.dart';
import 'package:pocket/src/screens/settings/settings.dart';
import 'package:pocket/src/screens/settings/settings_bloc.dart';
import 'package:pocket/src/screens/splash/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'src/blocs/app/bloc.dart';

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
  HomeBloc _homeBloc;

  TransactionsBloc _transactionsBloc;
  SuggestionsBloc _suggestionsBloc;

  AppRepository get _appRepository => widget.appRepository;

  @override
  void initState() {
    _homeBloc = HomeBloc(TransactionDB.get());
    _transactionsBloc = TransactionsBloc(TransactionDB.get());
    _suggestionsBloc = SuggestionsBloc();
    _appBloc = AppBloc(_appRepository, _transactionsBloc);

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
            primaryColor: Color(0xFF44455b),
            backgroundColor: Color(0xFFf6d785),
          ),
          home: BlocListener(
            bloc: _appBloc,
            listener: (ctx, state) {
              print("APP BLOC LISTENER ----> state is: $state");
              if (state is DeepLinkMode) {
                print("Go to pin screen");
//                var blocProviderPin = myBlocProvider.BlocProvider(
//                  bloc: PinBloc(),
//                  child: PinScreen(
//                    deepLinkModel: state.deepLinkModel,
//                  ),
//                );
                var blocProviderPin = BlocProvider(
                  bloc: PinBloc(state.deepLinkModel),
                  child: PinScreen(),
                );
                Navigator.push(
                  ctx,
                  MaterialPageRoute<bool>(
                      builder: (context) => blocProviderPin),
                ).then((value) {
                  _appBloc.dispatch(HomeEvent());
                });
              }
            },
            child: BlocBuilder(
                bloc: _appBloc,
                condition: (previous, current) {
                  final r = (previous != current) && (current is! DeepLinkMode);
                  return r;
                },
                builder: (ctx, AppState state) {
                  print("APP BLOC BUILDER ----> state is: $state");
                  if (state is LoadingData) {
                    return SplashScreen();
                  }

                  if (state is IntroMode) {
                    return IntroScreen();
                  }

                  if (state is NormalMode) {
//                    final homeProvider = myBlocProvider.BlocProvider(
//                        child: HomeScreen2(), bloc: _homeBloc);

                    final homeProvider = BlocProviderTree(
                      child: HomeScreen2(),
                      blocProviders: <BlocProvider>[
                        BlocProvider<TransactionsBloc>(bloc: _transactionsBloc),
                        BlocProvider<SuggestionsBloc>(bloc: _suggestionsBloc),
                      ],
                    );
                    return homeProvider;
                  }
                  return Container(
                    child: Center(
                      child: Text("Somethings is wrong"),
                    ),
                  );
                }),
          ),
          routes: {
            '/settings': (context) {
              final settingsProvider = myBlocProvider.BlocProvider(
                  child: SettingsScreen(), bloc: SettingsBloc());
              return settingsProvider;
            },
          }),
    );
  }

  @override
  void dispose() {
    _appBloc.dispose();
    _homeBloc.dispose();
    _transactionsBloc.dispose();
    _suggestionsBloc.dispose();
    super.dispose();
  }
}
