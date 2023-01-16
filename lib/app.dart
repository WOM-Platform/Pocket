import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:wom_pocket/src/application/app_notifier.dart';
import 'package:wom_pocket/src/migration/application/import_notifier.dart';
import 'package:wom_pocket/src/migration/data/migration_data.dart';
import 'package:wom_pocket/src/blocs/pin/bloc.dart';
import 'package:wom_pocket/src/blocs/suggestions/bloc.dart';
import 'package:wom_pocket/src/blocs/transactions_list/transactions_list_bloc.dart';
import 'package:wom_pocket/src/migration/ui/import_screen.dart';
import 'package:wom_pocket/src/models/deep_link_model.dart';
import 'package:wom_pocket/src/my_logger.dart';
import 'package:wom_pocket/src/screens/home/home_screen.dart';
import 'package:wom_pocket/src/migration/ui/export_screen.dart';
import 'package:wom_pocket/src/screens/pin/pin_screen.dart';
import 'package:wom_pocket/src/services/app_repository.dart';
import 'package:wom_pocket/localization/app_localizations.dart';

import 'package:wom_pocket/src/db/transaction_db.dart';
import 'package:wom_pocket/src/screens/intro/intro.dart';
import 'package:wom_pocket/src/screens/settings/settings.dart';
import 'package:wom_pocket/src/screens/splash/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wom_pocket/src/utils/colors.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/blocs/app/bloc.dart';

bool fakeModeVar = false;
String? fakeData;

class App extends ConsumerWidget {
  // final AppRepository appRepository;

  App({Key? key}) : super(key: key);

//   @override
//   State<App> createState() => _AppState();
// }
//
// class _AppState extends State<App> {
//   // late AppBloc _appBloc;
//
//   late PinBloc _pinBloc;
//
//   TransactionsListBloc? _transactionsBloc;
//   late SuggestionsBloc _suggestionsBloc;
//
//   // AppRepository get _appRepository => widget.appRepository;
//
//   @override
//   void initState() {
//     _transactionsBloc = TransactionsListBloc(TransactionDB.get());
//     _suggestionsBloc = SuggestionsBloc();
//     // _appBloc = AppBloc(_appRepository, _transactionsBloc);
//     super.initState();
//   }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ThemeData(
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      scaffoldBackgroundColor: backgroundColor
    );

    return ProviderScope(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
//          locale: DevicePreview.of(context).locale, // <--- Add the locale
//          builder: DevicePreview.appBuilder, // <--- Add the build
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            if (locale == null) {
              Intl.defaultLocale = supportedLocales.first.toString();
              return supportedLocales.first;
            }

            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                Intl.defaultLocale = supportedLocale.toString();
                return supportedLocale;
              }
            }
            Intl.defaultLocale = supportedLocales.first.toString();
            return supportedLocales.first;
          },
          supportedLocales: [
            const Locale('it', 'IT'),
            const Locale('en', 'US'),
          ],
          theme: themeData.copyWith(
            textTheme: GoogleFonts.ralewayTextTheme(themeData.textTheme),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: primaryColor,
              selectedItemColor: accentColor,
              unselectedItemColor: Colors.white,
            ),
            colorScheme: themeData.colorScheme.copyWith(secondary: accentColor),
          ),
          builder: (context, child) {
            // Obtain the current media query information.
            final mediaQueryData = MediaQuery.of(context);

            return MediaQuery(
              data: mediaQueryData.copyWith(textScaleFactor: 1.0),
              child: child!,
            );
          },
          // home: GateWidget(),
          // : BlocListener<AppBloc, AppState>(
          //     listener: (ctx, state) {
          //       logger.i("APP BLOC LISTENER ----> state is: $state");
          //       if (state is DeepLinkMode) {
          //         logger.i("Go to pin screen");
          //         _pinBloc = PinBloc(state.deepLinkModel);
          //         _pinBloc = PinBloc(state.deepLinkModel);
          //         var blocProviderPin = BlocProvider(
          //           create: (context) => _pinBloc,
          //           child: PinScreen(),
          //         );
          //         Navigator.push(
          //           ctx,
          //           MaterialPageRoute<bool>(
          //               builder: (context) => blocProviderPin),
          //         ).then((value) {
          //           _appBloc.add(HomeEvent());
          //         });
          //       }
          //     },
          //     child: BlocBuilder<AppBloc, AppState>(
          //         buildWhen: (previous, current) {
          //       final r =
          //           (previous != current) && (current is! DeepLinkMode);
          //       return r;
          //     }, builder: (ctx, AppState state) {
          //       logger.i("APP BLOC BUILDER ----> state is: $state");
          //
          //       if (state is IntroMode) {
          //         return IntroScreen();
          //       }
          //
          //       if (state is NormalMode) {
          //         final homeProvider = MultiBlocProvider(
          //           child: FeatureDiscovery(
          //             child: HomeScreen2(),
          //           ),
          //           providers: <BlocProvider>[
          //             BlocProvider<TransactionsListBloc>(
          //                 create: (context) => _transactionsBloc!),
          //             BlocProvider<SuggestionsBloc>(
          //                 create: (context) => _suggestionsBloc),
          //           ],
          //         );
          //         return homeProvider;
          //       }
          //       return SplashScreen();
          //     }),
          //   ),
          routes: {
            '/': (_) => GateWidget(),
            '/settings': (context) => SettingsScreen(),
          }),
    );
  }
}

class GateWidget extends ConsumerWidget {
  const GateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appNotifierProvider);
    ref.listen<AsyncValue<DeepLinkModel?>>(
      deepLinkNotifierProvider,
      (previous, next) {
        logger.i("APP BLOC LISTENER ----> state is: $next");
        if (next is AsyncData) {
          final data = next.value;
          if (data != null) {
            // _pinBloc = PinBloc(state.value);
            // _pinBloc = PinBloc(state.deepLinkModel);
            // var blocProviderPin = BlocProvider(
            //   create: (context) => _pinBloc,
            //   child: PinScreen(),
            // );
            if (data.type == TransactionType.MIGRATION_IMPORT) {
              Navigator.push(
                context,
                MaterialPageRoute<bool>(
                  builder: (context) => ProviderScope(
                    overrides: [
                      deeplinkProvider.overrideWithValue(data),
                      importNotifierProvider
                    ],
                    child: ImportScreen(),
                  ),
                ),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute<bool>(
                  builder: (context) => ProviderScope(
                    overrides: [deeplinkProvider.overrideWithValue(data)],
                    child: PinScreen(),
                  ),
                ),
              );
            }
          }
        }
      },
    );

    logger.i("APP BLOC BUILDER ----> state is: $state");

    if (state is AsyncData) {
      final data = state.value;
      if (data is IntroMode) {
        return IntroScreen();
      }

      if (data is NormalMode) {
        /*final homeProvider = MultiBlocProvider(
        child: FeatureDiscovery(
          child: HomeScreen2(),
        ),
        providers: <BlocProvider>[
          // BlocProvider<TransactionsListBloc>(
          //     create: (context) => _transactionsBloc!),
          // BlocProvider<SuggestionsBloc>(create: (context) => _suggestionsBloc),
        ],
      );*/
        return FeatureDiscovery(
          child: HomeScreen2(),
        );
      }
    }
    return SplashScreen();
  }
}
