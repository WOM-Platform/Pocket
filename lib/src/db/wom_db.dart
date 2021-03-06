import 'dart:convert';

import 'package:pocket/src/db/app_db.dart';
import 'package:pocket/src/models/aggregation_wom_model.dart';
import 'package:pocket/src/models/optional_query_model.dart';
import 'package:pocket/src/models/source_group_wom.dart';
import 'package:pocket/src/models/wom_model.dart';
import 'package:pocket/src/models/wom_pay_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wom_package/wom_package.dart'
    show WomStatus, SimpleFilters, Aim;

class WomDB {
  static final WomDB _womDb = new WomDB._internal(AppDatabase.get());

  AppDatabase _appDatabase;

  //private internal constructor to make it singleton
  WomDB._internal(this._appDatabase);

  //static WomDB get taskDb => _taskDb;

  static WomDB get() {
    return _womDb;
  }

  Future<int> getWomsCount() async {
    var db = await _appDatabase.getDb();
    var result = await db.rawQuery(
        'SELECT COUNT(*) as n_count FROM ${WomModel.tblWom} WHERE ${WomModel.dbLive}=${WomStatus.ON.index}');
    return result[0]['n_count'];
  }

  //Fetch Wom from DB
  Future<List<WomModel>> getWoms(
      {int startDate = 0,
      int endDate = 0,
      WomStatus womStatus = WomStatus.ON,
      Set<String> sources}) async {
    if (sources != null && sources.isEmpty) {
      print("--------- COMPLETE QUERY AGGREGATION WOM");
      return List<WomModel>();
    }
    var db = await _appDatabase.getDb();
    var whereClause = OptionalQuery(
            startDate: startDate,
            endDate: endDate,
            womStatus: womStatus,
            sources: sources)
        .build();

    try {
      var result = await db.rawQuery('SELECT ${WomModel.tblWom}.* '
          'FROM ${WomModel.tblWom} $whereClause;');
      return _bindData(result);
    } catch (e) {
      print(e.toString());
      return List<WomModel>();
    }
  }

  //query rectangle
  /*
  and destination.longitudebetween lon1 and lon2 and destination.latitudebetween lat1 and lat2
  */

  //Connvert Json from DB to List of WomModel
  List<WomModel> _bindData(List<Map<String, dynamic>> result) {
    List<WomModel> woms = new List();
    for (Map<String, dynamic> item in result) {
      var wom = new WomModel.fromDB(item);
      woms.add(wom);
    }
    print("--------- COMPLETE QUERY WOM");
    return woms;
  }

  Future<List<WomPayModel>> getWomsForPay({
    SimpleFilters simpleFilters,
  }) async {
    var db = await _appDatabase.getDb();
    var whereClause = OptionalQuery(
            filters: simpleFilters,
            womStatus: WomStatus.ON,
            enabledRandom: true)
        .build();

    try {
      print('SELECT ${WomModel.dbId}, ${WomModel.dbSecret} '
          'FROM ${WomModel.tblWom} $whereClause;');
      var result =
          await db.rawQuery('SELECT ${WomModel.dbId}, ${WomModel.dbSecret} '
              'FROM ${WomModel.tblWom} $whereClause;');
      print(result);
      final List<WomPayModel> woms = [];
      for (Map<String, dynamic> item in result) {
        var wom = new WomPayModel.fromDB(item);
        woms.add(wom);
      }
      print("--------- COMPLETE QUERY WOM");
      return woms;
    } catch (e) {
      print(e.toString());
      return List<WomPayModel>();
    }
  }

//
//  String buildOptionQuery(
//      {int startDate = 0,
//      int endDate = 0,
//      WomStatus womStatus,
//      Set<String> sources}) {
//    var whereClause = startDate > 0 && endDate > 0
//        ? "WHERE ${WomModel.tblWom}.${WomModel.dbTimestamp} BETWEEN $startDate AND $endDate"
//        : "";
//
//    if (womStatus != null) {
//      var statusWhereClause =
//          "${WomModel.tblWom}.${WomModel.dbLive} = ${womStatus.index}";
//      whereClause = whereClause.isEmpty
//          ? "WHERE $statusWhereClause"
//          : "$whereClause AND $statusWhereClause";
//    }
//
//    if (sources != null) {
//      final sourceWhereClause = buildSourceClause(sources);
//
//      whereClause = whereClause.isEmpty
//          ? "WHERE $sourceWhereClause"
//          : "$whereClause AND $sourceWhereClause";
//    }
//    return whereClause;
//  }
//
//  buildSourceClause(Set<String> sources) {
//    var sourceWhereClause = "";
//    if (sources.isEmpty) {
//      return "${WomModel.tblWom}.${WomModel.dbSource} = FAKE";
//    }
//    sources.forEach((source) {
//      sourceWhereClause = sourceWhereClause.isEmpty
//          ? "${WomModel.tblWom}.${WomModel.dbSource} = \"$source\""
//          : "$sourceWhereClause OR ${WomModel.tblWom}.${WomModel.dbSource} = \"$source\"";
//    });
//
//    return sourceWhereClause;
//  }

