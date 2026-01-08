import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:wom_pocket/src/core/database/database.dart';
import 'package:wom_pocket/src/core/log_output.dart';
import 'package:wom_pocket/src/core/routing/router.dart';
import 'package:wom_pocket/src/features/intro/intro.dart';
import 'package:wom_pocket/src/features/migration/ui/migration_screen.dart';
import 'package:wom_pocket/src/features/settings/settings.dart';
import 'package:wom_pocket/src/features/settings/table_page/db_page.dart';

final _shellNavigatorSettingsKey = GlobalKey<NavigatorState>();

/*final settingsStatefulShell = StatefulShellBranch(
  navigatorKey: _shellNavigatorSettingsKey,
  routes: [SettingsRoute()],
);*/

class SettingsRoute extends GoRoute {
  SettingsRoute()
    : super(
        path: '/settings',
        // config: HomeTabRouteConfig(),
        // parentNavigatorKey: _shellNavigatorSettingsKey,
        // redirect: (context, state) {
        // Scroll to top of the shell route.
        // final goRouter = GoRouter.of(rootNavigatorKey.currentContext!);
        // final routes = goRouter.routerDelegate.currentConfiguration.routes;
        // context.read<AppShellScrollCubit>().startIfOnShell(routes, state);

        // return null;
        // },
        builder: (context, state) {
          return SettingsScreen();
        },
        routes: [
          GoRoute(
            path: 'intro',
            parentNavigatorKey: rootNavigatorKey,
            builder: (_, __) => IntroScreen(fromSettings: true),
          ),
          GoRoute(
            path: 'logs',
            parentNavigatorKey: rootNavigatorKey,
            builder: (_, __) => LogOutputScreen(),
          ),
          GoRoute(
            path: 'migration',
            parentNavigatorKey: rootNavigatorKey,
            builder: (_, __) => MigrationScreen(),
          ),
          GoRoute(
            path: 'wom-db-table',
            parentNavigatorKey: rootNavigatorKey,
            builder: (_, state) {
              final woms = state.extra as List<WomRow>? ?? [];
              return WomDbTablePage(woms: woms);
            },
          ),
        ],
      );
}
