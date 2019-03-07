import 'dart:async';
import 'dart:io';
import 'package:pocket/src/models/transaction_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pocket/src/models/wom_model.dart';
import 'package:synchronized/synchronized.dart';

/// This is the singleton database class which handlers all database transactions
/// All the task raw queries is handle here and return a Future<T> with result
class AppDatabase {
  static final AppDatabase _appDatabase = new AppDatabase._internal();

  //private internal constructor to make it singleton
  AppDatabase._internal();

  Database _database;

  static AppDatabase get() {
    return _appDatabase;
  }

  final _lock = new Lock();

  Future<Database> getDb() async {
    if (_database == null) {
      await _lock.synchronized(() async {
        // Check again once entering the synchronized block
        if (_database == null) {
         await _init();
        }
      });
    }
    return _database;
  }

  Future _init() async {
    print("AppDatabase: init database");
    // Get a location using path_provider
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "pocket.db");
    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await _createWomTable(db);
          await _createTransactionTable(db);
        }, onUpgrade: (Database db, int oldVersion, int newVersion) async {
          await db.execute("DROP TABLE ${WomModel.tblWom}");
          await db.execute("DROP TABLE ${TransactionModel.tblTransaction}");
          await _createWomTable(db);
          await _createTransactionTable(db);
        });
  }

  Future _createTransactionTable(Database db) {
    return db.execute("CREATE TABLE ${TransactionModel.tblTransaction} ("
        "${TransactionModel.dbId} INTEGER PRIMARY KEY AUTOINCREMENT,"
        "${TransactionModel.dbSource} TEXT,"
        "${TransactionModel.dbCountry} TEXT,"
        "${TransactionModel.dbAim} TEXT,"
        "${TransactionModel.dbTimestamp} LONG,"
        "${TransactionModel.dbType} INTEGER,"
        "${TransactionModel.dbSize} INTEGER);");
  }

  Future _createWomTable(Database db) {
    return db.execute("CREATE TABLE ${WomModel.tblWom} ("
        "${WomModel.dbId} INTEGER PRIMARY KEY,"
        "${WomModel.dbSecret} TEXT,"
        "${WomModel.dbAim} TEXT,"
        "${WomModel.dbGeohash} TEXT,"
        "${WomModel.dbTimestamp} LONG,"
        "${WomModel.dbLive} INTEGER,"
        "${WomModel.dbSourceName} TEXT,"
        "${WomModel.dbSourceId} INTEGER,"
        "${WomModel.dbTransactionId} INTEGER,"
        "${WomModel.dbLat} LONG,"
        "${WomModel.dbLong} LONG);");
  }

  Future<void> closeDatabase() async {
    if(_database != null && _database.isOpen){
      await _database.close();
      _database = null;
      print("database closed");
    }
  }
}
