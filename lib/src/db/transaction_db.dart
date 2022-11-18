import 'package:wom_pocket/src/db/app_db.dart';
import 'package:wom_pocket/src/models/transaction_model.dart';
import 'package:sqflite/sqflite.dart';

import '../my_logger.dart';

class TransactionDB {
  static final TransactionDB _transactionDb =
      new TransactionDB._internal(AppDatabase.get());

  AppDatabase _appDatabase;

  TransactionDB._internal(this._appDatabase);

  static TransactionDB get() {
    return _transactionDb;
  }

  Future<List<TransactionModel>> getTransactions() async {
    logger.i("--------- START QUERY TRANSACTION");
    var db = await _appDatabase.getDb();
    try {
      var result = await db.rawQuery(
          'SELECT ${TransactionModel.tblTransaction}.* '
          'FROM ${TransactionModel.tblTransaction} ORDER BY ${TransactionModel.dbTimestamp} DESC;');
      return _bindData(result);
    } catch (e,st) {
      logger.e(e.toString());
      logger.e(st);
      return <TransactionModel>[];
    }
  }

  //Connvert Json from DB to List of WomModel
  List<TransactionModel> _bindData(List<Map<String, dynamic>> result) {
    final transactions = <TransactionModel>[];
    try {
      for (Map<String, dynamic> item in result) {
        var tx = new TransactionModel.fromJson(item);
        transactions.add(tx);
      }
      logger.i("--------- COMPLETE QUERY TRANSACTION");
      return transactions;
    } catch (ex) {
      throw ex;
    }
  }

  /// Inserts or replaces the task.
  Future<int> insertTransaction(TransactionModel tx) async {
    var db = await _appDatabase.getDb();
    late int id;
    await db.transaction((Transaction txn) async {
      id = await txn.rawInsert('INSERT INTO '
          '${TransactionModel.tblTransaction}(${TransactionModel.dbSize},${TransactionModel.dbTimestamp},${TransactionModel.dbCountry},${TransactionModel.dbSource},${TransactionModel.dbAim},${TransactionModel.dbType},${TransactionModel.dbAckUrl})'
          ' VALUES(${tx.size},${tx.date.millisecondsSinceEpoch},"${tx.country}","${tx.source}","${tx.aimCode}",${tx.type.index},"${tx.ackUrl}")');
    });
    logger.i("insertTransaction id: $id");
    return id;
  }
}
