import 'dart:async';
import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wom_pocket/src/db/aim_database.dart';
import 'package:wom_pocket/src/models/transaction_model.dart';
import 'package:wom_pocket/src/models/wom_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';

import '../my_logger.dart';

/// This is the singleton database class which handlers all database transactions
/// All the task raw queries is handle here and return a Future<T> with result
class AppDatabase {
  static final AppDatabase _appDatabase = new AppDatabase._internal();
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  //private internal constructor to make it singleton
  AppDatabase._internal();

  Database? _database;

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
    return _database!;
  }

  Future<String> getPath() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "pocket.db");
    logger.i(path);
    return path;
  }

  Future _init() async {
    logger.i("AppDatabase: init database");
    // analytics.
    // Get a location using path_provider
    final path = await getPath();
    _database = await openDatabase(path, version: 3,
        onCreate: (Database db, int version) async {
      analytics.logEvent(
        name: 'app_db_onCreate',
        parameters: {'version': version},
      );
      var batch = db.batch();
      _createWomTableV2(batch);
      _createTransactionTableV2(batch);
      await AimDatabase.createAimTable(db);
      await batch.commit(noResult: true);
      analytics.logEvent(
        name: 'app_db_onCreate_complete',
      );
      logger.i("app_db_onCreate complete");
    }, onUpgrade: (Database db, int oldVersion, int newVersion) async {
      analytics.logEvent(name: 'app_db_onUpgrade', parameters: {
        'oldVersion': oldVersion,
        'newVersion': newVersion,
      });
      logger.i(
          "app_db_onUpgrade: oldVersion: $oldVersion, newVersion: $newVersion");
      if (oldVersion == 1 || oldVersion == 2) {
        var batch = db.batch();
        await updateWomTableV1toV2(db, batch);
        await updateTransactionTableV1toV2(db, batch);
        await batch.commit(noResult: true);
        analytics.logEvent(name: 'app_db_onUpgrade_complete', parameters: {
          'oldVersion': oldVersion,
          'newVersion': newVersion,
        });
        logger.i("app_db_onUpgrade complete");
      }
    });
  }

  Future updateTransactionTableV1toV2(Database db, Batch batch) async {
    analytics.logEvent(name: 'app_db_updateTransactionTableV1toV2');
    final List<TransactionModel> transactions = await getTransactions(db);
    analytics
        .logEvent(name: 'app_db_updateTransactionTableV1toV2', parameters: {
      'transactionsCount': transactions.length,
    });
    batch.execute('DROP TABLE IF EXISTS ${TransactionModel.tblTransaction}');
    _createTransactionTableV2(batch);
    for (TransactionModel tx in transactions) {
      insertTransaction2(tx, batch);
      logger.i('transaction inserita');
    }
    analytics.logEvent(name: 'app_db_updateTransactionTableV1toV2_complete');
    logger.i("transactions migration complete");
  }

  /// Inserts or replaces the task.
  insertTransaction2(TransactionModel tx, Batch batch) async {
    try {
      batch.rawInsert('INSERT INTO '
          '${TransactionModel.tblTransaction}(${TransactionModel.dbSize},${TransactionModel.dbTimestamp},${TransactionModel.dbCountry},${TransactionModel.dbSource},${TransactionModel.dbAim},${TransactionModel.dbType},${TransactionModel.dbAckUrl})'
          ' VALUES(${tx.size},${tx.date!.millisecondsSinceEpoch},"${tx.country}","${tx.source}","${tx.aimCode}",${tx.type.index},"${tx.ackUrl}")');
    } catch (e) {
      logger.i(e.toString());
      analytics.logEvent(
          name: 'app_db_insertTransaction2_error',
          parameters: {'error': e.toString()});
      throw e;
    }
  }

  Future updateWomTableV1toV2(Database db, Batch batch) async {
    analytics.logEvent(name: 'app_db_updateWomTableV1toV2');
    final List<WomModel> woms = await getAllWoms(db);
    analytics.logEvent(name: 'app_db_updateWomTableV1toV2', parameters: {
      'womsCount': woms.length,
    });
    logger.i(woms.length.toString());
    batch.execute("DROP TABLE IF EXISTS ${WomModel.tblWom}");
    logger.i('drop completato');
    _createWomTableV2(batch);
    logger.i('nuova tabella creata');
    for (WomModel w in woms) {
      insertWom2(w, batch);
      logger.i('wom inserito');
    }
    analytics.logEvent(name: 'app_db_updateWomTableV1toV2_complete');
    logger.i("migration complete");
  }

  insertWom2(WomModel wom, Batch batch) {
    try {
      batch.rawInsert('INSERT INTO '
          '${WomModel.tblWom}(${WomModel.dbId},${WomModel.dbSecret},${WomModel.dbGeohash},${WomModel.dbTimestamp},${WomModel.dbLive},${WomModel.dbLat},${WomModel.dbLong},${WomModel.dbSourceName},${WomModel.dbSourceId},${WomModel.dbAim},${WomModel.dbTransactionId})'
          ' VALUES("${wom.id}","${wom.secret}","${wom.geohash}",${wom.timestamp},"${wom.live!.index}", ${wom.gLocation!.latitude},${wom.gLocation!.longitude},"${wom.sourceName}","${wom.sourceId}","${wom.aim}",${wom.transactionId})');
    } catch (e) {
      logger.i(e.toString());
      analytics.logEvent(
          name: 'app_db_insertWom2_error', parameters: {'error': e.toString()});
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
      logger.i(e.toString());
      analytics.logEvent(
          name: 'app_db_getAllWoms_error', parameters: {'error': e.toString()});
      return <WomModel>[];
    }
  }

  //Connvert Json from DB to List of WomModel
  List<WomModel> _bindData(List<Map<String, dynamic>> result) {
    final woms = <WomModel>[];
    for (Map<String, dynamic> item in result) {
      var wom = new WomModel.fromDB(item);
      woms.add(wom);
    }
    logger.i("--------- COMPLETE QUERY WOM");
    return woms;
  }

  Future<List<TransactionModel>> getTransactions(Database db) async {
    logger.i("--------- START QUERY TRANSACTION");
    try {
      var result = await db.rawQuery(
          'SELECT ${TransactionModel.tblTransaction}.* '
          'FROM ${TransactionModel.tblTransaction} ORDER BY ${TransactionModel.dbTimestamp} DESC;');
      final transactions = <TransactionModel>[];
      for (Map<String, dynamic> item in result) {
        var tx = new TransactionModel.fromJson(item);
        transactions.add(tx);
      }
      logger.i("--------- COMPLETE QUERY TRANSACTION");
      return transactions;
    } catch (e) {
      logger.i(e.toString());
      analytics.logEvent(
          name: 'app_db_getTransactions_error',
          parameters: {'error': e.toString()});
      return [];
    }
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

  void _createTransactionTableV2(batch) {
    analytics.logEvent(
      name: 'app_db_createTransactionTableV2',
    );
    batch.execute("CREATE TABLE ${TransactionModel.tblTransaction} ("
        "${TransactionModel.dbId} INTEGER PRIMARY KEY AUTOINCREMENT,"
        "${TransactionModel.dbSource} TEXT,"
        "${TransactionModel.dbCountry} TEXT,"
        "${TransactionModel.dbAim} TEXT,"
        "${TransactionModel.dbTimestamp} LONG,"
        "${TransactionModel.dbType} INTEGER,"
        "${TransactionModel.dbSize} INTEGER,"
        "${TransactionModel.dbAckUrl} TEXT);");
  }

  void _createWomTableV2(Batch batch) {
    analytics.logEvent(
      name: 'app_db_createWomTableV2',
    );
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
    if (_database != null && _database!.isOpen) {
      await _database!.close();
      _database = null;
      logger.i("database closed");
    }
  }

  Future<void> deleteDb() async {
    final path = await getPath();
    await ((await openDatabase(path)).close());
    await deleteDatabase(path);
  }
}
