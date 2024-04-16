import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:drift/drift.dart';
import 'package:wom_pocket/constants.dart';
import 'package:wom_pocket/src/database/database.dart';
import 'package:wom_pocket/src/database/tables.dart';
import 'package:wom_pocket/src/models/aim_percentage.dart';
import 'package:wom_pocket/src/models/optional_query_model.dart';
import 'package:wom_pocket/src/models/source_group_wom.dart';
import 'package:wom_pocket/src/models/wom_model.dart';
import 'package:wom_pocket/src/my_logger.dart';

part 'woms_dao.g.dart';

// the _TodosDaoMixin will be created by drift. It contains all the necessary
// fields for the tables. The <MyDatabase> type annotation is the database class
// that should use this dao.
@DriftAccessor(tables: [Wom, Aims])
class WomsDao extends DatabaseAccessor<MyDatabase> with _$WomsDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  WomsDao(MyDatabase db) : super(db);

  // Get all woms not spent
  Future<List<WomRow>> get getAllWoms =>
      (select(wom)..where((tbl) => tbl.spent.equals(WomStatus.ON.index))).get();

  Future<int> getAvailableWomCount() async {
    var countExp = wom.id.count(filter: wom.spent.equals(WomStatus.ON.index));
    final query = selectOnly(wom)..addColumns([countExp]);
    var result = await query.map((row) => row.read(countExp)).getSingle();
    return result ?? 0;
  }

  Future<int> getWomCountSpent() async {
    var countExp = wom.id.count(filter: wom.spent.equals(WomStatus.OFF.index));
    final query = selectOnly(wom)..addColumns([countExp]);
    var result = await query.map((row) => row.read(countExp)).getSingle();
    return result ?? 0;
  }

  Future<int> getTotalWomCount() async {
    var countExp = wom.id.count();
    final query = selectOnly(wom)..addColumns([countExp]);
    var result = await query.map((row) => row.read(countExp)).getSingle();
    return result ?? 0;
  }

  Future<int> getWomCountWithoutLocation() async {
    var countExp =
        wom.id.count(filter: wom.latitude.equals(0) & wom.longitude.equals(0));
    final query = selectOnly(wom)..addColumns([countExp]);
    var result = await query.map((row) => row.read(countExp)).getSingle();
    return result ?? 0;
  }

  Future<void> addVouchers(List<WomCompanion> entries) async {
    await batch((batch) {
      batch.insertAll(wom, entries, mode: InsertMode.insertOrAbort);
    });
  }

  // Se wom like spent
  Future<int> updateWomStatusToOff(String womId, int transactionId) {
    final now = DateTime.now();
    return (update(wom)..where((t) => t.id.equals(womId))).write(
      WomCompanion(
        spent: Value(WomStatus.OFF.index),
        spentOn: Value(now.millisecondsSinceEpoch),
        transactionId: Value(transactionId),
      ),
    );
  }

  Future<List<WomRow>> _getVouchersToPay({
    SimpleFilter? simpleFilter,
    bool enabledRandom = false,
    bool orderByDate = false,
  }) async {
    var whereClause = OptionalQuery(
            filters: simpleFilter,
            womStatus: WomStatus.ON,
            enabledRandom: enabledRandom)
        .build();
    final customQuery = 'SELECT * '
        'FROM ${WomModel.tblWom} $whereClause;';

    final list = (await customSelect(
      customQuery,
      readsFrom: {wom},
    ).get())
        .map((row) {
      return wom.map(row.data);
    }).toList();
    return list;
  }

  Future<List<WomRow>> getVouchersForPayment(
      {SimpleFilter? simpleFilter}) async {
    return _getVouchersToPay(
      simpleFilter: simpleFilter,
      enabledRandom: true,
    );
  }

  Future<List<WomRow>> getVouchersForExchange() async {
    return _getVouchersToPay(
      orderByDate: true,
    );
  }

  Future<List<WomGroupBy>> getWomGroupedByAim() async {
    logger.i('[WomDb] getWomGroupedByAim');
    final customQuery =
        'SELECT COUNT(*) as woms, ${WomModel.dbAim} as aim, a.${AimDbKeys.TITLES} as titles '
        'FROM ${WomModel.tblWom} w INNER JOIN ${AimDbKeys.TABLE_NAME} a ON w.${WomModel.dbAim}=a.${AimDbKeys.CODE} '
        'AND w.spent = ${WomStatus.ON.index} '
        'AND w.${WomModel.dbAim} NOT LIKE \'0%\' '
        'AND w.${WomModel.dbLat} != 0 '
        'AND w.${WomModel.dbLong} != 0 '
        'GROUP BY ${WomModel.dbAim};';
    logger.i('[WomDb]: $customQuery');
    /* var result = await db.rawQuery(query);
    final list = result.map((m) {
      return WomGroupBy(m['aim'] as String?, m['woms'] as int?,
          titles: json.decode(m['titles'] as String));
    }).toList();
    return list;*/

    final list = (await customSelect(
      customQuery,
      readsFrom: {wom, aims},
    ).get())
        .map((row) {
      return WomGroupBy.fromAimMap(row.data);
    }).toList();
    return list;
  }

  Future<List<WomGroupBy>> getWomsGroupedBySources() async {
    logger.i('[WomDb] getWomsGroupedBySources');
    final customQuery =
        'SELECT COUNT(*) as n_type, ${WomModel.dbSourceName} as type '
        'FROM ${WomModel.tblWom} '
        'WHERE ${WomModel.tblWom}.spent = ${WomStatus.ON.index} '
        'AND ${WomModel.tblWom}.${WomModel.dbAim} NOT LIKE \'0%\' '
        'AND ${WomModel.tblWom}.${WomModel.dbLat} != 0 '
        'AND ${WomModel.tblWom}.${WomModel.dbLong} != 0 '
        'GROUP BY ${WomModel.dbSourceName};';
    logger.i('[WomDb]: $customQuery');
    final list = (await customSelect(
      customQuery,
      readsFrom: {wom},
    ).get())
        .map((row) {
      return WomGroupBy.fromSourceMap(row.data);
    }).toList();
    return list;
  }

  Future<List<AimInPercentage>> getAimInPercentage() async {
    logger.i('[WomDb] getAimInPercentage');
    final customQuery =
        'SELECT Aim as aim, count(*) as count, count(*) * 100.0/ sum(count(*)) over () as percentage '
        'FROM Wom '
        'GROUP BY Aim '
        'ORDER BY percentage DESC;';
    logger.i('[WomDb]: $customQuery');
    final rowList = await customSelect(
      customQuery,
      readsFrom: {wom},
    ).get();
    final list = rowList.map((row) {
      print(row);
      return AimInPercentage.fromJson(row.data);
    }).toList();
    return list;
  }

  Future<int> getWomCountEarnedLastWeek() async {
    logger.i('[WomDb] getWomEarnedLastWeek');
    final oneWeekAgo =
        DateTime.now().subtract(Duration(days: 7)).millisecondsSinceEpoch;
    var countExp =
        wom.id.count(filter: wom.addedOn.isBiggerThanValue(oneWeekAgo));
    final query = selectOnly(wom)..addColumns([countExp]);
    var result = await query.map((row) => row.read(countExp)).getSingle();
    return result ?? 0;
  }

  Future<int> getWomCountSpentLastWeek() async {
    logger.i('[WomDb] getWomEarnedLastWeek');
    final oneWeekAgo =
        DateTime.now().subtract(Duration(days: 7)).millisecondsSinceEpoch;
    var countExp =
        wom.id.count(filter: wom.spentOn.isBiggerThanValue(oneWeekAgo));
    final query = selectOnly(wom)..addColumns([countExp]);
    var result = await query.map((row) => row.read(countExp)).getSingle();
    return result ?? 0;
  }

  Future deleteTable() async {
    await delete(wom).go();
  }
}
