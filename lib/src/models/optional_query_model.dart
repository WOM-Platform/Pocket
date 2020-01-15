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

    if (aims != null) {
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

    print("OptionalQueryModel build: $whereClause");

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

    return "($sourceWhereClause)";
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

    return "($aimWhereClause)";
  }

  buildSimpleFiltersQuery() {
    String filtersWhereClause = "";
    final String aim = filters.aimCode;
    final bounds = filters.bounds;

    String aimClause;
    if (aim != null) {
      aimClause = "${WomModel.tblWom}.${WomModel.dbAim} LIKE \"$aim%\"";
    } else {
      aimClause = "${WomModel.tblWom}.${WomModel.dbAim} NOT LIKE \"0%\"";
    }
    print(aimClause);

    filtersWhereClause = filtersWhereClause.isEmpty
        ? "$aimClause"
        : "$filtersWhereClause AND $aimClause";

    if (filters.maxAge != null) {
      final int maxAgeInMilliseconds = filters.maxAgeToMilliseconds;
      final todayInMillisecons = DateTime.now().toUtc().millisecondsSinceEpoch;
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
      final double rightBottomLatitude = bounds.rightBottom[0];
      final double rightBottomLongitude = bounds.rightBottom[1];

      final latQuery = (leftTopLatitude > rightBottomLatitude)
          ? "(${WomModel.dbLat} <= $leftTopLatitude AND ${WomModel.dbLat} >= $rightBottomLatitude)"
          : "(${WomModel.dbLat} <= $leftTopLatitude OR ${WomModel.dbLat} >= $rightBottomLatitude)";

      final longQuery = (leftTopLongitude < rightBottomLongitude)
          ? "(${WomModel.dbLong} >= $leftTopLongitude AND ${WomModel.dbLong} <= $rightBottomLongitude)"
          : "(${WomModel.dbLong} >= $leftTopLongitude OR ${WomModel.dbLong} <= $rightBottomLongitude)";

      boundsClause = "$latQuery AND $longQuery";
      filtersWhereClause = filtersWhereClause.isEmpty
          ? "$boundsClause"
          : "$filtersWhereClause AND $boundsClause";
    }

    print(filtersWhereClause);
    return filtersWhereClause;
  }
}
