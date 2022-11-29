import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wom_pocket/src/application/aim_notifier.dart';
import 'package:wom_pocket/src/database/database.dart';
import 'package:wom_pocket/src/screens/home/widgets/wom_stats_widget.dart';

import '../../my_logger.dart';
import './bloc.dart';

final mapNotifierProvider =
    AsyncNotifierProvider<MapBloc, MapState>(MapBloc.new);

class Place with ClusterItem {
  final WomRow voucher;

  Place({required this.voucher});

  @override
  LatLng get location => LatLng(voucher.latitude, voucher.longitude);
}

class MapBloc extends AsyncNotifier<MapState> {
  // WomRepository _womRepository = WomRepository();
  // late ClusteringHelper clusteringHelper;
  late ClusterManager clusterManager;
  GoogleMapController? controller;
  Set<String?> sources = Set();
  Set<String?> aims = Set();
  List<Place> places = [];

  @override
  FutureOr<MapState> build() async {
    state = AsyncData(InitialMapState());
    final woms = await ref.read(databaseProvider).womsDao.getAllWoms;
    places = woms.map((e) => Place(voucher: e)).toList();
    initDatabaseClustering();
    return loadSources();
  }

  //
  // MapBloc() : super(InitialMapState()) {
  //   initDatabaseClustering();
  //   loadSources();
  // }

  Future initDatabaseClustering() async {
    clusterManager = ClusterManager<Place>(places,
        // Your items to be clustered on the map (of Place type for this example)
        (markers) {
      state = AsyncData(updateMap(UpdateMap(markers: markers)));
    }, // Method to be called when markers are updated
        // markerBuilder: _markerBuilder, // Optional : Method to implement if you want to customize markers
        levels: [1, 4.25, 6.75, 8.25, 11.5, 14.5, 16.0, 16.5, 20.0],
        // Optional : Configure this if you want to change zoom levels at which the clustering precision change
        extraPercent: 0.2,
        // Optional : This number represents the percentage (0.2 for 20%) of latitude and longitude (in each direction) to be considered on top of the visible map bounds to render clusters. This way, clusters don't "pop out" when you cross the map.
        stopClusteringZoom:
            17.0 // Optional : The zoom level to stop clustering, so it's only rendering single item "clusters"
        );

    // clusteringHelper = ClusteringHelper.forDB(
    //   maxZoomForAggregatePoints: 18,
    //   dbGeohashColumn: WomModel.dbGeohash,
    //   dbLatColumn: WomModel.dbLat,
    //   dbLongColumn: WomModel.dbLong,
    //   dbTable: WomModel.tblWom,
    //   whereClause:
    //       'WHERE ${WomModel.tblWom}.${WomModel.dbLive} = ${WomStatus.ON.index} '
    //       'AND ${WomModel.tblWom}.${WomModel.dbAim} NOT LIKE "0%" '
    //       'AND ${WomModel.tblWom}.${WomModel.dbLat} != 0 '
    //       'AND ${WomModel.tblWom}.${WomModel.dbLong} != 0',
    //   updateMarkers: (markers) {
    //     state = updateMap(UpdateMap(markers: markers));
    //   },
    //   aggregationSetup: AggregationSetup(),
    // );
  }

  loadSources() async {
    logger.i("Clustering query:");
    // logger.i(clusteringHelper.whereClause);

    final s = await ref.read(womRepositoryProvider).getWomGroupedBySource();
    final a = await ref.read(womRepositoryProvider).getWomGroupedByAim();
    final womCountWithoutLocation =
        await ref.read(womRepositoryProvider).getWomCountWithoutLocation();
    sources.addAll(s.map((g) => g.type).toList());
    aims.addAll(a.map((g) => g.type).toList());
    aims.removeWhere((a) => a!.startsWith('0'));
    return updateMap(UpdateMap(
        sources: s, aims: a, womCountWithoutLocation: womCountWithoutLocation));
  }

  void onMapCreated(GoogleMapController controller) async {
    logger.i("onMapCreated");
    // clusteringHelper.mapController = controller;
    this.controller = controller;
    // clusteringHelper.database = ref.read(databaseProvider);
    // clusteringHelper.updateMap();
    clusterManager.setMapId(controller.mapId);
    clusterManager.updateMap();
  }

  MapUpdated updateMap(UpdateMap event) {
    if (state is MapUpdated) {
      if (event.forceFilterUpdate == true) {
        // filter();
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
    final currentState = state;
    if (currentState is! AsyncData) {
      return;
    }
    final int currentSliderValueInt = state.value!.sliderValue!.toInt();

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

    // clusteringHelper.whereClause = OptionalQuery(
    //         startDate: startDateQuery,
    //         endDate: endDateQuery,
    //         womStatus: WomStatus.ON,
    //         sources: sources,
    //         aims: aims,
    //         excludeWomWithoutLocation: true)
    //     .build();

    // logger.i("Clustering filter query:");
    // logger.i(clusteringHelper.whereClause);

    // clusteringHelper.updateMap();
    // clusterManager.updateMap();
  }

  addSourceToFilter(String source) {
    logger.i("addSourceToFilter: $source");
    sources.add(source);
    state = AsyncData(updateMap(UpdateMap(forceFilterUpdate: true)));
  }

  removeSourceFromFilter(String source) {
    logger.i("removeSourceFromFilter: $source");
    if (sources.contains(source)) {
      sources.remove(source);
      state = AsyncData(updateMap(UpdateMap(forceFilterUpdate: true)));
    }
  }

  void addAimToFilter(String aim) {
    logger.i("addAimToFilter: $aim");
    aims.add(aim);
    state = AsyncData(updateMap(UpdateMap(forceFilterUpdate: true)));
  }

  void removeAimFromFilter(String aim) {
    logger.i("removeAimFromFilter: $aim");
    if (aims.contains(aim)) {
      aims.remove(aim);
      state = AsyncData(updateMap(UpdateMap(forceFilterUpdate: true)));
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
