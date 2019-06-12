import 'package:pocket/src/models/simple_filters_model.dart';
import 'package:pocket/src/models/wom_model.dart';
import 'package:wom_package/wom_package.dart';

class OptionalQuery {
  final int startDate;
  final int endDate;
  final WomStatus womStatus;
  final Set<String> sources;
  final Set<String> aims;
  final SimpleFilters filters;

  OptionalQuery({
    this.startDate = 0,
    this.endDate = 0,
    this.womStatus = WomStatus.ON,
    this.sources,
    this.filters,
    this.aims,
  });

  build() {
    var whereClause = startDate > 0 && endDate > 0
        ? "WHERE ${WomModel.tblWom}.${WomModel.dbTimestamp} BETWEEN $startDate AND $endDate"
        : "";

    var statusWhereClause =
        "${WomModel.tblWom}.${WomModel.dbLive} = ${womStatus.index}";
    whereClause = whereClause.isEmpty
        ? "WHERE $statusWhereClause"
        : "$whereClause AND $statusWhereClause";

    if (sources != null) {
      final sourceWhereClause = buildSourceClause(sources);

      whereClause = whereClause.isEmpty
          ? "WHERE $sourceWhereClause"
          : "$whereClause AND $sourceWhereClause";
    }

    if(aims != null){
      final aimWhereClause = buildAimClause(aims);

      whereClause = whereClause.isEmpty
          ? "WHERE $aimWhereClause"
          : "$whereClause AND $aimWhereClause";
    }

    if (filters != null) {
      final String filterClause = buildSimpleFiltersQuery();

      if (whereClause.isEmpty) {
        whereClause = filterClause.isEmpty ? "" : "WHERE $filterClause";
      } else {
        whereClause = filterClause.isEmpty
            ? "$whereClause"
            : "$whereClause AND $filterClause";
      }
//      whereClause = whereClause.isEmpty
//          ? "WHERE $filterClause"
//          : "$whereClause AND $filterClause";
    }

    print(whereClause);

    return whereClause;
  }

  buildSourceClause(Set<String> sources) {
    var sourceWhereClause = "";
    if (sources.isEmpty) {
      return "${WomModel.tblWom}.${WomModel.dbSourceName} = NULL_SOURCE";
    }
    sources.forEach((source) {
      sourceWhereClause = sourceWhereClause.isEmpty
          ? "${WomModel.tblWom}.${WomModel.dbSourceName} = \"$source\""
          : "$sourceWhereClause OR ${WomModel.tblWom}.${WomModel.dbSourceName} = \"$source\"";
    });

    return sourceWhereClause;
  }

  buildAimClause(Set<String> aims) {
    var aimWhereClause = "";
    if (aims.isEmpty) {
      return "${WomModel.tblWom}.${WomModel.dbAim} = NULL_SOURCE";
    }
    aims.forEach((aim) {
      aimWhereClause = aimWhereClause.isEmpty
          ? "${WomModel.tblWom}.${WomModel.dbAim} = \"$aim\""
          : "$aimWhereClause OR ${WomModel.tblWom}.${WomModel.dbAim} = \"$aim\"";
    });

    return aimWhereClause;
  }

  buildSimpleFiltersQuery() {
    String filtersWhereClause = "";
    final String aim = filters.aim;
    final bounds = filters.bounds;
    if (aim != null) {
      final aimClause = "${WomModel.tblWom}.${WomModel.dbAim} LIKE \"$aim%\"";
      print(aimClause);

      filtersWhereClause = filtersWhereClause.isEmpty
          ? "$aimClause"
          : "$filtersWhereClause AND $aimClause";
    }

    if (filters.maxAge != null) {
      final int maxAgeInMilliseconds = filters.maxAgeToMilliseconds;
      final todayInMillisecons = DateTime.now().millisecondsSinceEpoch;
      final queryTimestamp = todayInMillisecons - maxAgeInMilliseconds;

      final maxAgeClause =
          "${WomModel.tblWom}.${WomModel.dbTimestamp} >= $queryTimestamp";
      print(maxAgeClause);

      filtersWhereClause = filtersWhereClause.isEmpty
          ? "$maxAgeClause"
          : "$filtersWhereClause AND $maxAgeClause";
    }

    if (bounds != null) {
      String boundsClause = "";
      final double leftTopLatitude = bounds.leftTop[0];
      final double leftTopLongitude = bounds.leftTop[1];
      final double rightTopLatitude = bounds.rightBottom[0];
      final double rightTopLongitude = bounds.rightBottom[1];

      final latQuery = (leftTopLatitude > rightTopLatitude)
          ? "(${WomModel.dbLat} <= $leftTopLatitude AND ${WomModel.dbLat} >= $rightTopLatitude)"
          : "(${WomModel.dbLat} <= $leftTopLatitude OR ${WomModel.dbLat} >= $rightTopLatitude)";

      final longQuery = (leftTopLongitude < rightTopLongitude)
          ? "(${WomModel.dbLong} >= $leftTopLongitude AND ${WomModel.dbLong} <= $rightTopLongitude)"
          : "(${WomModel.dbLong} >= $leftTopLongitude OR ${WomModel.dbLong} <= $rightTopLongitude)";

      boundsClause = "$latQuery AND $longQuery";
      filtersWhereClause = filtersWhereClause.isEmpty
          ? "$boundsClause"
          : "$filtersWhereClause AND $boundsClause";
    }

    print(filtersWhereClause);
    return filtersWhereClause;
  }
}