  Future<List<WomGroupBy>> getSourcesFromDB() async {
    var db = await _appDatabase.getDb();
    var result = await db.rawQuery(
        'SELECT COUNT(*) as n_type, ${WomModel.dbSourceName} as type FROM ${WomModel.tblWom} WHERE ${WomModel.dbLive} = 0 GROUP BY ${WomModel.dbSourceName};');
    return _bindSources(result);
  }

  _bindSources(List<Map<String, dynamic>> result) {
    List<WomGroupBy> sources = new List();
    for (Map<String, dynamic> item in result) {
      var source = WomGroupBy.fromMap(item);
      sources.add(source);
    }
    print("--------- COMPLETE QUERY SOURCE WOM");
    return sources;
  }

  //return m
  Future<int> getMinDate() async {
    var db = await _appDatabase.getDb();
    var result = await db.rawQuery(
        'SELECT MIN(${WomModel.dbTimestamp}) as initialDate FROM ${WomModel.tblWom};');

    return result[0]["initialDate"] ?? DateTime.now().millisecondsSinceEpoch;
  }

  Future<List<AggregationWom>> getAggregatedWoms(int level,
      {int startDate = 0, int endDate = 0, Set<String> sources}) async {
    if (sources != null && sources.isEmpty) {
      print("--------- COMPLETE QUERY AGGREGATION WOM");
      return List<AggregationWom>();
    }
    try {
      var db = await _appDatabase.getDb();
      var whereClause = OptionalQuery(
              startDate: startDate,
              endDate: endDate,
              sources: sources,
              womStatus: WomStatus.ON)
          .build();

      var result = await db.rawQuery(
          'SELECT COUNT(*) as n_marker, AVG(${WomModel.dbLat}) as lat, AVG(${WomModel.dbLong}) as long '
          'FROM ${WomModel.tblWom} $whereClause GROUP BY substr(${WomModel.dbGeohash},1,$level);');
      print("--------- COMPLETE QUERY AGGREGATION WOM");
      return _bindAggregationWom(result);
    } catch (e) {
      print(e.toString());
      print("--------- COMPLETE QUERY AGGREGATION WOM WITH ERROR");
      return List<AggregationWom>();
    }
  }

  //Connvert Json from DB to List of AggegationWom
  List<AggregationWom> _bindAggregationWom(List<Map<String, dynamic>> result) {
    List<AggregationWom> aggregationWom = new List();
    for (Map<String, dynamic> item in result) {
      var wom = new AggregationWom.fromMap(item);
      aggregationWom.add(wom);
    }

    return aggregationWom;
  }

  Future<List<WomGroupBy>> getWomsGroupedBySources() async {
    print('[WomDb] getWomsGroupedBySources');
    var db = await _appDatabase.getDb();
    final query =
        'SELECT COUNT(*) as n_type, ${WomModel.dbSourceName} as type FROM ${WomModel.tblWom} WHERE ${WomModel.tblWom}.${WomModel.dbLive} = ${WomStatus.ON.index} AND ${WomModel.tblWom}.${WomModel.dbAim} NOT LIKE "0%" GROUP BY ${WomModel.dbSourceName};';
    print('[WomDb]: $query');
    var result = await db.rawQuery(query);
    return _bindGroupedWoms(result);
  }

