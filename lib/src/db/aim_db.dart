//import 'package:wom_package/wom_package.dart';
//import 'app_db.dart';
//
//class AimDb {
//  static final AimDb _aimDb = new AimDb._internal(AppDatabase.get());
//
//  AppDatabase _appDatabase;
//  AimDbHelper _aimDbHelper = AimDbHelper();
//
//  AimDb._internal(this._appDatabase);
//
//  static AimDb get() {
//    return _aimDb;
//  }
//
//  Future<List<Aim>> getAimWithLevel({int deepLevel, String code}) async {
//    var db = await _appDatabase.getDb();
//    return await _aimDbHelper.getAimWithLevel(
//        db: db, deepLevel: deepLevel, code: code);
//  }
//
//  Future<Aim> getAim(String aimCode) async {
//    var db = await _appDatabase.getDb();
//    return await _aimDbHelper.getAim(db: db, aimCode: aimCode);
//  }
//
//  /// Inserts or replaces the task.
//  Future<int> insert(Aim aim) async {
//    var db = await _appDatabase.getDb();
//    return await _aimDbHelper.insert(db: db, aim: aim);
//  }
//}
