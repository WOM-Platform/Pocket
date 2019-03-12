import 'package:pocket/src/models/simple_filters_model.dart';
import 'package:pocket/src/models/wom_model.dart';

class OptionalQuery {
  final int startDate;
  final int endDate;
  final WomStatus womStatus;
  final Set<String> sources;
  final SimpleFilters filters;

  OptionalQuery({
    this.startDate = 0,
    this.endDate = 0,
    this.womStatus = WomStatus.ON,
    this.sources,
    this.filters,
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

    if (filters != null) {
      final filterClause = buildSimpleFiltersQuery();

      whereClause = whereClause.isEmpty
          ? "WHERE $filterClause"
          : "$whereClause AND $filterClause";
    }

    print(whereClause);
    return whereClause;
  }

  buildSourceClause(Set<String> sources) {
    var sourceWhereClause = "";
    if (sources.isEmpty) {
      return "${WomModel.tblWom}.${WomModel.dbSourceName} = FAKE";
    }
    sources.forEach((source) {
      sourceWhereClause = sourceWhereClause.isEmpty
          ? "${WomModel.tblWom}.${WomModel.dbSourceName} = \"$source\""
          : "$sourceWhereClause OR ${WomModel.tblWom}.${WomModel.dbSourceName} = \"$source\"";
    });

    return sourceWhereClause;
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