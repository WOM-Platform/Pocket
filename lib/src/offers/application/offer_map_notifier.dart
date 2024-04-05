import 'dart:io';

import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/my_logger.dart';
import 'package:wom_pocket/src/offers/application/offers_notifier.dart';
import 'package:wom_pocket/src/offers/data/offer.dart';
import 'dart:async';
import 'dart:ui' as ui;
import 'package:wom_pocket/src/offers/domain/entities/static_cities.dart';
import 'package:wom_pocket/src/offers/ui/carousel.dart';
import 'package:wom_pocket/src/offers/ui/map_screen.dart';
import 'package:wom_pocket/src/services/transaction_repository.dart';

part 'offer_map_notifier.g.dart';

Set<Marker> citiesMarker = <Marker>{};

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

  FutureOr<OffersMapData> build(LatLng? position) async {
    logger.wtf('OffersMapNotifier build');
    loadStaticCityMarkers();
    clusterManager ??= ClusterManager<OfferCluster>(
      [],
      onUpdate,
      stopClusteringZoom: minZoom,
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
            place.isMultiple ? place.getId() : place.items.first.offer.id);

        final marker = Marker(
          onTap: () {
            final carousel = ref.read(carouselControllerProvider);
            final firstOfferId = place.items.first.offer.id;
            final index = posList.indexWhere(
              (element) => element.id == firstOfferId,
            );
            carousel.jumpToPage(index);
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
    final offers =
        ref.watch(offersNotifierProvider(position)).valueOrNull ?? [];
    logger.i('oOffersMapNotifier build => offers ${offers.length}');
    final clusterItems = offers.map((o) => OfferCluster(offer: o)).toList();
    posList = offers;
    clusterManager!.setItems(clusterItems);
    return OffersMapData(
      offers: offers,
      markers: {},
    );
  }

  loadStaticCityMarkers() async {
    // if (citiesMarker.isEmpty) {
    final tmp = <Marker>{};
    for (int i = 0; i < cities.length; i++) {
      final city = cities[i];
      final bitmap = await getMarkerIcon(city.imageAsset, city.name);
      tmp.add(
        Marker(
          markerId: MarkerId(city.name),
          position: LatLng(city.lat, city.long),
          icon: bitmap,
          anchor: Offset(0.25, 1),
        ),
      );
    }

    citiesMarker.clear();

    citiesMarker.addAll(tmp);
    // }
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
        Future.delayed(const Duration(milliseconds: 500)).then((value) {
          try {
            controller.showMarkerInfoWindow(MarkerId(offers.first.id));
            ref.read(carouselControllerProvider).jumpToPage(0);
          } catch (ex, st) {
            logger.e('showMarkerInfoWindow', error: ex, stackTrace: st);
          }
        });
      }
      clusterManager!.setItems(clusterItems);
    } catch (ex, st) {
      logger.e('Load offers', error: ex, stackTrace: st);
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

  Future<BitmapDescriptor?> createCustomMarkerBitmapWithNameAndImage(
      Uint8List imageBytes, Size size, String name) async {
    // final textRectHeight = 70.0;

    TextSpan span = new TextSpan(
        style: new TextStyle(
          height: 1.2,
          color: Colors.black,
          backgroundColor: Colors.white,
          fontSize: size.width / 4,
          fontWeight: FontWeight.bold,
        ),
        text: name);

    TextPainter tp = new TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    tp.layout();

    ui.PictureRecorder recorder = new ui.PictureRecorder();
    Canvas canvas = new Canvas(recorder);

    final bottomTextPadding = 32;
    final leftPadding = 16.0;
    // TEXT BOX BACKGROUND
    Paint textBgBoxPaint = Paint()..color = Colors.white;

    final textRectWidth = tp.width + 35;
    Rect rect = Rect.fromLTWH(
      size.width / 2 - (textRectWidth / 2) + leftPadding,
      0,
      textRectWidth,
      tp.height + 16,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(10.0)),
      textBgBoxPaint,
    );

    //ADD TEXT WITH ALIGN TO CANVAS
    tp.paint(
        canvas, Offset((size.width / 2) - (tp.width / 2) + leftPadding, 5.0));

    // circle for image
    Rect oval = Rect.fromLTWH(
        leftPadding, tp.height + bottomTextPadding, size.width, size.height);

    final image = await getImageFromByteData(imageBytes);

    final radius = size.width / 2;
    final center = Offset(size.width / 2.0 + leftPadding,
        size.height / 2.0 + tp.height + bottomTextPadding);
    Paint paintBorder = Paint()
      ..color = Colors.white
      ..strokeWidth = size.width / 18
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, paintBorder);

    final pinXOffset = size.width / 6;
    final pinYOffset = size.height / 8;
    Path getTrianglePath(double x, double y) {
      return Path()
        ..moveTo(center.dx - pinXOffset, y)
        ..lineTo(center.dx + pinXOffset, y)
        ..lineTo(center.dx, y + pinYOffset)
        ..lineTo(center.dx - pinXOffset, y);
    }

    canvas.drawPath(
        getTrianglePath(
          leftPadding,
          (size.height + tp.height + bottomTextPadding),
        ),
        textBgBoxPaint);

    canvas.clipPath(Path()
      ..addOval(
        oval,
      ));

    paintImage(
      canvas: canvas,
      image: image,
      rect: oval,
      fit: BoxFit.cover,
    );

    ui.Picture p = recorder.endRecording();
    final pngBytes = await (await p.toImage(
      (size.width + textRectWidth + leftPadding).toInt(),
      (size.height + tp.height + bottomTextPadding + pinYOffset).toInt(),
    ))
        .toByteData(format: ui.ImageByteFormat.png);

    if (pngBytes == null) {
      return null;
    }
    final data = Uint8List.view(pngBytes.buffer);

    return BitmapDescriptor.fromBytes(data);
  }

  Future<ui.Image> getImageFromPath(String imagePath) async {
    final imageFile = File(imagePath);

    Uint8List imageBytes = imageFile.readAsBytesSync();

    final Completer<ui.Image> completer = new Completer();

    ui.decodeImageFromList(imageBytes, (ui.Image img) {
      return completer.complete(img);
    });

    return completer.future;
  }

  Future<ui.Image> getImageFromByteData(Uint8List imageBytes) async {
    final Completer<ui.Image> completer = new Completer();

    ui.decodeImageFromList(imageBytes, (ui.Image img) {
      return completer.complete(img);
    });

    return completer.future;
  }

  // Future<BitmapDescriptor> getMarkerIcon(String? image, String name) async {
  //   if (image != null) {
  //     final File markerImageFile =
  //         await DefaultCacheManager().getSingleFile(image);
  //     Size s = Size(120, 120);
  //
  //     var icon = await createCustomMarkerBitmapWithNameAndImage(
  //         markerImageFile.path, s, name);
  //
  //     return icon ?? BitmapDescriptor.defaultMarker;
  //   } else {
  //     return BitmapDescriptor.defaultMarker;
  //   }
  // }

  Future<BitmapDescriptor> getMarkerIcon(String imageAsset, String name) async {
    final markerImageFile = await rootBundle.load(imageAsset);
    Size s = Size(180, 180);

    var icon = await createCustomMarkerBitmapWithNameAndImage(
      markerImageFile.buffer.asUint8List(),
      s,
      name,
    );

    return icon ?? BitmapDescriptor.defaultMarker;
  }

  void updateCitiesMarkers() async {
    await loadStaticCityMarkers();
    ref.refresh(showStaticCitiesProvider);
  }
}
