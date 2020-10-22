import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:pocket/src/db/aim_database.dart';
import 'package:sqflite/sqflite.dart';

import '../../constants.dart';

class AimRepository {
  AimRemoteDataSources _apiProvider;
  AimDatabase _aimDbHelper;

  AimRepository() {
    _apiProvider = AimRemoteDataSources(domain);
    _aimDbHelper = AimDatabase.get();
  }

  // check if there is update of Aim
  //TODO delete la riga sotto quando verranno scaricati solo gli aim nuovi
  Future<List<Aim>> updateAim({Future<Database> database}) async {
    print("AimRepository: updateAim()");
    try {
      final List<Aim> newList = await _apiProvider.checkUpdate();
      if (newList != null) {
        final db = await database;
        await db.delete(AimDbKeys.TABLE_NAME);
        print("${newList.length} NUOVI AIM");
        saveAimToDb(db, newList);
      }
      return newList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<Aim>> getFlatAimList({
    Future<Database> database,
  }) async {
    print("AimRepository: getFlatAimList()");
    final db = await database;
    return await _aimDbHelper.getFlatAimList(db: db);
  }

  Future<Aim> getAim({Future<Database> database, String aimCode}) async {
    print("AimRepository: getAim()");
    final db = await database;
    return await _aimDbHelper.getAim(db: db, aimCode: aimCode);
  }

  Future<List<Aim>> getAimList({
    Future<Database> database,
  }) async {
    print("AimRepository: getAimList()");
    try {
      final db = await database;
      List<Aim> rootList =
          await _aimDbHelper.getAimWithLevel(db: db, deepLevel: 1);
      if (rootList.isEmpty) {
        final list = await _apiProvider.getAims();
        await saveAimToDb(db, list);
        rootList = await _aimDbHelper.getAimWithLevel(db: db, deepLevel: 1);
      }

      print("START READING");
      for (final aim in rootList) {
        aim.children = await _aimDbHelper.getAimWithLevel(
            db: db, deepLevel: 2, code: aim.code);
        for (final aim in aim.children) {
          aim.children = await _aimDbHelper.getAimWithLevel(
              db: db, deepLevel: 3, code: aim.code);
        }
      }

      print("END READING");
      return rootList;
    } catch (ex) {
      throw ex;
    }
  }

  saveAimToDb(Database db, List<Aim> list) async {
    print("AimRepository: saveAimToDb()");
    print("SAVING AIM");
    list.forEach(
      (aim) async {
        await _aimDbHelper.insert(db: db, aim: aim);
      },
    );
    print("AIM SAVED");
  }
}
