import 'package:wom_pocket/src/db/wom_db.dart';
import 'package:wom_pocket/src/models/source_group_wom.dart';

import '../my_logger.dart';

class WomRepository {
  final WomDB _womDb = WomDB.get();

  WomRepository();

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
    final groupedWoms = await _womDb.getWomsGroupedBySources();
    logger.i(
        "BY SOURCES: fetchGroupedWoms: reading complete woms : ${groupedWoms.length}");
    return groupedWoms;
  }

  Future<List<WomGroupBy>> getWomGroupedByAim() async {
    logger.i("BY AIM: fetchGroupedWoms: loading woms");
    final groupedWoms = await _womDb.getWomGroupedByAim();
    logger.i(
        "BY AIM: fetchGroupedWoms: reading complete woms : ${groupedWoms.length}");
    return groupedWoms;
  }

  Future<int> getWomCount()async{
    logger.i("getWomCount");
    final womCount = await _womDb.getWomCount();
    logger.i(
        "getWomCount: $womCount");
    return womCount;
  }
}
