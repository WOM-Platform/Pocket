import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:wom_pocket/src/core/routing/router.dart';
import 'package:wom_pocket/src/features/exchange/ui/screens/exchange_receipt.dart';
import 'package:wom_pocket/src/features/map/map_screen.dart';
import 'package:wom_pocket/src/features/migration/data/migration_data.dart';
import 'package:wom_pocket/src/features/migration/ui/export_screen.dart';
import 'package:wom_pocket/src/features/new_home/ui/new_home.dart';
import 'package:wom_pocket/src/features/new_home/ui/stats_screen.dart';
import 'package:wom_pocket/src/features/transaction/ui/transactions_screen.dart';

final _shellNavigatorHomeKey = GlobalKey<NavigatorState>();

final homeStatefulShell = StatefulShellBranch(
  navigatorKey: _shellNavigatorHomeKey,
  routes: [HomeRoutes()],
);

class HomeRoutes extends GoRoute {
  HomeRoutes()
      : super(
          path: '/',
          parentNavigatorKey: _shellNavigatorHomeKey,
          builder: (context, state) {
            return NewHome();
          },
          routes: [
            GoRoute(
              path: 'stats',
              parentNavigatorKey: rootNavigatorKey,
              builder: (context, state) => StatsScreen(),
            ),
            GoRoute(
              path: 'wom-map',
              parentNavigatorKey: rootNavigatorKey,
              builder: (context, state) => MapScreen(),
            ),
            GoRoute(
              path: 'transactions',
              parentNavigatorKey: rootNavigatorKey,
              builder: (context, state) => TransactionsScreen(),
              routes: [
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
                GoRoute(
                  path: 'migration',
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (context, state) {
                    final data = state.extra as MigrationData;
                    return MigrationExportScreen(
                      data: data,
                      backTo: false,
                    );
                  },
                ),
              ],
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
            GoRoute(
              path: 'migration',
              parentNavigatorKey: rootNavigatorKey,
              builder: (context, state) {
                final data = state.extra as MigrationData;
                return MigrationExportScreen(
                  data: data,
                  backTo: false,
                );
              },
            ),
          ],
        );
}
