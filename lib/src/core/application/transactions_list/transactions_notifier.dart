import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/core/application/aim_notifier.dart';
import 'package:wom_pocket/src/core/application/transactions_list/transactions_list_state.dart';
import 'package:wom_pocket/src/core/services/aim_repository.dart';
import 'package:wom_pocket/src/core/database/extensions.dart';
import 'package:wom_pocket/src/core/my_logger.dart';

part 'transactions_notifier.g.dart';

@Riverpod(keepAlive: true)
Future<TransactionsState> fetchTransactions(FetchTransactionsRef ref) async {
  var aims = await ref.read(aimRepositoryProvider).getFlatAimList();

  try {
    //Se non ho gli aim salvati nel db li scarico da internet
    if (aims.isEmpty) {
      if (await InternetConnectionChecker().hasConnection) {
        // final repo = AppRepository();
        aims = await ref.read(aimRepositoryProvider).updateAim();
      } else {
        logger.i('Aims null or empty and No internet connection');
        return TransactionsNoDataConnectionState();
      }
    }

    logger.i('aim letti : ${aims.length}');
    final transactions =
        await ref.read(getDatabaseProvider).transactionsDao.getTransactions;
    return TransactionsLoaded(transactions.map((e) => e.toModel()).toList());
  } catch (ex, st) {
    logger.e('Unknown error', error: ex, stackTrace: st);
    return TransactionsErrorState('somethings_wrong');
  }
}
