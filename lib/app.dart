import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/src/application/app_notifier.dart';
import 'package:wom_pocket/src/blocs/migration/migration_data.dart';
import 'package:wom_pocket/src/blocs/pin/bloc.dart';
import 'package:wom_pocket/src/blocs/suggestions/bloc.dart';
import 'package:wom_pocket/src/blocs/transactions_list/transactions_list_bloc.dart';
import 'package:wom_pocket/src/my_logger.dart';
import 'package:wom_pocket/src/screens/home/home_screen.dart';
import 'package:wom_pocket/src/screens/migration/export_screen.dart';
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

  final MigrationData? migrationData;

  App({Key? key, this.migrationData}) : super(key: key);

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
      accentColor: accentColor,
      backgroundColor: backgroundColor,
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
          theme: themeData.copyWith(
            colorScheme: themeData.colorScheme.copyWith(secondary: accentColor),
          ),
          home: migrationData != null ? MigrationExportScreen() : GateWidget(),
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
    ref.listen<AsyncValue<AppState>>(appNotifierProvider, (previous, next) {
      logger.i("APP BLOC LISTENER ----> state is: $next");
      if (next is AsyncData) {
        final data = next.value;
        if (data is DeepLinkMode) {
          logger.i("Go to pin screen");
          // _pinBloc = PinBloc(state.value);
          // _pinBloc = PinBloc(state.deepLinkModel);
          // var blocProviderPin = BlocProvider(
          //   create: (context) => _pinBloc,
          //   child: PinScreen(),
          // );
          Navigator.push(
            context,
            MaterialPageRoute<bool>(
              builder: (context) => ProviderScope(
                overrides: [
                  deeplinkProvider.overrideWithValue(data.deepLinkModel)
                ],
                child: PinScreen(),
              ),
            ),
          ).then((value) {
            ref.read(appNotifierProvider.notifier).goIntoNormalMode();
            // _appBloc.add(HomeEvent());
          });
        }
      }
    });

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
