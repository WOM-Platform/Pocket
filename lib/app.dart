import 'package:feature_discovery/feature_discovery.dart';
import 'package:pocket/src/blocs/pin/bloc.dart';
import 'package:pocket/src/blocs/settings/bloc.dart';
import 'package:pocket/src/blocs/suggestions/bloc.dart';
import 'package:pocket/src/blocs/transactions_list/transactions_list_bloc.dart';
import 'package:pocket/src/my_logger.dart';
import 'package:pocket/src/screens/home/home_screen.dart';
import 'package:pocket/src/screens/pin/pin_screen.dart';
import 'package:pocket/src/services/app_repository.dart';
import 'package:pocket/localization/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket/src/db/transaction_db.dart';
import 'package:pocket/src/screens/intro/intro.dart';
import 'package:pocket/src/screens/settings/settings.dart';
import 'package:pocket/src/screens/splash/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pocket/src/utils/colors.dart';

import 'src/blocs/app/bloc.dart';

bool fakeModeVar = false;
String? fakeData;

class App extends StatefulWidget {
  final AppRepository appRepository;

  App({Key? key, required this.appRepository}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late AppBloc _appBloc;

//  HomeBloc _homeBloc;
  late PinBloc _pinBloc;

  TransactionsListBloc? _transactionsBloc;
  late SuggestionsBloc _suggestionsBloc;

  AppRepository get _appRepository => widget.appRepository;

  @override
  void initState() {
//    _homeBloc = HomeBloc(TransactionDB.get());
    _transactionsBloc = TransactionsListBloc(TransactionDB.get());
    _suggestionsBloc = SuggestionsBloc();
    _appBloc = AppBloc(_appRepository, _transactionsBloc);
//    _appBloc.add(AppStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      create: (context) => _appBloc,
      child: MaterialApp(
//          locale: DevicePreview.of(context).locale, // <--- Add the locale
//          builder: DevicePreview.appBuilder, // <--- Add the build
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            if (locale == null) {
              return supportedLocales.first;
            }

            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          supportedLocales: [
            const Locale('en', 'US'),
            const Locale('it', 'IT'),
          ],
          theme: ThemeData(
            primaryColor: primaryColor,
            accentColor: accentColor,
            backgroundColor: backgroundColor,
          ),
          home: BlocListener<AppBloc, AppState>(
            listener: (ctx, state) {
              logger.i("APP BLOC LISTENER ----> state is: $state");
              if (state is DeepLinkMode) {
                logger.i("Go to pin screen");
//                var blocProviderPin = myBlocProvider.BlocProvider(
//                  bloc: PinBloc(),
//                  child: PinScreen(
//                    deepLinkModel: state.deepLinkModel,
//                  ),
//                );
                _pinBloc = PinBloc(state.deepLinkModel);
                var blocProviderPin = BlocProvider(
                  create: (context) => _pinBloc,
                  child: PinScreen(),
                );
                Navigator.push(
                  ctx,
                  MaterialPageRoute<bool>(
                      builder: (context) => blocProviderPin),
                ).then((value) {
                  _appBloc.add(HomeEvent());
                });
              }
            },
            child:
                BlocBuilder<AppBloc, AppState>(buildWhen: (previous, current) {
              final r = (previous != current) && (current is! DeepLinkMode);
              return r;
            }, builder: (ctx, AppState state) {
              logger.i("APP BLOC BUILDER ----> state is: $state");

              if (state is IntroMode) {
                return IntroScreen();
              }

              if (state is NormalMode) {
//                    final homeProvider = myBlocProvider.BlocProvider(
//                        child: HomeScreen2(), bloc: _homeBloc);

                final homeProvider = MultiBlocProvider(
                  child: FeatureDiscovery(
                    child: HomeScreen2(),
                  ),
                  providers: <BlocProvider>[
                    BlocProvider<TransactionsListBloc>(
                        create: (context) => _transactionsBloc!),
                    BlocProvider<SuggestionsBloc>(
                        create: (context) => _suggestionsBloc),
                  ],
                );
                return homeProvider;
              }
              return SplashScreen();
            }),
          ),
          routes: {
            '/settings': (context) {
              final settingsProvider = BlocProvider<SettingsBloc>(
                create: (context) => SettingsBloc(),
                child: SettingsScreen(),
              );
              return settingsProvider;
            },
          }),
    );
  }

  @override
  void dispose() {
//    _appBloc.dispose();
//    _homeBloc.dispose();
//    _transactionsBloc.dispose();
//    _suggestionsBloc.dispose();
//    _pinBloc?.dispose();
    super.dispose();
  }
}
