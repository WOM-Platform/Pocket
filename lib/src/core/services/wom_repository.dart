import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/src/core/application/aim_notifier.dart';
import 'package:wom_pocket/src/core/database/database.dart';
import 'package:wom_pocket/src/core/models/source_group_wom.dart';
import 'package:wom_pocket/src/core/my_logger.dart';

final womRepositoryProvider = Provider<WomRepository>((ref) {
  return WomRepository(ref.watch(getDatabaseProvider));
});

class WomRepository {
  // final WomDB _womDb = WomDB.get();
  final MyDatabase database;

  WomRepository(this.database);

  Future<List<WomGroupBy>> getWomGroupedBySource() async {
    logger.i('BY SOURCES: fetchGroupedWoms: loading woms');
    final groupedWoms = await database.womsDao.getWomsGroupedBySources();
    logger.i(
      'BY SOURCES: fetchGroupedWoms: reading complete woms : ${groupedWoms.length}',
    );
    return groupedWoms;
  }

  Future<List<WomGroupBy>> getWomGroupedByAim() async {
    logger.i('BY AIM: fetchGroupedWoms: loading woms');
    final groupedWoms = await database.womsDao.getWomGroupedByAim();
    logger.i(
      'BY AIM: fetchGroupedWoms: reading complete woms : ${groupedWoms.length}',
    );
    return groupedWoms;
  }

  Future<int> getAvailableWomCount() async {
    logger.i('getWomCount');
    final womCount = await database.womsDao.getAvailableWomCount();
    logger.i('getWomCount: $womCount');
    return womCount;
  }

  Future<int> getTotalWomCount() async {
    logger.i('getWomCount');
    final womCount = await database.womsDao.getTotalWomCount();
    logger.i('getWomCount: $womCount');
    return womCount;
  }

  Future<int> getWomCountWithoutLocation() async {
    logger.i('BY AIM: fetchGroupedWoms: loading woms');
    final groupedWoms = await database.womsDao.getWomCountWithoutLocation();
    logger.i(
      'BY AIM: getWomCountWithoutLocation: reading complete woms : ${groupedWoms}',
    );
    return groupedWoms;
  }
}
