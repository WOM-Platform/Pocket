import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:clustering_google_maps/clustering_google_maps.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pocket/src/db/app_db.dart';
import 'package:pocket/src/models/optional_query_model.dart';
import 'package:pocket/src/models/wom_model.dart';
import 'package:pocket/src/services/wom_repository.dart';
import 'package:wom_package/wom_package.dart';

import './bloc.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  WomRepository _womRepository = WomRepository();
  ClusteringHelper clusteringHelper;
  Set<String> sources = Set();
  Set<String> aims = Set();

  MapBloc() {
    initDatabaseClustering();
    loadSources();
  }

  initDatabaseClustering() {
    clusteringHelper = ClusteringHelper.forDB(
      dbGeohashColumn: WomModel.dbGeohash,
      dbLatColumn: WomModel.dbLat,
      dbLongColumn: WomModel.dbLong,
      dbTable: WomModel.tblWom,
      whereClause:
          'WHERE ${WomModel.tblWom}.${WomModel.dbLive} = ${WomStatus.ON.index} AND ${WomModel.tblWom}.${WomModel.dbLive} NOT LIKE "0%"',
      updateMarkers: (markers) {
        dispatch(UpdateMap(markers: markers));
      },
      aggregationSetup: AggregationSetup(),
    );
  }

  loadSources() async {
    print("Clustering query:");
    print(clusteringHelper.whereClause);

    final s = await _womRepository.getWomGroupedBySource();
    final a = await _womRepository.getWomGroupedByAim();
    sources.addAll(s.map((g) => g.type).toList());
    aims.addAll(a.map((g) => g.type).toList());
    aims.removeWhere((a) => a.startsWith('0'));
    dispatch(UpdateMap(
      sources: s,
      aims: a,
    ));
  }

  void onMapCreated(GoogleMapController controller) async {
    print("onMapCreated");
    clusteringHelper.mapController = controller;
    clusteringHelper.database = await AppDatabase.get().getDb();
    clusteringHelper.updateMap();
  }

  @override
  MapState get initialState => InitialMapState();

  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {
    if (event is UpdateMap) {
      if (currentState is MapUpdated) {
        if (event.forceFilterUpdate == true) {
          filter();
        }
        yield (currentState as MapUpdated).copyWith(
            event.markers, event.sliderValue, event.sources, event.aims);
      } else {
        yield MapUpdated(
          sliderValue: event.sliderValue ?? 0.0,
          markers: event.markers ?? {},
          sources: event.sources ?? {},
          aims: event.aims ?? {},
        );
      }
    }
  }

  filter() {
    final int currentSliderValueInt = currentState.sliderValue.toInt();

    int startDateQuery = 0;
    int endDateQuery = 0;

    if (currentSliderValueInt != 0) {
      final today = DateTime.now().toUtc();
      final int todayInMillisecondsSinceEpoch = today.millisecondsSinceEpoch;

      print("NOW UTC : $today");
      print(todayInMillisecondsSinceEpoch);
      final int rangeTime = timeInMilliseconds[currentSliderValueInt];
      final int queryDate = todayInMillisecondsSinceEpoch - rangeTime;
      print(DateTime.fromMillisecondsSinceEpoch(queryDate).toUtc().toString());
      startDateQuery = queryDate;
      endDateQuery = todayInMillisecondsSinceEpoch;
    }

    clusteringHelper.whereClause = OptionalQuery(
      startDate: startDateQuery,
      endDate: endDateQuery,
      womStatus: WomStatus.ON,
      sources: sources,
      aims: aims,
    ).build();

    print("Clustering filter query:");
    print(clusteringHelper.whereClause);

    clusteringHelper.updateMap();
  }

  addSourceToFilter(String source) {
    print("addSourceToFilter: $source");
    sources.add(source);
    dispatch(UpdateMap(forceFilterUpdate: true));
  }

  removeSourceFromFilter(String source) {
    print("removeSourceFromFilter: $source");
    if (sources.contains(source)) {
      sources.remove(source);
      dispatch(UpdateMap(forceFilterUpdate: true));
    }
  }

  void addAimToFilter(String aim) {
    print("addAimToFilter: $aim");
    aims.add(aim);
    dispatch(UpdateMap(forceFilterUpdate: true));
  }

  void removeAimFromFilter(String aim) {
    print("removeAimFromFilter: $aim");
    if (aims.contains(aim)) {
      aims.remove(aim);
      dispatch(UpdateMap(forceFilterUpdate: true));
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
