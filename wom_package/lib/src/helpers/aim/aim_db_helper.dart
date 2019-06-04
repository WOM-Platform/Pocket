import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wom_package/src/models/aim.dart';

class AimDbHelper {

  static final AimDbHelper _aimDb = new AimDbHelper._internal();

  AimDbHelper._internal();

  static AimDbHelper get() {
    return _aimDb;
  }

  static Future createAimTable(Database db) {
    print("AimDbHelper: createAimTable()");
    return db.execute("CREATE TABLE ${Aim.TABLE_NAME} ("
        "${Aim.ID} INTEGER PRIMARY KEY AUTOINCREMENT,"
        "${Aim.CODE} TEXT,"
        "${Aim.ICON_URL} TEXT,"
        "${Aim.TITLES} TEXT);");
  }

  Future<List<Aim>> getAimWithLevel(
      {@required Database db, int deepLevel, String code}) async {
    try {
      print("AimDbHelper: getAimWithLevel()");
      final String whereClause = code != null
          ? "LENGTH(${Aim.CODE}) = ? AND ${Aim.CODE} LIKE '$code%'"
          : "LENGTH(${Aim.CODE}) = ?";
      List<Map> maps = await db.query(
        Aim.TABLE_NAME,
        columns: null,
        where: whereClause,
        whereArgs: [deepLevel],
      );
      return maps.map((a) {
        return Aim.fromDbMap(a);
      }).toList();
    } catch (e) {
      print(e.toString());
      return List<Aim>();
    }
  }

  Future<Aim> getAim({@required Database db, String aimCode}) async {
    print("AimDbHelper: getAim()");
    try {
      List<Map> maps = await db.query(
        Aim.TABLE_NAME,
        columns: null,
        where: "${Aim.CODE} = ?",
        whereArgs: [aimCode],
      );
      return Aim.fromDbMap(maps.first);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<int> insert({@required Database db,Aim aim}) async {
    print("AimDbHelper: insert()");
    int result;
    await db.transaction((Transaction txn) async {
      result = await txn.insert(
        Aim.TABLE_NAME,
        aim.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
    return result;
  }
}
