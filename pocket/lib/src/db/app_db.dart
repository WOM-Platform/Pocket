import 'dart:async';
import 'dart:io';
import 'package:borsellino/src/models/transaction_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:borsellino/src/models/wom_model.dart';

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

  bool didInit = false;

  /// Use this method to access the database which will provide you future of [Database],
  /// because initialization of the database (it has to go through the method channel)
  Future<Database> getDb() async {
    if (!didInit) await _init();
    return _database;
  }

  Future _init() async {
    // Get a location using path_provider
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "borsellino.db");
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
    didInit = true;
  }

//  Future _createProjectTable(Database db) {
//    return db.transaction((Transaction txn) async {
//      txn.execute("CREATE TABLE ${Project.tblProject} ("
//          "${Project.dbId} INTEGER PRIMARY KEY AUTOINCREMENT,"
//          "${Project.dbName} TEXT,"
//          "${Project.dbColorName} TEXT,"
//          "${Project.dbColorCode} INTEGER);");
//      txn.rawInsert('INSERT INTO '
//          '${Project.tblProject}(${Project.dbId},${Project.dbName},${Project.dbColorName},${Project.dbColorCode})'
//          ' VALUES(1, "Inbox", "Grey", ${Colors.grey.value});');
//    });
//  }

//  Future _createLabelTable(Database db) {
//    return db.transaction((Transaction txn) {
//      txn.execute("CREATE TABLE ${Label.tblLabel} ("
//          "${Label.dbId} INTEGER PRIMARY KEY AUTOINCREMENT,"
//          "${Label.dbName} TEXT,"
//          "${Label.dbColorName} TEXT,"
//          "${Label.dbColorCode} INTEGER);");
//      txn.execute("CREATE TABLE ${TaskLabels.tblTaskLabel} ("
//          "${TaskLabels.dbId} INTEGER PRIMARY KEY AUTOINCREMENT,"
//          "${TaskLabels.dbTaskId} INTEGER,"
//          "${TaskLabels.dbLabelId} INTEGER,"
//          "FOREIGN KEY(${TaskLabels.dbTaskId}) REFERENCES ${Tasks.tblTask}(${Tasks.dbId}) ON DELETE CASCADE,"
//          "FOREIGN KEY(${TaskLabels.dbLabelId}) REFERENCES ${Label.tblLabel}(${Label.dbId}) ON DELETE CASCADE);");
//    });
//  }


  Future _createTransactionTable(Database db) {
    return db.execute("CREATE TABLE ${TransactionModel.tblTransaction} ("
        "${TransactionModel.dbId} INTEGER PRIMARY KEY AUTOINCREMENT,"
        "${TransactionModel.dbShop} TEXT,"
        "${TransactionModel.dbCountry} TEXT,"
        "${TransactionModel.dbTimestamp} LONG,"
        "${TransactionModel.dbType} INTEGER,"
        "${TransactionModel.dbSize} INTEGER);");
  }

  Future _createWomTable(Database db) {
    return db.execute("CREATE TABLE ${WomModel.tblWom} ("
        "${WomModel.dbId} INTEGER PRIMARY KEY AUTOINCREMENT,"
        "${WomModel.dbSecret} TEXT,"
        "${WomModel.dbGeohash} TEXT,"
        "${WomModel.dbTimestamp} LONG,"
        "${WomModel.dbLive} INTEGER,"
        "${WomModel.dbSource} TEXT,"
        "${WomModel.dbLat} LONG,"
        "${WomModel.dbLong} LONG);");
  }

  Future<void> closeDatabase() async {
    if(_database != null && _database.isOpen){
      await _database.close();
      didInit = false;
      print("database closed");
    }
  }
}
