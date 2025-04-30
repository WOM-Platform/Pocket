import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:wom_pocket/src/core/routing/router.dart';
import 'package:wom_pocket/src/features/exchange/ui/screens/exchange_screen.dart';
import 'package:wom_pocket/src/features/exchange/ui/screens/exchange_receipt.dart';
import 'package:wom_pocket/src/features/new_home/ui/new_home.dart';
import 'package:wom_pocket/src/features/scanner/ui/scan_screen.dart';

final _shellNavigatorExchangeKey = GlobalKey<NavigatorState>();

final exchangeStatefulShell = StatefulShellBranch(
  navigatorKey: _shellNavigatorExchangeKey,
  routes: [ExchangeRoute()],
);

class ExchangeRoute extends GoRoute {
  ExchangeRoute()
      : super(
          path: '/exchange',
          // config: HomeTabRouteConfig(),
          parentNavigatorKey: _shellNavigatorExchangeKey,
          // redirect: (context, state) {
          // Scroll to top of the shell route.
          // final goRouter = GoRouter.of(rootNavigatorKey.currentContext!);
          // final routes = goRouter.routerDelegate.currentConfiguration.routes;
          // context.read<AppShellScrollCubit>().startIfOnShell(routes, state);

          // return null;
          // },
          builder: (context, state) {
            return ExchangeScreen();
          },
          routes: [
            GoRoute(
              path: 'new/:count',
              parentNavigatorKey: rootNavigatorKey,
              builder: (context, state) {
                final count = int.parse(state.pathParameters['count'] ?? '0');
                return NewExchangeScreen(
                  womCount: count,
                );
              },
            ),
            GoRoute(
              path: 'receipt',
              parentNavigatorKey: rootNavigatorKey,
              builder: (context, state) {
                final data = state.extra as ExchangeReceiptData;
                return ExchangeReceiptScreen(
                  data: data,
                );
              },
            ),
          ],
        );
}
