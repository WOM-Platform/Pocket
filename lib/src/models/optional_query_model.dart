import 'package:dart_wom_connector/dart_wom_connector.dart'
    show SimpleFilter, SimpleFilterX;
import 'package:wom_pocket/src/models/wom_model.dart';

import '../my_logger.dart';

class OptionalQuery {
  final int startDate;
  final int endDate;
  final WomStatus womStatus;
  final Set<String?>? sources;
  final Set<String?>? aims;
  final SimpleFilter? filters;
  final int? amount;
  final bool enabledRandom;
  final bool orderByDate;
  final bool excludeWomWithoutLocation;

  OptionalQuery({
    this.amount,
    this.startDate = 0,
    this.endDate = 0,
    this.womStatus = WomStatus.ON,
    this.sources,
    this.filters,
    this.aims,
    this.enabledRandom = false,
    this.orderByDate = false,
    this.excludeWomWithoutLocation = false,
  });

  build() {
    var whereClause = startDate > 0 && endDate > 0
        ? "WHERE ${WomModel.tblWom}.${WomModel.dbAddedOn} BETWEEN $startDate AND $endDate"
        : "";

    var statusWhereClause = "${WomModel.tblWom}.spent = ${womStatus.index}";
    whereClause = whereClause.isEmpty
        ? "WHERE $statusWhereClause"
        : "$whereClause AND $statusWhereClause";
  
    if (sources != null) {
      final sourceWhereClause = buildSourceClause(sources!);

      whereClause = whereClause.isEmpty
          ? "WHERE $sourceWhereClause"
          : "$whereClause AND $sourceWhereClause";
    }

    if (aims != null) {
      final aimWhereClause = buildAimClause(aims!);

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
    } else {
      // se non c'è simple filter allora prendo i wom di tutti gli aim eccetto quelli che iniziano con 0
      final aimClause = "${WomModel.tblWom}.${WomModel.dbAim} NOT LIKE \'0%\'";
      whereClause =
          whereClause.isEmpty ? '$aimClause' : "$whereClause AND $aimClause";
    }

    if (excludeWomWithoutLocation) {
      whereClause =
          "$whereClause AND ${WomModel.tblWom}.${WomModel.dbLat} != 0 "
          "AND ${WomModel.tblWom}.${WomModel.dbLong} != 0";
    }

    if (enabledRandom) {
      whereClause = "$whereClause ORDER BY RANDOM()";
    } else if (orderByDate) {
      whereClause = "$whereClause ORDER BY addedOn";
    }

    if (amount != null) {
      whereClause =
          whereClause.isEmpty ? "$whereClause" : "$whereClause LIMIT $amount";
    }

    logger.i("OptionalQueryModel build: $whereClause");

    return whereClause;
  }

  buildSourceClause(Set<String?> sources) {
    var sourceWhereClause = "";
    if (sources.isEmpty) {
      return "${WomModel.tblWom}.${WomModel.dbSourceName} = \'NULL_SOURCE\'";
    }
    sources.forEach((source) {
      sourceWhereClause = sourceWhereClause.isEmpty
          ? "${WomModel.tblWom}.${WomModel.dbSourceName} = \'$source\'"
          : "$sourceWhereClause OR ${WomModel.tblWom}.${WomModel.dbSourceName} = \'$source\'";
    });

    return "($sourceWhereClause)";
  }

  buildAimClause(Set<String?> aims) {
    var aimWhereClause = "";
    if (aims.isEmpty) {
      return "${WomModel.tblWom}.${WomModel.dbAim} = \'NULL_SOURCE\'";
    }
    aims.forEach((aim) {
      aimWhereClause = aimWhereClause.isEmpty
          ? "${WomModel.tblWom}.${WomModel.dbAim} = \'$aim\'"
          : "$aimWhereClause OR ${WomModel.tblWom}.${WomModel.dbAim} = \'$aim\'";
    });

    return "($aimWhereClause)";
  }

  buildSimpleFiltersQuery() {
    String filtersWhereClause = "";
    final String? aim = filters!.aim;
    final bounds = filters!.bounds;

    String aimClause;

    if (aim != null) {
      //aimCode presente prendo i wom di tutti gli aim rispettando l aimCode
      aimClause = "${WomModel.tblWom}.${WomModel.dbAim} LIKE \'$aim%\'";
    } else {
      // se non c'è aimCode prendo i wom di tutti gli aim eccetto quelli che iniziano con 0
      aimClause = "${WomModel.tblWom}.${WomModel.dbAim} NOT LIKE \'0%\'";
    }

    logger.i(aimClause);

    filtersWhereClause = filtersWhereClause.isEmpty
        ? "$aimClause"
        : "$filtersWhereClause AND $aimClause";

    if (filters?.maxAge != null) {
      final int maxAgeInMilliseconds = filters!.maxAgeToMilliseconds!;
      final todayInMilliseconds = DateTime.now().toUtc().millisecondsSinceEpoch;
      final queryTimestamp = todayInMilliseconds - maxAgeInMilliseconds;

      final maxAgeClause =
          "${WomModel.tblWom}.${WomModel.dbAddedOn} >= $queryTimestamp";
      logger.i(maxAgeClause);

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

    logger.i(filtersWhereClause);
    return filtersWhereClause;
  }
}