  List<WomGroupBy> _bindGroupedWoms(List<Map<String, dynamic>> result) {
    List<WomGroupBy> group = new List();
    for (Map<String, dynamic> item in result) {
      var wom = new WomGroupBy.fromMap(item);
      group.add(wom);
    }
    return group;
  }

  Future<List<WomGroupBy>> getWomGroupedByAim() async {
    print('[WomDb] getWomGroupedByAim');
    var db = await _appDatabase.getDb();
    final query =
        'SELECT COUNT(*) as woms, ${WomModel.dbAim} as aim, a.${Aim.TITLES} as titles FROM ${WomModel.tblWom} w INNER JOIN ${Aim.TABLE_NAME} a ON w.${WomModel.dbAim}=a.${Aim.CODE} AND w.${WomModel.dbLive} = ${WomStatus.ON.index} AND w.${WomModel.dbAim} NOT LIKE "0%" GROUP BY ${WomModel.dbAim};';
    print('[WomDb]: $query');
    var result = await db.rawQuery(query);
    final list = result.map((m) {
      return WomGroupBy(m['aim'], m['woms'], titles: json.decode(m['titles']));
    }).toList();
    return list;
  }

  Future deleteWom(int womID) async {
    var db = await _appDatabase.getDb();
    await db.transaction((Transaction txn) async {
      await txn.rawDelete(
          'DELETE FROM ${WomModel.tblWom} WHERE ${WomModel.dbId}=$womID;');
    });
  }

  /// Insert WOM with old registry (wom's id is integer)
  Future<void> insertWom(WomModel wom) async {
    var db = await _appDatabase.getDb();
    try {
      await db.transaction((Transaction txn) async {
        int id = await txn.rawInsert('INSERT INTO '
            '${WomModel.tblWom}(${WomModel.dbId},${WomModel.dbSecret},${WomModel.dbGeohash},${WomModel.dbTimestamp},${WomModel.dbLive},${WomModel.dbLat},${WomModel.dbLong},${WomModel.dbSourceName},${WomModel.dbSourceId},${WomModel.dbAim},${WomModel.dbTransactionId})'
            ' VALUES(${wom.id},"${wom.secret}","${wom.geohash}",${wom.timestamp},"${wom.live.index}", ${wom.gLocation.latitude},${wom.gLocation.longitude},"${wom.sourceName}",${wom.sourceId},"${wom.aim}",${wom.transactionId})');
      });
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  /// Inserts or replaces the task.
  Future<void> insertWom2(WomModel wom) async {
    var db = await _appDatabase.getDb();
    try {
      await db.transaction((Transaction txn) async {
        int id = await txn.rawInsert('INSERT INTO '
            '${WomModel.tblWom}(${WomModel.dbId},${WomModel.dbSecret},${WomModel.dbGeohash},${WomModel.dbTimestamp},${WomModel.dbLive},${WomModel.dbLat},${WomModel.dbLong},${WomModel.dbSourceName},${WomModel.dbSourceId},${WomModel.dbAim},${WomModel.dbTransactionId})'
            ' VALUES("${wom.id}","${wom.secret}","${wom.geohash}",${wom.timestamp},"${wom.live.index}", ${wom.gLocation.latitude},${wom.gLocation.longitude},"${wom.sourceName}","${wom.sourceId}","${wom.aim}",${wom.transactionId})');
      });
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  /// Inserts or replaces the task.
  Future<int> updateWomStatusToOff(String womId, int transactionId) async {
    var db = await _appDatabase.getDb();
    try {
      int count;
      await db.transaction((Transaction txn) async {
        count = await txn.rawUpdate(
            'UPDATE ${WomModel.tblWom} SET ${WomModel.dbLive} = ?, ${WomModel.dbTransactionId} = ? WHERE ${WomModel.dbId} = "$womId"',
            ['1', transactionId]);
      });
      return count;
    } catch (e) {
      print("erorr = " + e.toString());
      return 0;
    }
  }
}
