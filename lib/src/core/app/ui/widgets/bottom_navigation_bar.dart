import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wom_pocket/src/core/app/application/app_shell_notifier.dart';
import 'package:wom_pocket/src/core/app/application/app_shell_state.dart';
import 'package:wom_pocket/src/core/utils/colors.dart';

class MyBottomNavigationBar extends ConsumerStatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  ConsumerState<MyBottomNavigationBar> createState() =>
      _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends ConsumerState<MyBottomNavigationBar> {
  /// Called when widget is rebuilt.
  ///
  /// Checks the current path to determine which icon should be selected.
  int _getBottomNavigationIndex(BuildContext context, AppShellState state) {
    final activeTabsPaths = state.activeTabsPaths;
    if (activeTabsPaths.isEmpty) {
      return 0;
    }
    final currentConfiguration = GoRouter.of(
      context,
    ).routerDelegate.currentConfiguration;
    final routeDelegatePath = currentConfiguration.fullPath;
    final statePath = GoRouterState.of(context).fullPath ?? '';
    final selectedTabIndex = activeTabsPaths.contains(routeDelegatePath)
        ? activeTabsPaths.indexOf(routeDelegatePath)
        : activeTabsPaths.indexOf(statePath);
    final routes = currentConfiguration.routes;
    // if (selectedTabIndex < 0 && routes.lastOrNull is CustomShellRoute) {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     context.goToRoute(const HomeTabRoute());
    //   });
    // }
    return selectedTabIndex < 0 ? 0 : selectedTabIndex;
  }

  /// Called when the user taps on an item.
  ///
  /// Converts the [index] into the real page to open based on the [state].
  void _onItemTap(AppShellState state, int index) {
    // final currentPath = GoRouterState.of(context).fullPath!;
    final nextPath = state.activeTabsPaths[index];
    ref.read(appShellProvider.notifier).switchToTab(nextPath);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(appShellProvider);
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primaryColor,
      selectedLabelStyle: TextStyle(fontSize: 12),
      unselectedItemColor: Color(0xFF96BBD9),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.discount),
          label: 'offers'.tr(),
        ),
        BottomNavigationBarItem(
          icon: Icon(MdiIcons.handCoin),
          label: 'exchange'.tr(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.connect_without_contact),
          label: 'connections'.tr(),
        ),
        BottomNavigationBarItem(
          icon: Icon(MdiIcons.hexagon),
          label: 'achievement'.tr(),
        ),
      ],
      currentIndex: _getBottomNavigationIndex(context, state),
      onTap: (index) => _onItemTap(state, index),
      // onTap: (i) {
      //   if (index.value == i) return;
      //   if (i == 0) {
      //     logEvent('open_home');
      //   } else if (i == 1) {
      //     logEvent('open_offers');
      //   } else if (i == 2) {
      //     logEvent('open_settings');
      //   }
      //   index.value = i;
      // },
    );
  }
}
