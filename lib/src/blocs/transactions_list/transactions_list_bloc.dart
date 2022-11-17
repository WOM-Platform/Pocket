import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:wom_pocket/src/db/app_db.dart';
import 'package:wom_pocket/src/db/transaction_db.dart';
import 'package:wom_pocket/src/models/transaction_model.dart';
import 'package:wom_pocket/src/services/aim_repository.dart';

import './bloc.dart';
import '../../my_logger.dart';

class TransactionsListBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final TransactionDB _transactionDB;
  late AimRepository _aimRepository;

  TransactionsListBloc(this._transactionDB)
      : super(InitialTransactionsState()) {
    _aimRepository = AimRepository();
  }

  @override
  Stream<TransactionsState> mapEventToState(
    TransactionsEvent event,
  ) async* {
    if (event is LoadTransactions) {
      yield TransactionsLoading();

      var aims = await _aimRepository.getFlatAimList(AppDatabase.get().getDb);

      try {
        //Se non ho gli aim salvati nel db li scarico da internet
        if (aims.isEmpty) {
          if (await InternetConnectionChecker().hasConnection) {
            // final repo = AppRepository();
            aims = await _aimRepository.updateAim(AppDatabase.get().getDb);
          } else {
            logger.i("Aims null or empty and No internet connection");
            yield TransactionsNoDataConnectionState();
            return;
          }
        }

        logger.i('aim letti : ${aims.length}');
        final transactions = await _transactionDB.getTransactions();
        for (TransactionModel t in transactions) {
          if (t.aimCode != null) {
            final String aimCode = t.aimCode!.split(',').first;
            try {
              final aim = aims.firstWhere((a) {
                return a.code == aimCode;
              });
              t.aim = aim;
            } catch (ex, st) {
              logger.e(ex);
              logger.e(st);
            }
          }
        }
        yield TransactionsLoaded(transactions);
      } catch (ex) {
        logger.e(ex.toString());
        yield TransactionsErrorState('somethings_wrong');
      }
    }
  }
}
