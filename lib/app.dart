import 'dart:io';

import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wom_pocket/src/core/application/app_notifier.dart';
import 'package:wom_pocket/src/core/application/app_state.dart';
import 'package:wom_pocket/src/features/migration/application/import_notifier.dart';
import 'package:wom_pocket/src/features/migration/ui/import_screen.dart';
import 'package:wom_pocket/src/core/models/deep_link_model.dart';
import 'package:wom_pocket/src/core/models/totem_data.dart';
import 'package:wom_pocket/src/core/my_logger.dart';
import 'package:wom_pocket/src/features/nfc/utils.dart';
import 'package:wom_pocket/src/features/root/root_screen.dart';
import 'package:wom_pocket/src/features/pin/pin_screen.dart';

import 'package:wom_pocket/src/features/intro/intro.dart';
import 'package:wom_pocket/src/features/settings/settings.dart';
import 'package:wom_pocket/src/features/splash/splash_screen.dart';

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
        },
      ),
    );
  }
}

class GateWidget extends ConsumerWidget {
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
                Navigator.push(
                  context,
                  MaterialPageRoute<bool>(
                    builder: (context) => ProviderScope(
                      overrides: [
                        deeplinkProvider.overrideWithValue(deepLink),
                        importNotifierProvider,
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
                      overrides: [deeplinkProvider.overrideWithValue(deepLink)],
                      child: PinScreen(),
                    ),
                  ),
                );
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
}
