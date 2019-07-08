import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:pocket/src/db/app_db.dart';
import 'package:pocket/src/db/transaction_db.dart';
import 'package:pocket/src/models/transaction_model.dart';
import 'package:wom_package/wom_package.dart';
import './bloc.dart';

class TransactionsListBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final TransactionDB _transactionDB;
  AimRepository _aimRepository;

  TransactionsListBloc(this._transactionDB) {
    _aimRepository = AimRepository();
  }

  @override
  TransactionsState get initialState => InitialTransactionsState();

  @override
  Stream<TransactionsState> mapEventToState(
    TransactionsEvent event,
  ) async* {
    if (event is LoadTransactions) {
      yield TransactionsLoading();

      final aims =
          await _aimRepository.getFlatAimList(AppDatabase.get().getDb());
      print('aim letti : ${aims.length}');
      final List<TransactionModel> transactions =
          await _transactionDB.getTransactions();
      for (TransactionModel t in transactions) {
        final String aimCode = t.aimCode.split(',').first;
        final Aim aim = aims.firstWhere((a) {
          return a.code == aimCode;
        }, orElse: () {
          return null;
        });
        t.aim = aim;
      }
      yield TransactionsLoaded(transactions);
    }
  }
}
