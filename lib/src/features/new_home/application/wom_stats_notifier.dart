import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/core/application/aim_notifier.dart';
import 'package:wom_pocket/src/core/application/transactions_list/transactions_list_state.dart';
import 'package:wom_pocket/src/core/application/transactions_list/transactions_notifier.dart';
import 'package:wom_pocket/src/core/models/aim_percentage.dart';
import 'package:wom_pocket/src/features/badge/application/badge_notifier.dart';

part 'wom_stats_notifier.g.dart';

@riverpod
Future<List<AimInPercentage>> fetchAimInPercentage(
  Ref ref,
) async {
  return ref.watch(getDatabaseProvider).womsDao.getAimInPercentage();
}

@riverpod
Future<int> fetchWomCountEarnedInTheLastWeek(
  Ref ref,
) async {
  return ref.watch(getDatabaseProvider).womsDao.getWomCountEarnedLastWeek();
}

@riverpod
Future<int> fetchWomCountSpentInTheLastWeek(
  Ref ref,
) async {
  return ref.watch(getDatabaseProvider).womsDao.getWomCountSpentLastWeek();
}

@riverpod
Future<int> fetchWomSpent(FetchWomSpentRef ref) async {
  return ref.watch(getDatabaseProvider).womsDao.getWomCountSpent();
}

@Riverpod(keepAlive: true)
class TransactionCountNotifier extends _$TransactionCountNotifier {
  int _count = 0;

  FutureOr<int> build() async {
    final state = await ref.watch(fetchTransactionsProvider.future);
    if (state is TransactionsLoaded) {
      _count = state.transactions.length;
      return _count;
    }
    return _count;
  }
}

@riverpod
(int, int) getBadgesStats(
  Ref ref,
) {
  final state = ref.watch(badgeNotifierProvider).valueOrNull;
  if (state == null) {
    return (0, 0);
  }

  final allBadges = [
    ...state.badges,
    ...state.challenges.expand((c) => c.badges),
  ];
  return (allBadges.length, allBadges.where((b) => b.achieved).length);
}
