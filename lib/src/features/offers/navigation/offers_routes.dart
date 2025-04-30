import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wom_pocket/src/core/routing/router.dart';
import 'package:wom_pocket/src/features/in_app_webview/ui/in_app_webview.dart';
import 'package:wom_pocket/src/features/map/map_screen.dart';
import 'package:wom_pocket/src/features/new_home/ui/new_home.dart';
import 'package:wom_pocket/src/features/offers/ui/map_screen.dart';
import 'package:wom_pocket/src/features/offers/ui/offers_screen.dart';
import 'package:wom_pocket/src/features/offers/ui/pos_details_screen.dart';
import 'package:wom_pocket/src/features/offers/ui/suggestion.dart';
import 'package:wom_pocket/src/features/scanner/ui/scan_screen.dart';

final _shellNavigatorOffersKey = GlobalKey<NavigatorState>();

final offersStatefulShell = StatefulShellBranch(
  navigatorKey: _shellNavigatorOffersKey,
  routes: [OffersRoute()],
);

class OffersRoute extends GoRoute {
  OffersRoute()
      : super(
          path: '/offers',
          // config: HomeTabRouteConfig(),
          parentNavigatorKey: _shellNavigatorOffersKey,
          // redirect: (context, state) {
          // Scroll to top of the shell route.
          // final goRouter = GoRouter.of(rootNavigatorKey.currentContext!);
          // final routes = goRouter.routerDelegate.currentConfiguration.routes;
          // context.read<AppShellScrollCubit>().startIfOnShell(routes, state);

          // return null;
          // },
          builder: (context, state) {
            return OffersListScreen();
          },
          routes: [
            GoRoute(
              path: 'map',
              parentNavigatorKey: rootNavigatorKey,
              builder: (context, state) {
                final data = state.extra as LatLng?;
                return OfferMapsScreen(position: data);
              },
              routes: [
                GoRoute(
                  path: 'pos-details',
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (context, state) {
                    final data = state.extra as PosDetailsData;
                    return POSDetailsScreen(data: data);
                  },
                  routes: [
                    GoRoute(
                      path: 'external-info',
                      parentNavigatorKey: rootNavigatorKey,
                      builder: (context, state) {
                        final url = state.uri.queryParameters['url'];
                        return InAppWebViewScreen(
                          url:url ?? '',
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            GoRoute(
              path: 'pos-details',
              parentNavigatorKey: rootNavigatorKey,
              builder: (context, state) {
                final data = state.extra as PosDetailsData;
                return POSDetailsScreen(data: data);
              },
              routes: [
                GoRoute(
                  path: 'external-info',
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (context, state) {
                    final url = state.uri.queryParameters['url'];
                    return InAppWebViewScreen(
                      url: url ?? '',
                    );
                  },
                ),
              ],
            ),
          ],
        );
}
