import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:pocket/src/models/transaction_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pocket/src/models/wom_model.dart';
import 'package:synchronized/synchronized.dart';
import 'package:wom_package/wom_package.dart';

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

  Future<String> getPath() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "pocket.db");
    debugPrint(path);
    return path;
  }

  Future _init() async {
    debugPrint("AppDatabase: init database");
    // Get a location using path_provider
    final path = await getPath();
    _database = await openDatabase(path, version: 2,
        onCreate: (Database db, int version) async {
      var batch = db.batch();
      _createWomTableV2(batch);
      _createTransactionTable(batch);
      await AimDatabase.createAimTable(db);
      await batch.commit(noResult: true);
    }, onUpgrade: (Database db, int oldVersion, int newVersion) async {
      var batch = db.batch();
      if (oldVersion == 1) {
        debugPrint("old version: 1");
        updateWomTableV1toV2(db, batch);
      }
      await batch.commit(noResult: true);
    });
  }

  Future createWomTableV2(Batch batch) async {}

  Future updateWomTableV1toV2(Database db, Batch batch) async {
    final List<WomModel> woms = await getAllWoms(db);
    debugPrint(woms.length.toString());
//    await db.execute("DROP TABLE IF EXISTS ${WomModel.tblWom}");
    batch.execute("DROP TABLE IF EXISTS ${WomModel.tblWom}");
    debugPrint('drop completato');
    _createWomTableV2(batch);
    debugPrint('nuova tabella creata');
    for (WomModel w in woms) {
      insertWom2(w, db, batch);
      debugPrint('wom inserito');
    }
    debugPrint("migration complete");
  }

  insertWom2(WomModel wom, Database db, Batch batch) {
    try {
      batch.rawInsert('INSERT INTO '
          '${WomModel.tblWom}(${WomModel.dbId},${WomModel.dbSecret},${WomModel.dbGeohash},${WomModel.dbTimestamp},${WomModel.dbLive},${WomModel.dbLat},${WomModel.dbLong},${WomModel.dbSourceName},${WomModel.dbSourceId},${WomModel.dbAim},${WomModel.dbTransactionId})'
          ' VALUES("${wom.id}","${wom.secret}","${wom.geohash}",${wom.timestamp},"${wom.live.index}", ${wom.gLocation.latitude},${wom.gLocation.longitude},"${wom.sourceName}","${wom.sourceId}","${wom.aim}",${wom.transactionId})');
    } catch (e) {
      debugPrint(e.toString());
      throw e;
    }
  }

//Fetch Wom from DB
  Future<List<WomModel>> getAllWoms(Database db) async {
    try {
      var result = await db.rawQuery('SELECT ${WomModel.tblWom}.* '
          'FROM ${WomModel.tblWom};');
      return _bindData(result);
    } catch (e) {
      debugPrint(e.toString());
      return List<WomModel>();
    }
  }

  //Connvert Json from DB to List of WomModel
  List<WomModel> _bindData(List<Map<String, dynamic>> result) {
    List<WomModel> woms = new List();
    for (Map<String, dynamic> item in result) {
      var wom = new WomModel.fromMap(item);
      woms.add(wom);
    }
    debugPrint("--------- COMPLETE QUERY WOM");
    return woms;
  }

  void _createTransactionTable(batch) {
    batch.execute("CREATE TABLE ${TransactionModel.tblTransaction} ("
        "${TransactionModel.dbId} INTEGER PRIMARY KEY AUTOINCREMENT,"
        "${TransactionModel.dbSource} TEXT,"
        "${TransactionModel.dbCountry} TEXT,"
        "${TransactionModel.dbAim} TEXT,"
        "${TransactionModel.dbTimestamp} LONG,"
        "${TransactionModel.dbType} INTEGER,"
        "${TransactionModel.dbSize} INTEGER);");
  }

  void _createWomTableV2(Batch batch) {
    batch.execute("CREATE TABLE ${WomModel.tblWom} ("
        "${WomModel.dbId} TEXT PRIMARY KEY,"
        "${WomModel.dbSecret} TEXT,"
        "${WomModel.dbAim} TEXT,"
        "${WomModel.dbGeohash} TEXT,"
        "${WomModel.dbTimestamp} LONG,"
        "${WomModel.dbLive} INTEGER,"
        "${WomModel.dbSourceName} TEXT,"
        "${WomModel.dbSourceId} TEXT,"
        "${WomModel.dbTransactionId} INTEGER,"
        "${WomModel.dbLat} LONG,"
        "${WomModel.dbLong} LONG);");

    /*return db.execute("CREATE TABLE ${WomModel.tblWom} ("
        "${WomModel.dbId} TEXT PRIMARY KEY,"
        "${WomModel.dbSecret} TEXT,"
        "${WomModel.dbAim} TEXT,"
        "${WomModel.dbGeohash} TEXT,"
        "${WomModel.dbTimestamp} LONG,"
        "${WomModel.dbLive} INTEGER,"
        "${WomModel.dbSourceName} TEXT,"
        "${WomModel.dbSourceId} INTEGER,"
        "${WomModel.dbTransactionId} INTEGER,"
        "${WomModel.dbLat} LONG,"
        "${WomModel.dbLong} LONG);");*/
  }

  // OLD
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
    if (_database != null && _database.isOpen) {
      await _database.close();
      _database = null;
      debugPrint("database closed");
    }
  }

  Future<void> deleteDb() async {
    final path = await getPath();
    await ((await openDatabase(path)).close());
    await deleteDatabase(path);
  }
}
