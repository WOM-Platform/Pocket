import 'package:wom_pocket/src/database/database.dart';
import 'package:wom_pocket/src/models/source_group_wom.dart';

import '../my_logger.dart';

class WomRepository {
  // final WomDB _womDb = WomDB.get();
  final MyDatabase database;

  WomRepository(this.database);

//  Future<List<WomModel>> getWoms({
//    int startDate,
//    int endDate,
//    LatLngBounds bounds,
//    String filter,
//    Set<String> sources,
//    bool all = false,
//  }) async {
//    if (sources != null && sources.isEmpty) {
//      logger.i("fetchWom: empty list of woms for source empty or null");
//      return List<WomModel>();
//    }
//    final woms = await _womDb.getWoms(
//        startDate: startDate ?? 0,
//        endDate: endDate ?? 0,
//        sources: sources);
//    logger.i("fetchWom: reading complete woms : ${woms.length}");
//    return woms;
//  }

//  Future<int> getMinDate() async {
//    return await _womDb.getMinDate();
//  }

  Future<List<WomGroupBy>> getWomGroupedBySource() async {
    logger.i("BY SOURCES: fetchGroupedWoms: loading woms");
    final groupedWoms = await database.womsDao.getWomsGroupedBySources();
    logger.i(
        "BY SOURCES: fetchGroupedWoms: reading complete woms : ${groupedWoms.length}");
    return groupedWoms;
  }

  Future<List<WomGroupBy>> getWomGroupedByAim() async {
    logger.i("BY AIM: fetchGroupedWoms: loading woms");
    final groupedWoms = await database.womsDao.getWomGroupedByAim();
    logger.i(
        "BY AIM: fetchGroupedWoms: reading complete woms : ${groupedWoms.length}");
    return groupedWoms;
  }

  Future<int> getAvailableWomCount() async {
    logger.i("getWomCount");
    final womCount = await database.womsDao.getAvailableWomCount();
    logger.i("getWomCount: $womCount");
    return womCount;
  }

  Future<int> getTotalWomCount() async {
    logger.i("getWomCount");
    final womCount = await database.womsDao.getTotalWomCount();
    logger.i("getWomCount: $womCount");
    return womCount;
  }


  Future<int> getWomCountWithoutLocation() async {
    logger.i("BY AIM: fetchGroupedWoms: loading woms");
    final groupedWoms = await database.womsDao.getWomCountWithoutLocation();
    logger.i(
        "BY AIM: getWomCountWithoutLocation: reading complete woms : ${groupedWoms}");
    return groupedWoms;
  }
}
