import 'package:pocket/src/db/app_db.dart';
import 'package:pocket/src/models/aim_model.dart';

class AimDB {
  static final AimDB _womDb = new AimDB._internal(AppDatabase.get());

  AppDatabase _appDatabase;

  //private internal constructor to make it singleton
  AimDB._internal(this._appDatabase);

  //static WomDB get taskDb => _taskDb;

  static AimDB get() {
    return _womDb;
  }

  Future<List<AimModel>> getAllAims() async {
    var db = await _appDatabase.getDb();
    try {
      List<Map> maps = await db.query(AimModel.TABLE_NAME,
          columns: null, //SELECT
          where: null, //WHERE CONDITION
          whereArgs: []); //ARGS OF WHERE CONDITION
      return maps.map((a) {
        return AimModel.fromMap(a);
      }).toList();
    } catch (e) {
      print(e.toString());
      return List<AimModel>();
    }
  }

  Future<AimModel> getAim(String id) async {
    var db = await _appDatabase.getDb();
    List<Map> maps = await db.query(AimModel.TABLE_NAME,
        columns: [AimModel.ID],
        where: '${AimModel.ID} = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return AimModel.fromMap(maps.first);
    }
    return null;
  }

  Future<void> insert(AimModel aim) async {
    var db = await _appDatabase.getDb();
    try{
      await db.insert(AimModel.TABLE_NAME, aim.toMap());
    }catch(ex){
      throw Exception(ex.toString());
    }

  }

  Future<int> delete(String id) async {
    final db = await _appDatabase.getDb();
    return await db.delete(AimModel.TABLE_NAME,
        where: '${AimModel.ID} = ?', whereArgs: [id]);
  }

  Future<int> update(AimModel aim) async {
    final db = await _appDatabase.getDb();
    return await db.update(AimModel.TABLE_NAME, aim.toMap(),
        where: '${AimModel.ID} = ?', whereArgs: [aim.id]);
  }
}
