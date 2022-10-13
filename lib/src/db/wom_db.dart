import 'dart:convert';

import 'package:dart_geohash/dart_geohash.dart';
import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:wom_pocket/src/db/app_db.dart';
import 'package:wom_pocket/src/models/optional_query_model.dart';
import 'package:wom_pocket/src/models/source_group_wom.dart';
import 'package:wom_pocket/src/models/wom_model.dart';
import 'package:wom_pocket/src/my_logger.dart';
import 'package:sqflite/sqflite.dart';

import '../../constants.dart';

class WomDB {
  static final WomDB _womDb = new WomDB._internal(AppDatabase.get());

  AppDatabase _appDatabase;

  WomDB._internal(this._appDatabase);

  static WomDB get() {
    return _womDb;
  }

  Future<List<Voucher>> getAllWoms() async {
    final db = await _appDatabase.getDb();
    final result = await db.rawQuery('SELECT * FROM ${WomModel.tblWom}');
    final vouchers = result
        .map<Voucher>((Map<String, dynamic> v) => Voucher(
              id: v[WomModel.dbId],
              lat: v[WomModel.dbLat],
              long: v[WomModel.dbLong],
              secret: v[WomModel.dbSecret],
              aim: v[WomModel.dbAim],
              dateTime: v[WomModel.dbTimestamp] != null
                  ? DateTime.fromMillisecondsSinceEpoch(v[WomModel.dbTimestamp])
                  : null,
            ))
        .toList();
    return vouchers;
  }

  Future<List<Voucher>> getVouchersForPay({
    SimpleFilter? simpleFilter,
  }) async {
    var db = await _appDatabase.getDb();
    var whereClause = OptionalQuery(
            filters: simpleFilter, womStatus: WomStatus.ON, enabledRandom: true)
        .build();

    try {
      logger.i('SELECT * '
          'FROM ${WomModel.tblWom} $whereClause;');
      var result = await db.rawQuery('SELECT * '
          'FROM ${WomModel.tblWom} $whereClause;');
      logger.i(result);
      ;
      final vouchers = result
          .map<Voucher>((Map<String, dynamic> v) => Voucher(
                id: v[WomModel.dbId],
                lat: v[WomModel.dbLat]?.toDouble(),
                long: v[WomModel.dbLong]?.toDouble(),
                secret: v[WomModel.dbSecret],
                aim: v[WomModel.dbAim],
                dateTime: v[WomModel.dbTimestamp] != null
                    ? DateTime.fromMillisecondsSinceEpoch(
                        v[WomModel.dbTimestamp])
                    : null,
              ))
          .toList();
      logger.i("--------- COMPLETE QUERY WOM");
      return vouchers;
    } catch (e) {
      logger.e(e.toString());
      return <Voucher>[];
    }
  }

  Future<List<WomGroupBy>> getWomsGroupedBySources() async {
    logger.i('[WomDb] getWomsGroupedBySources');
    var db = await _appDatabase.getDb();
    final query = 'SELECT COUNT(*) as n_type, ${WomModel.dbSourceName} as type '
        'FROM ${WomModel.tblWom} '
        'WHERE ${WomModel.tblWom}.${WomModel.dbLive} = ${WomStatus.ON.index} '
        'AND ${WomModel.tblWom}.${WomModel.dbAim} NOT LIKE "0%" '
        'AND ${WomModel.tblWom}.${WomModel.dbLat} != 0 '
        'AND ${WomModel.tblWom}.${WomModel.dbLong} != 0 '
        'GROUP BY ${WomModel.dbSourceName};';
    logger.i('[WomDb]: $query');
    var result = await db.rawQuery(query);
    return _bindGroupedWoms(result);
  }

  List<WomGroupBy> _bindGroupedWoms(List<Map<String, dynamic>> result) {
    final group = <WomGroupBy>[];
    for (Map<String, dynamic> item in result) {
      var wom = new WomGroupBy.fromMap(item);
      group.add(wom);
    }
    return group;
  }

