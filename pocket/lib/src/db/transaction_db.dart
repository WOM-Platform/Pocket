import 'package:borsellino/src/db/app_db.dart';
import 'package:borsellino/src/models/transaction_model.dart';
import 'package:sqflite/sqflite.dart';

class TransactionDB {
  static final TransactionDB _transactionDb =
      new TransactionDB._internal(AppDatabase.get());

  AppDatabase _appDatabase;

  //private internal constructor to make it singleton
  TransactionDB._internal(this._appDatabase);

  //static TaskDB get taskDb => _taskDb;

  static TransactionDB get() {
    return _transactionDb;
  }

  Future<List<TransactionModel>> getTransactions() async {
    var db = await _appDatabase.getDb();
    try {
      var result =
          await db.rawQuery('SELECT ${TransactionModel.tblTransaction}.* '
              'FROM ${TransactionModel.tblTransaction};');
      return _bindData(result);
    } catch (e) {
      print(e.toString());
      return List<TransactionModel>();
    }
  }

  //Connvert Json from DB to List of WomModel
  List<TransactionModel> _bindData(List<Map<String, dynamic>> result) {
    List<TransactionModel> woms = new List();
    for (Map<String, dynamic> item in result) {
      var tx = new TransactionModel.fromMap(item);
      woms.add(tx);
    }
    print("--------- COMPLETE QUERY TRANSACTION");
    return woms;
  }

  /// Inserts or replaces the task.
  Future updateTransaction(TransactionModel tx) async {
    var db = await _appDatabase.getDb();
    await db.transaction((Transaction txn) async {
      int id = await txn.rawInsert('INSERT OR REPLACE INTO '
          '${TransactionModel.tblTransaction}(${TransactionModel.dbSize},${TransactionModel.dbTimestamp},${TransactionModel.dbCountry},${TransactionModel.dbShop},${TransactionModel.dbType})'
          ' VALUES(${tx.size},${tx.date.millisecondsSinceEpoch},"${tx.country}","${tx.shop}",${tx.transactionType.index})');
    });
  }

  closeDb() async {
    await _appDatabase.closeDatabase();
  }
}
