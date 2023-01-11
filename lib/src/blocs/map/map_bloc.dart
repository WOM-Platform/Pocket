import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wom_pocket/src/application/aim_notifier.dart';
import 'package:wom_pocket/src/database/database.dart';
import 'package:wom_pocket/src/models/optional_query_model.dart';
import 'package:wom_pocket/src/screens/home/widgets/wom_stats_widget.dart';

import '../../my_logger.dart';
import './bloc.dart';

final mapNotifierProvider =
    AutoDisposeAsyncNotifierProvider<MapBloc, MapState>(MapBloc.new);

class Place with ClusterItem {
  final WomRow voucher;

  Place({required this.voucher});

  @override
  LatLng get location => LatLng(voucher.latitude, voucher.longitude);
}

class MapBloc extends AutoDisposeAsyncNotifier<MapState> {
  // WomRepository _womRepository = WomRepository();
  // late ClusteringHelper clusteringHelper;
  ClusterManager<Place>? clusterManager;
  GoogleMapController? controller;
  Set<String> sources = Set();
  Set<String> aims = Set();
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

  initDatabaseClustering() {
    clusterManager = ClusterManager<Place>(
      places,
      (markers) {
        logger
            .wtf('update from cluster manager with ${markers.length} markers');
        state = AsyncData(updateMap(UpdateMap(markers: markers)));
      },
      markerBuilder: (place) async {
        BitmapDescriptor bitmapDescriptor;

        if (!place.isMultiple) {
          bitmapDescriptor = await BitmapDescriptor.fromAssetImage(
              ImageConfiguration(), 'assets/images/wom_pin.png');
        } else {
          // >1
          final markerIcon = await getBytesFromCanvas(
              150, place.count.toString(), getColor(place.count));
          if (markerIcon != null) {
            bitmapDescriptor = BitmapDescriptor.fromBytes(markerIcon);
          } else {
            bitmapDescriptor = BitmapDescriptor.defaultMarker;
          }
        }

        final MarkerId markerId = MarkerId(place.getId());

        final marker = Marker(
          markerId: markerId,
          position: place.location,
          // infoWindow: InfoWindow(title: place.count.toString()),
          icon: bitmapDescriptor,
        );

        return marker;
      },
      levels: [1, 4.25, 6.75, 8.25, 11.5, 14.5, 16.0, 16.5, 20.0],
      extraPercent: 0.2,
      stopClusteringZoom: 17.0,
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

  Future<MapState> loadSources() async {
    logger.i("Clustering query:");
    // logger.i(clusteringHelper.whereClause);

    try {
      final s = await ref.read(womRepositoryProvider).getWomGroupedBySource();
      final a = await ref.read(womRepositoryProvider).getWomGroupedByAim();
      final womCountWithoutLocation =
          await ref.read(womRepositoryProvider).getWomCountWithoutLocation();
      sources.addAll(s.map((g) => g.type).toSet());
      aims.addAll(a.map((g) => g.type).toSet());
      aims.removeWhere((a) => a.startsWith('0'));
      return updateMap(
        UpdateMap(
          sources: s,
          aims: a,
          womCountWithoutLocation: womCountWithoutLocation,
        ),
      );
    } catch (ex, st) {
      logger.e(ex);
      logger.e(st);
      rethrow;
    }
  }

  void onMapCreated(GoogleMapController controller) async {
    logger.i("onMapCreated");
    // clusteringHelper.mapController = controller;
    this.controller = controller;
    // clusteringHelper.database = ref.read(databaseProvider);
    // clusteringHelper.updateMap();
    clusterManager?.setMapId(controller.mapId);
    clusterManager?.updateMap();
  }

  MapState updateMap(UpdateMap event) {
    if (state is AsyncData) {
      if (state.value! is MapUpdated) {
        if (event.forceFilterUpdate == true) {
          filter(event.sliderValue?.toInt() ?? 0);
        }
        return (state.value! as MapUpdated).copyWith(
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
    return MapUpdated(
      sliderValue: event.sliderValue ?? 0.0,
      markers: event.markers ?? {},
      sources: event.sources ?? [],
      aims: event.aims ?? [],
      womCountWithoutLocation: event.womCountWithoutLocation ?? 0,
    );
  }

  filter(int currentSliderValueInt) {
    final currentState = state;
    if (currentState is! AsyncData) {
      return;
    }
    // final int currentSliderValueInt = state.value!.sliderValue!.toInt();

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

    if (sources.isEmpty || aims.isEmpty) {
      clusterManager?.setItems([]);
      return;
    }

    final newItems = places.where((element) {
      var timeCondition = true;
      var sourceCondition = false;
      var aimCondition = false;
      if (startDateQuery > 0 && endDateQuery > 0) {
        timeCondition = element.voucher.addedOn >= startDateQuery &&
            element.voucher.addedOn <= endDateQuery;
      }
      for (final s in sources) {
        sourceCondition = sourceCondition || element.voucher.sourceName == s;
      }

      for (final a in aims) {
        aimCondition = aimCondition || a == element.voucher.aim;
      }
      if (!aimCondition) {
        print('aimCondition false');
      }

      return timeCondition && sourceCondition && aimCondition;
    }).toList();
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
    clusterManager?.setItems(newItems);
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

  Future<Uint8List?> getBytesFromCanvas(
      int size, String text, MaterialColor color) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..color = color[400]!;
    final Paint paint2 = Paint()..color = color[300]!;
    final Paint paint3 = Paint()..color = color[100]!;
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint3);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.4, paint2);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 3.3, paint1);
    TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
    painter.text = TextSpan(
      text: text,
      style: TextStyle(
          fontSize: size / 4, color: Colors.black, fontWeight: FontWeight.bold),
    );
    painter.layout();
    painter.paint(
      canvas,
      Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
    );

    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data?.buffer.asUint8List();
  }

  MaterialColor getColor(int count) {
    final maxAggregationItems = const [10, 25, 50, 100, 500, 1000];
    final colors = const [
      Colors.grey,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.orange,
      Colors.red,
      Colors.pink
    ];
    if (count < maxAggregationItems[0]) {
      // + 2
      return colors[0];
    } else if (count < maxAggregationItems[1]) {
      // + 10
      return colors[1];
    } else if (count < maxAggregationItems[2]) {
      // + 25
      return colors[2];
    } else if (count < maxAggregationItems[3]) {
      // + 50
      return colors[3];
    } else if (count < maxAggregationItems[4]) {
      // + 100
      return colors[4];
    } else if (count < maxAggregationItems[5]) {
      // +500
      return colors[5];
    } else {
      // + 1k
      return colors[6];
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