  Future<List<WomGroupBy>> getWomGroupedByAim() async {
    logger.i('[WomDb] getWomGroupedByAim');
    var db = await _appDatabase.getDb();
    final query =
        'SELECT COUNT(*) as woms, ${WomModel.dbAim} as aim, a.${AimDbKeys.TITLES} as titles '
        'FROM ${WomModel.tblWom} w INNER JOIN ${AimDbKeys.TABLE_NAME} a ON w.${WomModel.dbAim}=a.${AimDbKeys.CODE} '
        'AND w.${WomModel.dbLive} = ${WomStatus.ON.index} '
        'AND w.${WomModel.dbAim} NOT LIKE "0%" '
        'AND w.${WomModel.dbLat} != 0 '
        'AND w.${WomModel.dbLong} != 0 '
        'GROUP BY ${WomModel.dbAim};';
    logger.i('[WomDb]: $query');
    var result = await db.rawQuery(query);
    final list = result.map((m) {
      return WomGroupBy(m['aim'] as String?, m['woms'] as int?,
          titles: json.decode(m['titles'] as String));
    }).toList();
    return list;
  }

  Future<int> getWomCountWithoutLocation() async {
    logger.i('[WomDb] getWomCountWithoutLocation');
    final db = await _appDatabase.getDb();
    try {
      var result = await db.rawQuery(
        'SELECT COUNT(*) as wom '
        'FROM ${WomModel.tblWom} '
        'WHERE ${WomModel.tblWom}.${WomModel.dbLat} = 0 '
        'AND ${WomModel.tblWom}.${WomModel.dbLong} = 0',
      );
      print(result);
      if (result.isNotEmpty) {
        return result.first['wom'] as int;
      }
      return 0;
    } catch (e, stack) {
      logger.e(e);
      logger.e(stack);
      return 0;
    }
  }

  //Fetch Wom from DB
  Future<int> getWomCount() async {
    logger.i('[WomDb] getWomCount');
    final db = await _appDatabase.getDb();
    try {
      var result = await db.rawQuery('SELECT COUNT(*) as liveWoms '
          'FROM ${WomModel.tblWom} WHERE ${WomModel.tblWom}.${WomModel.dbLive} = ${WomStatus.ON.index};');
      print(result);
      if (result.isNotEmpty) {
        return result.first['liveWoms'] as int;
      }
      throw Exception();
    } catch (e) {
      rethrow;
    }
  }

  Future deleteWom(int womID) async {
    var db = await _appDatabase.getDb();
    await db.transaction((Transaction txn) async {
      await txn.rawDelete(
          'DELETE FROM ${WomModel.tblWom} WHERE ${WomModel.dbId}=$womID;');
    });
  }

  /// Inserts or replaces the task.
  Future<void> insertVoucher(Voucher voucher, String? sourceName,
      String? sourceId, int? transactionId) async {
    var db = await _appDatabase.getDb();
    try {
      final geoHasher = GeoHasher();
      final geohash = geoHasher.encode(
        voucher.long!,
        voucher.lat!,
      );
      await db.transaction((Transaction txn) async {
        int id = await txn.rawInsert('INSERT INTO '
            '${WomModel.tblWom}(${WomModel.dbId},${WomModel.dbSecret},${WomModel.dbGeohash},${WomModel.dbTimestamp},${WomModel.dbLive},${WomModel.dbLat},${WomModel.dbLong},${WomModel.dbSourceName},${WomModel.dbSourceId},${WomModel.dbAim},${WomModel.dbTransactionId})'
            ' VALUES("${voucher.id}","${voucher.secret}","$geohash",${voucher.dateTime!.millisecondsSinceEpoch},"${WomStatus.ON.index}", ${voucher.lat ?? 0.0},${voucher.long ?? 0.0},"$sourceName","$sourceId","${voucher.aim}",$transactionId)');
      });
    } catch (e) {
      logger.i(e.toString());
      throw e;
    }
  }

  /// Inserts or replaces the task.
  Future<int> updateWomStatusToOff(String? womId, int? transactionId) async {
    var db = await _appDatabase.getDb();
    try {
      int count = 0;
      await db.transaction((Transaction txn) async {
        count = await txn.rawUpdate(
            'UPDATE ${WomModel.tblWom} SET ${WomModel.dbLive} = ?, ${WomModel.dbTransactionId} = ? WHERE ${WomModel.dbId} = "$womId"',
            ['1', transactionId]);
      });
      return count;
    } catch (e) {
      logger.i("erorr = " + e.toString());
      return 0;
    }
  }
}
