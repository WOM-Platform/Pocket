import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pocket/app.dart';
import 'package:pocket/src/blocs/bloc_provider.dart';
import 'package:pocket/src/db/app_db.dart';
import 'package:rxdart/rxdart.dart';

class SettingsBloc extends BlocBase {
  BehaviorSubject<bool> _fakeMode = BehaviorSubject<bool>();

  Observable<bool> get fakeMode => _fakeMode.stream;

  SettingsBloc() {
    _fakeMode.sink.add(fakeModeVar);
  }

  setFakeMode(bool status) {
    _fakeMode.sink.add(status);
    fakeModeVar = status;
    //Utils.setFakeModeToSharedPreference(status);
  }

  Future<bool> deleteDB() async {
    final File dbFile = await getDbFile('pocket.db');
    if(dbFile != null){
      await AppDatabase.get().closeDatabase();
      final delDb = await dbFile.delete();
      if (delDb != null) return true;
    }
    return false;


//    final dir = await getApplicationDocumentsDirectory();
//    print(dir.path);
//    if (await dir.exists()) {
//      File dbFile = File(dir.path + "/pocket.db");
//      if (await dbFile.exists()) {
//        print(dbFile.path);
//        await AppDatabase.get().closeDatabase();
//
//        final delDb = await dbFile.delete();
//        if (delDb != null) return true;
//      }
//      return false;
//    }
//    return true;
  }

  getDbFile(String name) async {
    final dir = await getApplicationDocumentsDirectory();
    print(dir.path);
    if (await dir.exists()) {
      File dbFile = File(dir.path + "/" + name);
      if(await dbFile.exists()){
        return dbFile;
      }
    }
    return null;
  }

  closeDb() async {
    final File dbFile = await getDbFile('pocket.db');
    if(dbFile != null){
      await AppDatabase.get().closeDatabase();
    }
  }

  @override
  void dispose() {
    _fakeMode.close();
  }
}
