import 'dart:io';

import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wom_pocket/src/core/app/app_shell.dart';
import 'package:wom_pocket/src/core/application/app_notifier.dart';
import 'package:wom_pocket/src/core/models/deep_link_model.dart';
import 'package:wom_pocket/src/core/models/totem_data.dart';
import 'package:wom_pocket/src/core/my_logger.dart';
import 'package:wom_pocket/src/core/utils/utils.dart';
import 'package:wom_pocket/src/features/badge/application/badge_notifier.dart';
import 'package:wom_pocket/src/features/badge/navigation/badge_routes.dart';
import 'package:wom_pocket/src/features/exchange/navigation/exchange_routes.dart';
import 'package:wom_pocket/src/features/in_app_webview/ui/in_app_webview.dart';
import 'package:wom_pocket/src/features/migration/ui/import_screen.dart';
import 'package:wom_pocket/src/features/new_home/navigation/home_routes.dart';
import 'package:wom_pocket/src/features/nfc/utils.dart';
import 'package:wom_pocket/src/features/offers/navigation/offers_routes.dart';
import 'package:wom_pocket/src/features/pin/pin_screen.dart';
import 'package:wom_pocket/src/features/scanner/ui/scan_screen.dart';
import 'package:wom_pocket/src/features/settings/navigation/settings_routes.dart';
import 'package:wom_pocket/src/features/splash/splash_screen.dart';
import 'package:wom_pocket/src/features/totem/navigation/totem_routes.dart';
import 'package:wom_pocket/src/features/totem/utils.dart';
import 'package:wom_pocket/src/features/transaction/application/transaction_notifier.dart';
import 'package:wom_pocket/src/features/transaction/ui/transaction_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final branches = [
  homeStatefulShell,
  offersStatefulShell,
  exchangeStatefulShell,
  totemStatefulShell,
  badgeStatefulShell,
];

final _appRoutes = <GoRoute>[
  SettingsRoute(),
  GoRoute(
    path: '/scan',
    builder: (context, state) => ScanScreen(),
  ),
  GoRoute(
    path: '/in-app-webview/:url',
    builder: (context, state) {
      return InAppWebViewScreen(
        url: state.pathParameters['url'],
      );
    },
  ),
  GoRoute(
    path: '/pin',
    builder: (context, state) {
      final deepLink = state.extra as DeepLinkModel;
      return PinScreen(
        deepLinkModel: deepLink,
      );
    },
  ),
  GoRoute(
    path: '/transaction',
    builder: (context, state) {
      final params = state.extra as TransactionNotifierParams?;
      // if(params==null){
      //
      // }
      return TransactionScreen(
        params: params!,
      );
    },
  ),
  GoRoute(
    path: '/import',
    builder: (context, state) {
      final deepLinkModel = state.extra as DeepLinkModel?;
      return ImportScreen(
        deepLinkModel: deepLinkModel!,
      );
    },
  ),
  GoRoute(
    path: '/splash',
    builder: (context, state) => SplashScreen(),
  ),
];

// GoRouter configuration
final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      pageBuilder: (context, state, navigationShell) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: Consumer(
            builder: (context, ref, child) {
              ref.listen(badgeNotifierProvider, (_, __) {});

              ref.listen<AsyncValue<String?>>(
                deepLinkNotifierProvider,
                (previous, next) {
                  logger.i('Router APP BLOC LISTENER ----> state is: $next');
                  if (next is AsyncData) {
                    final data = next.value;
                    if (data == null) return;

                    // resettiamo il deep link per evitare di aprire di nuovo
                    // il flusso con lo stesso deep link
                    ref.read(deepLinkNotifierProvider.notifier).reset();

                    // verifichiamo se è un deep link di tipo totem (cmi)
                    final totemData = validateTotemQrCodeWithRegex(data);
                    final connectionLink = validatePersonalConnection(data);
                    final challenge = validateChallenge(data);
                    if (challenge != null) {
                      final challengeId = getChallengeIdFromLink(data);
                      if (challengeId != null) {
                        context.push('/badge/challenge/$challengeId');
                      }
                    } else if (connectionLink != null) {
                      launchConnectionDialog(context, data);
                    } else if (totemData != null) {
                      // TODO check how handle dialog with GoRouter
                      launchTotemDialog(context, totemData);
                    } else {
                      try {
                        logger.i('Router AppNotifier uri : $data');
                        final deepLink = DeepLinkModel.fromUri(Uri.parse(data));

                        if (deepLink.type == TransactionType.MIGRATION_IMPORT) {
                          context.push('/import', extra: deepLink);
                        } else {
                          context.push('/pin', extra: deepLink);
                        }
                      } on PlatformException catch (ex, st) {
                        logger.e(
                          'Router AppRepository: error getting deep link',
                          error: ex,
                          stackTrace: st,
                        );
                      } on FormatException catch (ex, st) {
                        logger.e('Router Error getting deep link',
                            error: ex, stackTrace: st);
                      } catch (ex, st) {
                        logger.e(
                          'Router Error getting deep link',
                          error: ex,
                          stackTrace: st,
                        );
                      }
                    }
                  }
                },
              );

              if (Platform.isAndroid) {
                ref.listen<AsyncValue<TotemData?>>(
                    nfcBackgroundNotifierProvider, (previous, next) async {
                  logger.i('Router getNfcIntentProvider new intent');
                  final currentState = next;
                  if (currentState is AsyncData && currentState.value != null) {
                    await launchTotemDialog(
                      context,
                      currentState.requireValue!,
                    );
                    ref.read(nfcBackgroundNotifierProvider.notifier).unlock();
                  }
                });
              }

              return child!;
            },
            child: AppShell(
              navigationShell: navigationShell,
            ),
          ),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
      branches: branches,
    ),
    ..._appRoutes,
  ],
);
