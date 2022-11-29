import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/src/application/aim_notifier.dart';
import 'package:wom_pocket/src/database/database.dart';
import 'package:sqflite/sqflite.dart';

import '../../constants.dart';
import '../my_logger.dart';

final aimRepositoryProvider = Provider<AimRepository>((ref) {
  return AimRepository(ref.watch(databaseProvider));
});

class AimRepository {
  final MyDatabase db;
  late AimRemoteDataSources _apiProvider;
  // late AimDatabase _aimDbHelper;

  AimRepository(this.db) {
    _apiProvider = AimRemoteDataSources(domain);
    // _aimDbHelper = AimDatabase.get();
  }

  // check if there is update of Aim
  //TODO delete la riga sotto quando verranno scaricati solo gli aim nuovi
  Future<List<Aim>> updateAim() async {
    logger.i("AimRepository: updateAim()");
    try {
      final newList = await _apiProvider.checkUpdate();
      // final db = await database();
      await db.aimsDao.deleteTable();
      logger.i("${newList.length} NUOVI AIM");
      await saveAimToDb(newList);
      return newList;
    } catch (e) {
      logger.e(e);
      return <Aim>[];
    }
  }

  Future<List<Aim>> getFlatAimList() async {
    logger.i("AimRepository: getFlatAimList()");
    // final db = await database();
    final list = await db.aimsDao.getFlatAimList;
    return list.map((e) => Aim(code: e.code, titles: e.titles)).toList();
    // return await _aimDbHelper.getFlatAimList(db: db);
  }

  Future<Aim?> getAim(
      {Future<Database>? database, required String aimCode}) async {
    logger.i("AimRepository: getAim()");
    // final db = await database!;
    final a = await db.aimsDao.getAim(aimCode);
    return Aim(code: a.code, titles: a.titles);
    // return await _aimDbHelper.getAim(db: db, aimCode: aimCode);
  }

  // Future<List<Aim>> getAimList({
  //   Future<Database> database,
  // }) async {
  //   logger.i("AimRepository: getAimList()");
  //   try {
  //     final db = await database;
  //     List<Aim> rootList =
  //         await _aimDbHelper.getAimWithLevel(db: db, deepLevel: 1);
  //     if (rootList.isEmpty) {
  //       final list = await _apiProvider.getAims();
  //       await saveAimToDb(db, list);
  //       rootList = await _aimDbHelper.getAimWithLevel(db: db, deepLevel: 1);
  //     }
  //
  //     logger.i("START READING");
  //     for (final aim in rootList) {
  //       aim.children = await _aimDbHelper.getAimWithLevel(
  //           db: db, deepLevel: 2, code: aim.code);
  //       for (final aim in aim.children) {
  //         aim.children = await _aimDbHelper.getAimWithLevel(
  //             db: db, deepLevel: 3, code: aim.code);
  //       }
  //     }
  //
  //     logger.i("END READING");
  //     return rootList;
  //   } catch (ex) {
  //     throw ex;
  //   }
  // }

  Future<void> saveAimToDb(List<Aim> list) async {
    logger.i("AimRepository: saveAimToDb()");
    logger.i("SAVING AIM");
    await db.aimsDao.addAims(list
        .map((e) => AimsCompanion.insert(code: e.code, titles: e.titles))
        .toList());
    logger.i("AIM SAVED");
  }
}
