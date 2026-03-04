
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wom_pocket/src/core/routing/router.dart';


import 'package:flutter/material.dart';
import 'package:wom_pocket/src/core/utils/colors.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ThemeData(
      useMaterial3: false,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
    );

    return OKToast(
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        localeResolutionCallback: (locale, supportedLocales) {
          if (locale == null) {
            Intl.defaultLocale = supportedLocales.first.toString();
            return supportedLocales.first;
          }

          for (final supportedLocale in supportedLocales) {
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
            surface: backgroundColor,
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
      ),
    );
  }
}

