import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/core/application/aim_notifier.dart';
import 'package:wom_pocket/src/core/application/transactions_notifier.dart';
import 'package:wom_pocket/src/core/blocs/transactions_list/bloc.dart';
import 'package:wom_pocket/src/core/models/aim_percentage.dart';

part 'wom_stats_notifier.g.dart';

@riverpod
Future<List<AimInPercentage>> fetchAimInPercentage(
    FetchAimInPercentageRef ref,) async {
  return ref.watch(getDatabaseProvider).womsDao.getAimInPercentage();
}

@riverpod
Future<int> fetchWomCountEarnedInTheLastWeek(
    FetchWomCountEarnedInTheLastWeekRef ref,) async {
  return ref.watch(getDatabaseProvider).womsDao.getWomCountEarnedLastWeek();
}

@riverpod
Future<int> fetchWomCountSpentInTheLastWeek(
    FetchWomCountSpentInTheLastWeekRef ref,) async {
  return ref.watch(getDatabaseProvider).womsDao.getWomCountSpentLastWeek();
}

@riverpod
Future<int> fetchWomSpent(FetchWomCountSpentInTheLastWeekRef ref) async {
  return ref.watch(getDatabaseProvider).womsDao.getWomCountSpent();
}

@Riverpod(keepAlive: true)
class TransactionCountNotifier extends _$TransactionCountNotifier {
  int count = 0;

  FutureOr<int> build() async {
    final state = await ref.watch(fetchTransactionsProvider.future);
    if (state is TransactionsLoaded) {
      count = state.transactions.length;
      return count;
    }

    return count;
  }
}
