import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pocket/src/db/app_db.dart';
import '../../my_logger.dart';
import './bloc.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(InitialSettingsState());

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    // TODO: Add Logic
  }

  Future<bool> deleteDB() async {
    final File dbFile = await getDbFile('pocket.db');
    if (dbFile != null) {
      await AppDatabase.get().deleteDb();
      final delDb = await dbFile.delete();
      if (delDb != null) return true;
    }
    return false;
  }

  getDbFile(String name) async {
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
    final File dbFile = await getDbFile('pocket.db');
    if (dbFile != null) {
      await AppDatabase.get().closeDatabase();
    }
  }
}
