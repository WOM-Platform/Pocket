

import 'package:equatable/equatable.dart';

class AppShellState extends Equatable {
  /// Contains the list of all active tabs paths
  ///
  /// For example, if the rewards tab is not enabled, the AppShell will contain
  /// all tabs but this list will not contain its path, which makes navigation
  /// to it impossible.
  final List<String> activeTabsPaths;

  /// Last time we refreshed the app.
  final int? lastRefreshTimestamp;


  final bool isBottomNavigationVisible;

  const AppShellState({
    this.lastRefreshTimestamp,
    this.activeTabsPaths = const [],
    this.isBottomNavigationVisible = true,
  });

  /// Wether we should refresh the app or not.
  ///
  /// Returns `true` if the app hasn't been refresh in the last 60 seconds.
  bool get shouldRefreshOnResume {
    final sixtySecondsInMillis = const Duration(seconds: 60).inMilliseconds;
    final nowTimestamp = DateTime.now().millisecondsSinceEpoch;

    final passedTime = nowTimestamp - (lastRefreshTimestamp ?? nowTimestamp);
    return passedTime > sixtySecondsInMillis;
  }

  AppShellState copyWith({
    int? lastRefreshTimestamp,
    List<String>? activeTabsPaths,
    bool? isBottomNavigationVisible,
  }) {
    return AppShellState(
      lastRefreshTimestamp: lastRefreshTimestamp ?? this.lastRefreshTimestamp,
      activeTabsPaths: activeTabsPaths ?? this.activeTabsPaths,
      isBottomNavigationVisible:
      isBottomNavigationVisible ?? this.isBottomNavigationVisible,
    );
  }

  @override
  List<Object?> get props => [
    lastRefreshTimestamp,
    activeTabsPaths,
    isBottomNavigationVisible,
  ];
}
