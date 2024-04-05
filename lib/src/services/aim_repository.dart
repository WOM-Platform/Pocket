import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/src/application/aim_notifier.dart';
import 'package:wom_pocket/src/database/database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wom_pocket/src/services/transaction_repository.dart';

import '../../constants.dart';
import '../my_logger.dart';

final aimRepositoryProvider = Provider<AimRepository>((ref) {
  return AimRepository(ref.watch(getDatabaseProvider), ref.watch(pocketProvider));
});

class AimRepository {
  final MyDatabase db;
  final Pocket pocketClient;
  AimRepository(this.db, this.pocketClient) {
  }

  Future<List<Aim>> updateAim() async {
    logger.i("AimRepository: updateAim()");
    try {
      final newList = await pocketClient.getAimList();
      await db.aimsDao.deleteTable();
      logger.i("${newList.length} NUOVI AIM");
      await saveAimToDb(newList);
      return newList;
    } catch (e, st) {
      logger.e("Unknown error", error: e, stackTrace: st);
      return <Aim>[];
    }
  }

  Future<List<Aim>> getFlatAimList() async {
    logger.i("AimRepository: getFlatAimList()");
    final list = await db.aimsDao.getFlatAimList;
    return list.map((e) => Aim(code: e.code, titles: e.titles)).toList();
  }

  Future<Aim?> getAim(
      {Future<Database>? database, required String aimCode}) async {
    logger.i("AimRepository: getAim()");
    final a = await db.aimsDao.getAim(aimCode);
    return Aim(code: a.code, titles: a.titles);
  }

  Future<void> saveAimToDb(List<Aim> list) async {
    logger.i("AimRepository: saveAimToDb()");
    logger.i("SAVING AIM");
    await db.aimsDao.addAims(list
        .map((e) => AimsCompanion.insert(code: e.code, titles: e.titles))
        .toList());
    logger.i("AIM SAVED");
  }
}
