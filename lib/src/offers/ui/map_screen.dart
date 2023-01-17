import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wom_pocket/localization/app_localizations.dart';
import 'package:wom_pocket/main.dart';
import 'package:wom_pocket/src/offers/application/offers_notifier.dart';
import 'package:wom_pocket/src/offers/ui/search_button.dart';
import 'package:wom_pocket/src/utils/colors.dart';
import '../../my_logger.dart';
import 'carousel.dart';

enum PosScreen { list, map }

final zoomMapProvider = StateProvider.autoDispose<double>((ref) {
  return 0;
});

final mapIndexProvider =
    NotifierProvider<MapIndexNotifier, PosScreen>(MapIndexNotifier.new);

class MapIndexNotifier extends Notifier<PosScreen> {
  @override
  PosScreen build() {
    return PosScreen.list;
  }

  toggle() {
    state = state == PosScreen.map ? PosScreen.list : PosScreen.map;
  }
}

final showMapListFilterProvider =
    NotifierProvider<ShowMapListFilterNotifier, bool>(
        ShowMapListFilterNotifier.new);

class ShowMapListFilterNotifier extends Notifier<bool> {
  @override
  bool build() {
    return true;
  }

  show() {
    state = true;
  }

  hide() {
    state = false;
  }
}

final mapControllerProvider = StateProvider<GoogleMapController?>((ref) {
  return null;
});

class OfferMapsScreen extends ConsumerStatefulWidget {
  const OfferMapsScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _OfferMapsScreenState();
}

class _OfferMapsScreenState extends ConsumerState<OfferMapsScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final minZoom = 16.0;

  @override
  void initState() {
    super.initState();
    _goToCurrentLocation();
  }

  _goToCurrentLocation() async {
    if (await _requestPermission()) {
      final currentPosition = await Geolocator.getCurrentPosition();
      await _goToLocation(
        LatLng(currentPosition.latitude, currentPosition.longitude),
        withAnimation: false,
      );
    }
  }

  Future<bool> _requestPermission() async {
    final permission = await Geolocator.requestPermission();
    return permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
  }

  Future<void> _goToLocation(LatLng latLng, {bool withAnimation = true}) async {
    final controller = await _controller.future;
    logger.i('map pos: controller retrieved');
    if (withAnimation) {
      await controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            bearing: 0,
            target: latLng,
            zoom: minZoom,
          ),
        ),
      );
    } else {
      await controller.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            bearing: 0,
            target: latLng,
            zoom: minZoom,
          ),
        ),
      );
    }
  }

  Future<void> onSearchPressed() async {
    logger.i('onSearchPressed');
    ref.read(offersMapNotifierProvider.notifier).loadOffers(_controller.future);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(offersMapNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('offerMapTitle')),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: primaryColor,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
              icon: Icon(Icons.gps_fixed),
              color: Colors.white,
              onPressed: () {
                _goToCurrentLocation();
              }),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(target: LatLng(0.0, 0.0)),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
            onCameraIdle: () {
              ref
                  .read(offersMapNotifierProvider.notifier)
                  .clusterManager
                  ?.updateMap();
            },
            onCameraMove: (cameraPosition) async {
              print(cameraPosition.zoom);
              // ref.read(serviceFiltersShowProvider.notifier).state = false;

              ref.read(zoomMapProvider.notifier).state = cameraPosition.zoom;

              // ref
              //     .read(enableCarouselProvider.notifier)
              //     .update((state) => cameraPosition.zoom > 16);

              /*if ((cameraPosition.zoom * 10).round() / 10 < minZoom) {
                ref.read(enableSearchButtonProvider.notifier).outside();
              } else {
                ref.read(enableSearchButtonProvider.notifier).enabled();
              }*/
              ref
                  .read(offersMapNotifierProvider.notifier)
                  .clusterManager
                  ?.onCameraMove(cameraPosition);
              // ref.read(mapControllerProvider)?.getVisibleRegion().then(
              //     (value) =>
              //         ref.read(latLongBoundsProvider.notifier).state = value);
            },
            onMapCreated: (GoogleMapController controller) {
              controller.setMapStyle(mapStyle);
              ref.read(mapControllerProvider.notifier).state = controller;
              _controller.complete(controller);
              ref
                  .read(offersMapNotifierProvider.notifier)
                  .clusterManager
                  ?.setMapId(controller.mapId);
              ref
                  .read(offersMapNotifierProvider.notifier)
                  .clusterManager
                  ?.updateMap();
            },
            markers: state.valueOrNull?.markers ?? {},
          ),
          Positioned(
            bottom: 16.0,
            left: 0.0,
            right: 0.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SearchNewPointButton(
                  onPressed: onSearchPressed,
                ),
                const SizedBox(height: 4),
                const ListingCarouselWidget(),
              ],
            ),
          ),
          // Positioned(top: 16.0, left: 16.0, child: BackButton()),
        ],
      ),
    );
  }
}