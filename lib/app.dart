
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wom_pocket/src/core/routing/router.dart';


import 'package:flutter/material.dart';
import 'package:wom_pocket/src/core/utils/colors.dart';

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
        // routes: {
        //   '/': (_) => GateWidget(),
        //   '/settings': (context) => SettingsScreen(),
        // },
      ),
    );
  }
}

/*class GateWidget extends ConsumerWidget {
  const GateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appNotifierProvider);
    ref.listen<AsyncValue<String?>>(
      deepLinkNotifierProvider,
      (previous, next) {
        logger.i('APP BLOC LISTENER ----> state is: $next');
        if (next is AsyncData) {
          final data = next.value;
          if (data == null) return;
          final totemData = validateTotemQrCodeWithRegex(data);
          if (totemData != null) {
            launchTotemDialog(context, totemData);
          } else {
            try {
              logger.i('AppNotifier uri : $data');
              final deepLink = DeepLinkModel.fromUri(Uri.parse(data));

              if (deepLink.type == TransactionType.MIGRATION_IMPORT) {
                context.go('/import', extra: deepLink);
              } else {
                context.go('/pin', extra: deepLink);
              }
            } on PlatformException catch (ex, st) {
              logger.e(
                'AppRepository: error getting deep link',
                error: ex,
                stackTrace: st,
              );
            } on FormatException catch (ex, st) {
              logger.e('Error getting deep link', error: ex, stackTrace: st);
            } catch (ex, st) {
              logger.e('Error getting deep link', error: ex, stackTrace: st);
            }
          }
        }
      },
    );

    if (Platform.isAndroid) {
      ref.listen<AsyncValue<TotemData?>>(nfcBackgroundNotifierProvider,
          (previous, next) async {
        logger.i('getNfcIntentProvider new intent');
        final currentState = next;
        if (currentState is AsyncData && currentState.value != null) {
          await launchTotemDialog(context, currentState.requireValue!);
          ref.read(nfcBackgroundNotifierProvider.notifier).unlock();
        }
      });
    }
    logger.i('APP BLOC BUILDER ----> state is: $state');

    if (state is AsyncData) {
      final data = state.value;
      if (data is IntroMode) {
        return IntroScreen();
      }

      if (data is NormalMode) {
        return RootScreen();
      }
    }
    return SplashScreen();
  }
}*/
