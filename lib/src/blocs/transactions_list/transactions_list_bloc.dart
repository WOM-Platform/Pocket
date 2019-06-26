import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:pocket/src/db/transaction_db.dart';
import './bloc.dart';

class TransactionsListBloc extends Bloc<TransactionsEvent, TransactionsState> {

  final TransactionDB _transactionDB;

  TransactionsListBloc(this._transactionDB){
    dispatch(LoadTransactions());
  }

  @override
  TransactionsState get initialState => InitialTransactionsState();

  @override
  Stream<TransactionsState> mapEventToState(
    TransactionsEvent event,
  ) async* {
    if(event is LoadTransactions){
      yield TransactionsLoading();
      final transactions = await _transactionDB.getTransactions();
      yield TransactionsLoaded(transactions);
    }
  }
}
