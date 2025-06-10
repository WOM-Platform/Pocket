import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:wom_pocket/src/core/routing/router.dart';
import 'package:wom_pocket/src/features/badge/data/badge.dart';
import 'package:wom_pocket/src/features/badge/data/challenge.dart';
import 'package:wom_pocket/src/features/badge/ui/badge_details_screen.dart';
import 'package:wom_pocket/src/features/badge/ui/badge_screen.dart';
import 'package:wom_pocket/src/features/badge/ui/challenge_details_screen.dart';
import 'package:wom_pocket/src/features/exchange/ui/screens/exchange_receipt.dart';
import 'package:wom_pocket/src/features/map/map_screen.dart';
import 'package:wom_pocket/src/features/migration/data/migration_data.dart';
import 'package:wom_pocket/src/features/migration/ui/export_screen.dart';
import 'package:wom_pocket/src/features/new_home/ui/new_home.dart';
import 'package:wom_pocket/src/features/new_home/ui/stats_screen.dart';
import 'package:wom_pocket/src/features/settings/settings.dart';
import 'package:wom_pocket/src/features/transaction/ui/transactions_screen.dart';

final _shellNavigatorBadgeKey = GlobalKey<NavigatorState>();

final badgeStatefulShell = StatefulShellBranch(
  navigatorKey: _shellNavigatorBadgeKey,
  routes: [BadgeRoutes()],
);

class BadgeRoutes extends GoRoute {
  BadgeRoutes()
      : super(
          path: '/badge',
          parentNavigatorKey: _shellNavigatorBadgeKey,
          builder: (context, state) {
            return BadgeScreen();
          },
          routes: [
            GoRoute(
              path: 'details',
              parentNavigatorKey: rootNavigatorKey,
              builder: (context, state) {
                final b = state.extra as BadgeData;
                return BadgeDetailsScreen(
                  badge: b,
                );
              },
            ),
            GoRoute(
              parentNavigatorKey: rootNavigatorKey,
              path: 'challenge',
              builder: (context, state) {
                final c = state.extra as ChallengeData?;
                return ChallengeDetailsScreen(
                  challenge: c,
                );
              },
            ),
            GoRoute(
              parentNavigatorKey: rootNavigatorKey,
              path: 'challenge/:challengeId',
              builder: (context, state) {
                return ChallengeDetailsScreen(
                  challengeId: state.pathParameters['challengeId'],
                );
              },
            ),
          ],
        );
}
