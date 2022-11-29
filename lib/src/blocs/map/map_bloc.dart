import 'dart:async';

import 'package:clustering_google_maps/clustering_google_maps.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wom_pocket/src/db/app_db.dart';
import 'package:wom_pocket/src/models/optional_query_model.dart';
import 'package:wom_pocket/src/models/wom_model.dart';
import 'package:wom_pocket/src/services/wom_repository.dart';

import '../../my_logger.dart';
import './bloc.dart';

final mapNotifierProvider = NotifierProvider<MapBloc, MapState>(MapBloc.new);

class MapBloc extends Notifier<MapState> {
  WomRepository _womRepository = WomRepository();
  late ClusteringHelper clusteringHelper;
  Set<String?> sources = Set();
  Set<String?> aims = Set();

  @override
  build() {
    state = InitialMapState();
    initDatabaseClustering();
    return loadSources();
  }

  //
  // MapBloc() : super(InitialMapState()) {
  //   initDatabaseClustering();
  //   loadSources();
  // }

  initDatabaseClustering() {
    clusteringHelper = ClusteringHelper.forDB(
      maxZoomForAggregatePoints: 18,
      dbGeohashColumn: WomModel.dbGeohash,
      dbLatColumn: WomModel.dbLat,
      dbLongColumn: WomModel.dbLong,
      dbTable: WomModel.tblWom,
      whereClause:
          'WHERE ${WomModel.tblWom}.${WomModel.dbLive} = ${WomStatus.ON.index} '
          'AND ${WomModel.tblWom}.${WomModel.dbAim} NOT LIKE "0%" '
          'AND ${WomModel.tblWom}.${WomModel.dbLat} != 0 '
          'AND ${WomModel.tblWom}.${WomModel.dbLong} != 0',
      updateMarkers: (markers) {
        state = updateMap(UpdateMap(markers: markers));
      },
      aggregationSetup: AggregationSetup(),
    );
  }

  loadSources() async {
    logger.i("Clustering query:");
    logger.i(clusteringHelper.whereClause);

    final s = await _womRepository.getWomGroupedBySource();
    final a = await _womRepository.getWomGroupedByAim();
    final womCountWithoutLocation =
        await _womRepository.getWomCountWithoutLocation();
    sources.addAll(s.map((g) => g.type).toList());
    aims.addAll(a.map((g) => g.type).toList());
    aims.removeWhere((a) => a!.startsWith('0'));
    return updateMap(UpdateMap(
        sources: s, aims: a, womCountWithoutLocation: womCountWithoutLocation));
  }

  void onMapCreated(GoogleMapController controller) async {
    logger.i("onMapCreated");
    clusteringHelper.mapController = controller;
    clusteringHelper.database = await AppDatabase.get().getDb();
    clusteringHelper.updateMap();
  }

  MapUpdated updateMap(UpdateMap event) {
    if (state is MapUpdated) {
      if (event.forceFilterUpdate == true) {
        filter();
      }
      return (state as MapUpdated).copyWith(
        event.markers,
        event.sliderValue,
        event.sources,
        event.aims,
        event.womCountWithoutLocation,
      );
    } else {
      return MapUpdated(
        sliderValue: event.sliderValue ?? 0.0,
        markers: event.markers ?? {},
        sources: event.sources ?? [],
        aims: event.aims ?? [],
        womCountWithoutLocation: event.womCountWithoutLocation ?? 0,
      );
    }
  }

  filter() {
    final int currentSliderValueInt = state.sliderValue!.toInt();

    int startDateQuery = 0;
    int endDateQuery = 0;

    if (currentSliderValueInt != 0) {
      final today = DateTime.now().toUtc();
      final int todayInMillisecondsSinceEpoch = today.millisecondsSinceEpoch;

      logger.i("NOW UTC : $today");
      logger.i(todayInMillisecondsSinceEpoch);
      final int rangeTime = timeInMilliseconds[currentSliderValueInt];
      final int queryDate = todayInMillisecondsSinceEpoch - rangeTime;
      logger
          .i(DateTime.fromMillisecondsSinceEpoch(queryDate).toUtc().toString());
      startDateQuery = queryDate;
      endDateQuery = todayInMillisecondsSinceEpoch;
    }

    clusteringHelper.whereClause = OptionalQuery(
            startDate: startDateQuery,
            endDate: endDateQuery,
            womStatus: WomStatus.ON,
            sources: sources,
            aims: aims,
            excludeWomWithoutLocation: true)
        .build();

    logger.i("Clustering filter query:");
    logger.i(clusteringHelper.whereClause);

    clusteringHelper.updateMap();
  }

  addSourceToFilter(String source) {
    logger.i("addSourceToFilter: $source");
    sources.add(source);
    state = updateMap(UpdateMap(forceFilterUpdate: true));
  }

  removeSourceFromFilter(String source) {
    logger.i("removeSourceFromFilter: $source");
    if (sources.contains(source)) {
      sources.remove(source);
      state = updateMap(UpdateMap(forceFilterUpdate: true));
    }
  }

  void addAimToFilter(String aim) {
    logger.i("addAimToFilter: $aim");
    aims.add(aim);
    state = updateMap(UpdateMap(forceFilterUpdate: true));
  }

  void removeAimFromFilter(String aim) {
    logger.i("removeAimFromFilter: $aim");
    if (aims.contains(aim)) {
      aims.remove(aim);
      state = updateMap(UpdateMap(forceFilterUpdate: true));
    }
  }
}

const timeInMilliseconds = [
  315360000000, //ten years
  157680000000, //five years
  94608000000, //three years
  31536000000, //one year
  283824000000, //nine months
  16070400000, //six months
  8035200000, //three months
  2678400000, //one month
  1209600000, //two weeks
  604800000, //one week
  86400000,
];
