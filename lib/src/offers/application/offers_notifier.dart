import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/my_logger.dart';
import 'package:wom_pocket/src/offers/data/offer.dart';
import 'package:wom_pocket/src/offers/ui/carousel.dart';
import 'package:wom_pocket/src/services/transaction_repository.dart';

part 'offers_notifier.g.dart';

@Riverpod(keepAlive: true)
class OffersNotifier extends _$OffersNotifier {
  FutureOr<List<OfferPOS>> build() async {
    final currentPosition = await ref.watch(locationNotifierProvider.future);

    final offers = await loadOffers(
      currentPosition: currentPosition,
    );
    logger.w('offers: ${offers.length}');
    return offers;
  }

  Future<List<OfferPOS>> loadOffers({
    LatLng? currentPosition,
    // required LatLngBounds bounds,
    // required double llx,
    // required double lly,
    // required double urx,
    // required double ury,
  }) async {
    // final currentState = state;
    try {
      final tmp =
          currentPosition ?? await ref.refresh(locationNotifierProvider.future);
      // state = state.copyWith(isLoading: true);

      if (tmp == null) throw Exception();

      final data = await ref.watch(pocketProvider).getOffers(
            // latitude: 43.72, longitude: 12.63,
            latitude: tmp.latitude,
            longitude: tmp.longitude,
          );
      // final posList = await ref
      //     .read(registryClientProvider)
      //     .getPosListAroundMe(llx: llx, lly: lly, urx: urx, ury: ury);
      //
      // final markers = await buildMarkers(posList);
      // state = PosMapData(posList: posList, markers: markers);

      // final casa = LatLng(42.812645629485296, 13.72460981150593);
      // final list = List.generate(
      //   200,
      //   (index) => OfferPOS(
      //     posId: 'id_$index',
      //     name: 'Cartolibreria Raffaello	',
      //     description: 'Sconto del 50% sulle fotocopie in bianco e nero',
      //     distanceInKms: 0.120,
      //     position: OfferPosition(
      //       latitude: 42.812645629485296 + Random().nextDouble() / 10,
      //       longitude: 13.72460981150593 + Random().nextDouble() / 10,
      //     ),
      //   ),
      // );
      return data
          .map(
            (e) => e.copyWith(
              distance: distance(tmp.latitude, tmp.longitude, e.position),
            ),
          )
          .toList();
    } catch (ex) {
      logger.e(ex);
      // state = currentState;
      rethrow;
    }
  }

  String distance(double lat, double long, OfferPosition position) {
    final d =
        distanceBetweenPoints(position.latitude, position.longitude, lat, long);
    if (d > 1000) return '${(d / 1000).toStringAsFixed(1)} km';
    return '${d.toStringAsFixed(0)} m';
  }
}

// @Riverpod(keepAlive: true)
// class FlatOffersNotifier extends _$FlatOffersNotifier {
//   FutureOr<List<FlatOffer>> build() async {
//     final posList = await ref.watch(offersNotifierProvider.future);
//
//     final tmp = <FlatOffer>[];
//     for (int i = 0; i < posList.length; i++) {
//       final pos = posList[i];
//       final offers =
//           pos.offers.map((o) => FlatOffer.fromOfferPOS(pos, o)).toList();
//       tmp.addAll(offers);
//     }
//     return tmp;
//   }
// }

@riverpod
class OffersMapNotifier extends _$OffersMapNotifier {
  ClusterManager<OfferCluster>? clusterManager;

  List<OfferPOS> posList = [];

  onUpdate(Set<Marker> markers) {
    logger.i('update from cluster manager with ${markers.length} markers');
    state = AsyncData(OffersMapData(markers: markers, offers: posList));
  }

  BitmapDescriptor? activePOS;
  BitmapDescriptor? inactivePOS;

