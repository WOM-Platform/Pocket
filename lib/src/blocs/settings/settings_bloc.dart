import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:wom_pocket/src/db/app_db.dart';

import '../../my_logger.dart';

class SettingsBloc{

  Future<bool> deleteDB() async {
    try {
      final dbFile = await getDbFile('pocket.db');
      if (dbFile != null) {
        await AppDatabase.get().deleteDb();
        await dbFile.delete();
        return true;
      }
      return false;
    } catch (ex) {
      logger.e(ex);
      return false;
    }
  }

  Future<File?> getDbFile(String name) async {
    final dir = await getApplicationDocumentsDirectory();
    logger.i(dir.path);
    if (await dir.exists()) {
      File dbFile = File(dir.path + "/" + name);
      if (await dbFile.exists()) {
        return dbFile;
      }
    }
    return null;
  }

  closeDb() async {
    final dbFile = await getDbFile('pocket.db');
    if (dbFile != null) {
      await AppDatabase.get().closeDatabase();
    }
  }
}
