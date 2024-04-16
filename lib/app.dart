import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wom_pocket/src/application/app_notifier.dart';
import 'package:wom_pocket/src/application/app_state.dart';
import 'package:wom_pocket/src/migration/application/import_notifier.dart';
import 'package:wom_pocket/src/migration/ui/import_screen.dart';
import 'package:wom_pocket/src/models/deep_link_model.dart';
import 'package:wom_pocket/src/my_logger.dart';
import 'package:wom_pocket/src/screens/home/home_screen.dart';
import 'package:wom_pocket/src/screens/pin/pin_screen.dart';

import 'package:wom_pocket/src/screens/intro/intro.dart';
import 'package:wom_pocket/src/screens/settings/settings.dart';
import 'package:wom_pocket/src/screens/splash/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:wom_pocket/src/utils/colors.dart';

bool fakeModeVar = false;
String? fakeData;

class App extends ConsumerWidget {

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ThemeData(
      useMaterial3: false,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
    );

    return OKToast(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
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
          theme: themeData.copyWith(
            textTheme: GoogleFonts.ralewayTextTheme(themeData.textTheme),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: primaryColor,
              selectedItemColor: accentColor,
              unselectedItemColor: Colors.white,
            ),
            colorScheme: themeData.colorScheme.copyWith(
              secondary: accentColor,
              background: backgroundColor,
            ),
          ),
          builder: (context, child) {
            // Obtain the current media query information.
            final mediaQueryData = MediaQuery.of(context);

            return MediaQuery(
              data: mediaQueryData.copyWith(textScaler: TextScaler.linear(1.0)),
              child: child!,
            );
          },
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
        return FeatureDiscovery(
          child: HomeScreen2(),
        );
      }
    }
    return SplashScreen();
  }
}
