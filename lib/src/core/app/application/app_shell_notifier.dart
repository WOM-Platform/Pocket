import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:wom_pocket/src/core/app/application/app_shell_state.dart';

part 'app_shell_notifier.g.dart';

@Riverpod(keepAlive: true)
class AppShellNotifier extends _$AppShellNotifier {
  /// The NavigationShell that contains routes information
  StatefulNavigationShell? _navigationShell;

  @override
  AppShellState build() {
    return AppShellState();
  }

  void setNavigationShell(dynamic navigationShell) {
    if (_navigationShell == null) {
      _navigationShell = navigationShell;
      final activeTabsPaths = <String>[];
      _navigationShell!.route.branches.forEach((branch) {
        final path = branch.defaultRoute!.path;
        activeTabsPaths.add(path);
      });
      state = state.copyWith(activeTabsPaths: activeTabsPaths);
    }
  }

  /// Navigates to a specific path within the navigation shell.
  ///
  /// This method searches for the branch with the specified path and navigates
  /// to it if found. If the path is not found, the method returns without
  /// performing any navigation.
  void switchToTab(String path) {
    if (_navigationShell == null) return;
    final index = _navigationShell!.route.branches
        .indexWhere((element) => element.defaultRoute?.path == path);

    if (index == -1) return;

    _navigationShell!.goBranch(index);
  }
}
