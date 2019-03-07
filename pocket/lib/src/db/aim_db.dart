import 'package:pocket/src/db/app_db.dart';

class AimDB{

  static final AimDB _womDb = new AimDB._internal(AppDatabase.get());

  AppDatabase _appDatabase;

  //private internal constructor to make it singleton
  AimDB._internal(this._appDatabase);

  //static WomDB get taskDb => _taskDb;

  static AimDB get() {
    return _womDb;
  }

}