  FutureOr<OffersMapData> build() async {
    logger.wtf('OffersMapNotifier build');
    clusterManager ??= ClusterManager<OfferCluster>(
      [],
      onUpdate,
      stopClusteringZoom: 16,
      markerBuilder: (place) async {
        BitmapDescriptor bitmapDescriptor;

        if (!place.isMultiple) {
          final active = await singlePOSCanvasBytes(50, Colors.green);
          final inactive = await singlePOSCanvasBytes(50, Colors.grey);
          if (active != null) {
            activePOS ??= BitmapDescriptor.fromBytes(active);
          }

          if (inactive != null) {
            inactivePOS ??= BitmapDescriptor.fromBytes(inactive);
          }
          bitmapDescriptor = place.items.first.offer.offers.isEmpty
              ? inactivePOS ?? BitmapDescriptor.defaultMarker
              : activePOS ??
                  BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueGreen);
          // bitmapDescriptor = await BitmapDescriptor.fromAssetImage(
          //     ImageConfiguration(), 'assets/images/wom_pin.png');
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

        final MarkerId markerId = MarkerId(
            place.isMultiple ? place.getId() : place.items.first.offer.posId);

        final marker = Marker(
          onTap: () {
            ref.read(carouselControllerProvider).jumpToPage(posList.indexWhere(
                (element) => element.posId == place.items.first.offer.posId));
          },
          markerId: markerId,
          position: place.location,
          infoWindow: place.isMultiple
              ? InfoWindow.noText
              : InfoWindow(title: place.items.first.offer.name),
          icon: bitmapDescriptor,
        );

        return marker;
      },
      levels: [1, 4.25, 6.75, 8.25, 11.5, 14.5, 16.0, 16.5, 20.0],
      extraPercent: 0.2,
    );
    final offers = ref.watch(offersNotifierProvider).valueOrNull ?? [];
    logger.i('oOffersMapNotifier build => offers ${offers.length}');
    final clusterItems = offers.map((o) => OfferCluster(offer: o)).toList();
    posList = offers;
    clusterManager!.setItems(clusterItems);
    return OffersMapData.empty();
  }

  Future<void> loadOffers(Future<GoogleMapController> getMapController) async {
    final currentState = state;
    try {
      state = AsyncLoading();
      final controller = await getMapController;
      final bounds = await controller.getVisibleRegion();
      final offers = await ref.watch(pocketProvider).getOffersByBox(
            lly: bounds.southwest.latitude,
            llx: bounds.southwest.longitude,
            ury: bounds.northeast.latitude,
            urx: bounds.northeast.longitude,
          );
      final clusterItems = offers.map((o) => OfferCluster(offer: o)).toList();
      posList = offers;
      if (offers.isNotEmpty) {
        controller.showMarkerInfoWindow(MarkerId(offers.first.posId));
        ref.read(carouselControllerProvider).jumpToPage(0);
      }
      clusterManager!.setItems(clusterItems);
    } catch (ex) {
      logger.e(ex);
      state = currentState;
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

  Future<Uint8List?> singlePOSCanvasBytes(int size, MaterialColor color) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..color = color;
    final Paint paint2 = Paint()..color = Colors.white;
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2, paint2);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.4, paint1);

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

// Future<Set<Marker>> buildMarkers(List<OfferPOS> points) async {
//   final s = <Marker>{};
//   for (int i = 0; i < points.length; i++) {
//     final p = points[i];
//     final marker = await buildMarker(p, i);
//     s.add(marker);
//   }
//   return s;
// }

// Future<BitmapDescriptor> _getPosPin() async {
//   return await BitmapDescriptor.fromAssetImage(
//       ImageConfiguration(), 'assets/images/wom_pos_pin.png');
// }

// BitmapDescriptor? _standardPin;

// Future<Marker> buildMarker(OfferPOS point, int index) async {
//   _standardPin ??= await _getPosPin();
//   final markerId = MarkerId(point.posId);
//
//   return Marker(
//     markerId: markerId,
//     position: LatLng(point.position.latitude, point.position.longitude),
//     onTap: () {
//       // ref.read(carouselControllerProvider).jumpToPage(index);
//     },
//     zIndex: index == 0 ? 1 : 0,
//     infoWindow: InfoWindow(title: point.name),
//     icon: _standardPin!,
//   );
// }
}

class MyLocationException with Exception {}

class LocationDisabledException with Exception {}

@Riverpod(keepAlive: true)
class LocationNotifier extends _$LocationNotifier {
  FutureOr<LatLng> build() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw LocationDisabledException();
    }

    final loc = await _getCurrentLocation();
    return loc;
  }

  Future<LatLng> _getCurrentLocation() async {
    logger.w('_getCurrentLocation');
    try {
      if (await _requestPermission()) {
        final currentPosition = await Geolocator.getCurrentPosition(
          timeLimit: Duration(seconds: 15),
        );
        logger.wtf(currentPosition);
        return LatLng(currentPosition.latitude, currentPosition.longitude);
      }
      logger.w('permissions are not granted');
      throw MyLocationException();
    } on LocationServiceDisabledException catch (ex) {
      logger.e(ex);
      throw MyLocationException();
    } on TimeoutException catch (ex) {
      logger.e(ex);
      throw MyLocationException();
    } catch (ex) {
      logger.e(ex);
      throw MyLocationException();
    }
  }

  Future<bool> _requestPermission() async {
    logger.wtf('_requestPermission');
    try {
      final permission = await Geolocator.requestPermission();
      logger.w('permission: $permission');
      return permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always;
    } catch (ex) {
      logger.e(ex);
      return false;
    }
  }
}
