import 'dart:convert';

import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

import '../../constants.dart';

class AimDatabase {
  static final AimDatabase _aimDb = new AimDatabase._internal();

  AimDatabase._internal();

  static AimDatabase get() {
    return _aimDb;
  }

  static Future createAimTable(Database db) {
    print("AimDatabase: createAimTable()");
    return db.execute("CREATE TABLE ${AimDbKeys.TABLE_NAME} ("
        "${AimDbKeys.ID} INTEGER PRIMARY KEY AUTOINCREMENT,"
        "${AimDbKeys.CODE} TEXT,"
        "${AimDbKeys.ICON_URL} TEXT,"
        "${AimDbKeys.TITLES} TEXT);");
  }

  Future<List<Aim>> getAimWithLevel(
      {@required Database db, int deepLevel, String code}) async {
    try {
      print("AimDatabase: getAimWithLevel()");
      final String whereClause = code != null
          ? "LENGTH(${AimDbKeys.CODE}) = ? AND ${AimDbKeys.CODE} LIKE '$code%'"
          : "LENGTH(${AimDbKeys.CODE}) = ?";
      List<Map> maps = await db.query(
        AimDbKeys.TABLE_NAME,
        columns: null,
        where: whereClause,
        whereArgs: [deepLevel],
      );
      return maps.map((a) {
        return Aim(
          code: a[AimDbKeys.CODE],
          titles: json.decode(a[AimDbKeys.TITLES]),
          iconUrl: a[AimDbKeys.ICON_URL],
        );
      }).toList();
    } catch (e) {
      print(e.toString());
      return List<Aim>();
    }
  }

  Future<List<Aim>> getFlatAimList({@required Database db}) async {
    print("AimDatabase: getFlatAimList()");
    try {
      List<Map> maps = await db.query(
        AimDbKeys.TABLE_NAME,
      );
      return maps.map((a) {
        return Aim(
          code: a[AimDbKeys.CODE],
          titles: json.decode(a[AimDbKeys.TITLES]),
          iconUrl: a[AimDbKeys.ICON_URL],
        );
      }).toList();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<Aim> getAim({@required Database db, String aimCode}) async {
    print("AimDatabase: getAim()");
    try {
      List<Map> maps = await db.query(
        AimDbKeys.TABLE_NAME,
        columns: null,
        where: "${AimDbKeys.CODE} = ?",
        whereArgs: [aimCode],
      );
      final a = maps.first;
      return Aim(
        code: a[AimDbKeys.CODE],
        titles: json.decode(a[AimDbKeys.TITLES]),
        iconUrl: a[AimDbKeys.ICON_URL],
      );
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<int> insert({@required Database db, Aim aim}) async {
    print("AimDatabase: insert()");
    int result;
    await db.transaction((Transaction txn) async {
      result = await txn.insert(
        AimDbKeys.TABLE_NAME,
        aim.toDBMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
    return result;
  }
}

extension AimExtension on Aim {
  Map<String, dynamic> toDBMap() {
    final data = <String, dynamic>{};
    data[AimDbKeys.CODE] = code;
    data[AimDbKeys.ICON_URL] = iconUrl;
    data[AimDbKeys.TITLES] = json.encode(titles);
    return data;
  }
}
