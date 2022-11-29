import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/application/aim_notifier.dart';
import 'package:wom_pocket/src/database/extensions.dart';
import 'package:wom_pocket/src/models/transaction_model.dart';
import 'package:wom_pocket/src/my_logger.dart';
import 'package:wom_pocket/src/database/database.dart';
import 'package:wom_pocket/src/services/aim_repository.dart';

import '../blocs/transactions_list/transactions_list_state.dart';

part 'transactions_notifier.g.dart';

@riverpod
Future<TransactionsState> fetchTransactions(FetchTransactionsRef ref) async {
  var aims = await ref.read(aimRepositoryProvider).getFlatAimList();

  try {
    //Se non ho gli aim salvati nel db li scarico da internet
    if (aims.isEmpty) {
      if (await InternetConnectionChecker().hasConnection) {
        // final repo = AppRepository();
        aims = await ref.read(aimRepositoryProvider).updateAim();
      } else {
        logger.i("Aims null or empty and No internet connection");
        return TransactionsNoDataConnectionState();
      }
    }

    logger.i('aim letti : ${aims.length}');
    final transactions =
        await ref.read(databaseProvider).transactionsDao.getTransactions;
    return TransactionsLoaded(transactions.map((e) => e.toModel()).toList());
  } catch (ex) {
    logger.e(ex.toString());
    return TransactionsErrorState('somethings_wrong');
  }
}
