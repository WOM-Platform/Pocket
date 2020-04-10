import 'package:pocket/src/db/wom_db.dart';
import 'package:pocket/src/models/source_group_wom.dart';

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
//      print("fetchWom: empty list of woms for source empty or null");
//      return List<WomModel>();
//    }
//    final woms = await _womDb.getWoms(
//        startDate: startDate ?? 0,
//        endDate: endDate ?? 0,
//        sources: sources);
//    print("fetchWom: reading complete woms : ${woms.length}");
//    return woms;
//  }

//  Future<int> getMinDate() async {
//    return await _womDb.getMinDate();
//  }

  Future<List<WomGroupBy>> getWomGroupedBySource() async {
    print("BY SOURCES: fetchGroupedWoms: loading woms");
    final groupedWoms = await _womDb.getWomsGroupedBySources();
    print(
        "BY SOURCES: fetchGroupedWoms: reading complete woms : ${groupedWoms.length}");
    return groupedWoms;
  }

  Future<List<WomGroupBy>> getWomGroupedByAim() async {
    print("BY AIM: fetchGroupedWoms: loading woms");
    final groupedWoms = await _womDb.getWomGroupedByAim();
    print(
        "BY AIM: fetchGroupedWoms: reading complete woms : ${groupedWoms.length}");
    return groupedWoms;
  }
}
