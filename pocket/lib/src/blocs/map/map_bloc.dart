import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:clustering_google_maps/clustering_google_maps.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pocket/src/db/app_db.dart';
import 'package:pocket/src/models/optional_query_model.dart';
import 'package:pocket/src/models/source_group_wom.dart';
import 'package:pocket/src/models/wom_model.dart';
import 'package:pocket/src/services/wom_repository.dart';
import './bloc.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  WomRepository _womRepository = WomRepository();
  ClusteringHelper clusteringHelper;
  Set<String> sources = Set();

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
      updateMarkers: (markers) {
        dispatch(UpdateMap(markers: markers));
      },
    );
  }

  loadSources() async {
    final s = await _womRepository.getGroupedWom();
    sources.addAll(s.map((g) => g.type).toList());
    dispatch(UpdateMap(sources: s));
  }

  void onMapCreated(GoogleMapController controller) async {
    print("onMapCreated");
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

        yield (currentState as MapUpdated)
            .copyWith(event.markers, event.sliderValue, event.sources);
      } else {
        yield MapUpdated(
            sliderValue: event.sliderValue ?? 0.0,
            markers: event.markers ?? {},
            sources: event.sources ?? {});
      }
    }
  }

  filter() {
    final int currentSliderValueInt = currentState.sliderValue.toInt();

    int startDateQuery = 0;
    int endDateQuery = 0;

    if (currentSliderValueInt != 0) {
      final int todayInMillisecondsSinceEpoch =
          DateTime.now().millisecondsSinceEpoch;

      final int rangeTime = timeInMilliseconds[currentSliderValueInt];
      final int queryDate = todayInMillisecondsSinceEpoch - rangeTime;
      print(DateTime.fromMillisecondsSinceEpoch(queryDate).toString());
      startDateQuery = queryDate;
      endDateQuery = todayInMillisecondsSinceEpoch;
    }


    clusteringHelper.whereClause = OptionalQuery(
      startDate: startDateQuery,
      endDate: endDateQuery,
      sources: sources,
    ).build();

    print( clusteringHelper.whereClause);

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

//  Future<void> changeDateFilter(double sliderValue) async {
//    if (sliderValue != previousDateFilterValue) {
//      previousDateFilterValue = sliderValue;
//      print("fetch query for filter time changed");
//      final sliderValueInt = sliderValue.toInt();
//
//      if (sliderValueInt == 0) {
//        startDateQuery = 0;
//        endDateQuery = 0;
//      } else {
//        final int todayInMillisecondsSinceEpoch =
//            DateTime.now().millisecondsSinceEpoch;
//
//        final int rangeTime = timeInMilliseconds[sliderValueInt];
//        final int queryDate = todayInMillisecondsSinceEpoch - rangeTime;
//        print(DateTime.fromMillisecondsSinceEpoch(queryDate).toString());
//        startDateQuery = queryDate;
//        endDateQuery = todayInMillisecondsSinceEpoch;
//      }
//
//      clusteringHelper.whereClause = OptionalQuery(
//        startDate: startDateQuery,
//        endDate: endDateQuery,
//        sources: filterSource,
//      ).build();
//
//      await clusteringHelper.updateMap();
//    }
//  }

  void performQuery() {}
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
  0,
];
