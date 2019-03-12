//import 'package:pocket/src/blocs/bloc_provider.dart';
//import 'package:pocket/src/db/transaction_db.dart';
//import 'package:pocket/src/models/transaction_model.dart';
//import 'package:rxdart/rxdart.dart';
//
//class TransactionsBloc extends BlocBase{
//
//  // Transactions List
//  BehaviorSubject<List<TransactionModel>> _transactions = BehaviorSubject<List<TransactionModel>>();
//  Observable<List<TransactionModel>> get transactions => _transactions.stream;
//  Function get addTransactions => _transactions.sink.add;
//
//  final TransactionDB transactionDB;
//
//  TransactionsBloc(this.transactionDB);
//
//  readTransaction() async {
//    final list = await transactionDB.getTransactions();
//    addTransactions(list);
//  }
//
//  @override
//  void dispose() {
//    _transactions.close();
//  }
//}