import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/core/application/aim_notifier.dart';
import 'package:wom_pocket/src/core/application/pocket_notifier.dart';
import 'package:wom_pocket/src/core/database/database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wom_pocket/src/core/my_logger.dart';

part 'aim_repository.g.dart';

@riverpod
AimRepository aimRepository(AimRepositoryRef ref) {
  return AimRepository(
    ref.watch(getDatabaseProvider),
    ref.watch(pocketProvider),
  );
}

class AimRepository {
  final MyDatabase db;
  final Pocket pocketClient;

  AimRepository(this.db, this.pocketClient) {}

  Future<List<Aim>> updateAim() async {
    logger.i('AimRepository: updateAim()');
    try {
      final newList = await pocketClient.getAimList();
      await db.aimsDao.deleteTable();
      logger.i('${newList.length} NUOVI AIM');
      await saveAimToDb(newList);
      return newList;
    } catch (e, st) {
      logger.e('Unknown error', error: e, stackTrace: st);
      return <Aim>[];
    }
  }

  Future<List<Aim>> getFlatAimList() async {
    logger.i('AimRepository: getFlatAimList()');
    final list = await db.aimsDao.getFlatAimList;
    return list.map((e) => Aim(code: e.code, titles: e.titles)).toList();
  }

  Future<Aim?> getAim({
    required String aimCode,
    Future<Database>? database,
  }) async {
    logger.i('AimRepository: getAim()');
    final a = await db.aimsDao.getAim(aimCode);
    return Aim(code: a.code, titles: a.titles);
  }

  Future<void> saveAimToDb(List<Aim> list) async {
    logger.i('AimRepository: saveAimToDb()');
    logger.i('SAVING AIM');
    await db.aimsDao.addAims(
      list
          .map((e) => AimsCompanion.insert(code: e.code, titles: e.titles))
          .toList(),
    );
    logger.i('AIM SAVED');
  }
}
