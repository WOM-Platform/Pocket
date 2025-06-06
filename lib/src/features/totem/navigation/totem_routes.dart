import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:wom_pocket/src/core/routing/router.dart';
import 'package:wom_pocket/src/core/ui/screens/crop_image.dart';
import 'package:wom_pocket/src/features/totem/ui/edit_my_totem_screen.dart';
import 'package:wom_pocket/src/features/totem/ui/my_totem_screen.dart';
import 'package:wom_pocket/src/features/totem/ui/search_screen.dart';
import 'package:wom_pocket/src/features/totem/ui/totem_details.dart';
import 'package:wom_pocket/src/features/totem/ui/connections_screen.dart';

final _shellNavigatorTotemKey = GlobalKey<NavigatorState>();

final totemStatefulShell = StatefulShellBranch(
  navigatorKey: _shellNavigatorTotemKey,
  routes: [TotemRoute()],
);

class TotemRoute extends GoRoute {
  TotemRoute()
      : super(
          path: '/totem',
          parentNavigatorKey: _shellNavigatorTotemKey,
          builder: (context, state) {
            return TotemScansScreen();
          },
          routes: [
            GoRoute(
              path: 'map',
              parentNavigatorKey: rootNavigatorKey,
              builder: (_, state) {
                final data = state.extra as TotemMapData;
                return TotemMapScreen(data: data);
              },
            ),
            GoRoute(
              path: 'search',
              parentNavigatorKey: rootNavigatorKey,
              builder: (_, state) {
                return SearchScreen();
              },
            ),
            GoRoute(
              path: 'account',
              parentNavigatorKey: rootNavigatorKey,
              builder: (_, state) {
                return MyTotemScreen();
              },
              routes: [
                GoRoute(
                  path: 'edit',
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (_, state) {
                    final name = state.uri.queryParameters['name'];
                    final email = state.uri.queryParameters['email'];
                    final phone = state.uri.queryParameters['phone'];
                    final website = state.uri.queryParameters['website'];
                    return EditMyTotemScreen(
                      name: name,
                      email: email,
                      phone: phone,
                      website: website,
                    );
                  },
                ),
              ],
            ),
            GoRoute(
              path: 'image-crop',
              parentNavigatorKey: rootNavigatorKey,
              builder: (_, state) {
                final imageBytes = state.extra as Uint8List;
                return ConfigurableCrop(imageBytes);
              },
            ),
          ],
        );
}
