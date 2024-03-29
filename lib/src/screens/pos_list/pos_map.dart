import 'dart:async';
import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:wom_pocket/main.dart';
import 'package:wom_pocket/src/screens/pos_list/pos_map_data.dart';
import 'package:wom_pocket/src/screens/pos_list/pos_map_notifier.dart';
import 'package:wom_pocket/src/screens/pos_list/search_button.dart';
import '../../utils/location_utils.dart';
import 'carousel.dart';
import 'pos_list_screen.dart';

enum PosScreen { map, list }

final showMapListFilterProvider =
    NotifierProvider<ShowMapListFilterNotifier, bool>(
        ShowMapListFilterNotifier.new);

class ShowMapListFilterNotifier extends Notifier<bool> {
  @override
  bool build() {
    return true;
  }

  show(){
    print('show map list filters');
    state = true;
  }

  hide(){
    print('hide map list filters');
    state = false;
  }
}

class LocalizationException implements Exception {}

final mapIndexProvider =
    NotifierProvider<MapIndexNotifier, PosScreen>(MapIndexNotifier.new);

class MapIndexNotifier extends Notifier<PosScreen> {
  @override
  PosScreen build() {
    return PosScreen.map;
  }

  toggle() {
    state = state == PosScreen.map ? PosScreen.list : PosScreen.map;
  }
}

final currentLocationProvider = FutureProvider<Location>((ref) async {
  print('currentLocationProvider CREATE');
  ref.onDispose(() {
    print('currentLocationProvider DISPOSED');
  });

  //Check permission
  final geolocationStatus = await Geolocator.checkPermission();
  print('currentLocationProvider: $geolocationStatus');

  switch (geolocationStatus) {
    case LocationPermission.always:
    case LocationPermission.whileInUse:
      //We can get the location from the device
      final p = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(p);
      return Location(latitude: p.latitude, longitude: p.longitude);
    case LocationPermission.denied:
      final ask = await Geolocator.requestPermission();

      if (ask == LocationPermission.always ||
          ask == LocationPermission.whileInUse) {
        final p = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        return Location(latitude: p.latitude, longitude: p.longitude);
      }
      print('currentLocationProvider: LocationPermission.denied');
      throw LocalizationException();

    case LocationPermission.deniedForever:
      print('currentLocationProvider: LocationPermission.deniedForever');
      throw LocalizationException();
    default:
      throw LocalizationException();
  }
});

final latLongBoundsProvider = StateProvider<LatLngBounds?>((ref) {
  return null;
});

final mapControllerProvider = StateProvider<GoogleMapController?>((ref) {
  return null;
});


class PosMapScreen extends ConsumerStatefulWidget {
  const PosMapScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _PosMapScreenState();
}

class _PosMapScreenState extends ConsumerState<PosMapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final minZoom = 15.0;

  @override
  void initState() {
    super.initState();
    goToCurrentLocation(_controller.future, minZoom);
  }

  Future<void> _goToLocation(LatLng latLng, {bool withAnimation = true}) async {
    final controller = await _controller.future;
    print('map pos: controller retrieved');
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
    print('onSearchPressed');
    final bounds = await (await _controller.future).getVisibleRegion();

    await ref.read(posMapNotifierProvider.notifier).loadPos(
          lly: bounds.southwest.latitude,
          llx: bounds.southwest.longitude,
          ury: bounds.northeast.latitude,
          urx: bounds.northeast.longitude,
        );
  }

  @override
  Widget build(BuildContext context) {
    final posData =
        ref.watch(posMapNotifierProvider);

    final selectedIndex = ref.watch(mapIndexProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SafeArea(
        child: Stack(
          children: [
            IndexedStack(
              index: selectedIndex.index,
              children: [
                Scaffold(
                  body: SafeArea(
                    child: Stack(
                      children: [
                        GoogleMap(
                          initialCameraPosition:
                              CameraPosition(target: LatLng(0.0, 0.0)),
                          myLocationEnabled: true,
                          myLocationButtonEnabled: Platform.isAndroid,
                          zoomControlsEnabled: false,
                          mapToolbarEnabled: false,
                          // onCameraIdle: () {},
                          onCameraMove: (cameraPosition) async {
                            print(cameraPosition.zoom);
                            // ref.read(serviceFiltersShowProvider.notifier).state = false;
                            if ((cameraPosition.zoom * 10).round() / 10 <
                                minZoom) {
                              ref
                                  .read(enableSearchButtonProvider.notifier).outside();
                            } else {
                              ref
                                  .read(enableSearchButtonProvider.notifier).enabled();
                            }
                            ref
                                .read(mapControllerProvider)
                                ?.getVisibleRegion()
                                .then((value) => ref
                                    .read(latLongBoundsProvider.notifier)
                                    .state = value);
                          },
                          onMapCreated: (GoogleMapController controller) {
                            controller.setMapStyle(mapStyle);
                            ref.read(mapControllerProvider.notifier).state =
                                controller;
                            _controller.complete(controller);
                          },
                          markers: posData.markers,
                        ),
                        if (Platform.isIOS)
                          Positioned(
                            top: 16,
                            right: 16.0,
                            child: Card(
                              margin: EdgeInsets.zero,
                              child: IconButton(
                                  icon: Icon(Icons.gps_fixed),
                                  color: Colors.grey,
                                  onPressed: () {
                                    goToCurrentLocation(_controller.future, minZoom);
                                  }),
                            ),
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
                              ListingCarouselWidget(posData.posList),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                PosListScreen(
                  items: posData.posList,
                  goToLocation: (l) async {
                    await _goToLocation(l, withAnimation: false);
                    await Future.delayed(Duration(milliseconds: 200));
                    onSearchPressed();
                  },
                ),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final show = ref.watch(showMapListFilterProvider);
                  if (show && child != null) {
                    return child;
                  } else {
                    return SizedBox.shrink();
                  }
                },
                child: ElasticIn(
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                    // color: Colors.green,
                    height: 50,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ToggleSwitch(
                          minWidth: 90.0,
                          initialLabelIndex: selectedIndex.index,
                          cornerRadius: 20.0,
                          activeFgColor: Colors.white,
                          inactiveBgColor: Colors.grey,
                          inactiveFgColor: Colors.white,
                          totalSwitches: 2,
                          labels: ['Map', 'List'],
                          icons: [Icons.map, Icons.list],
                          activeBgColors: [
                            [Colors.blue],
                            [Colors.pink]
                          ],
                          onToggle: (index) {
                            print('switched to: $index');
                            if (index == null || index == selectedIndex) return;
                            ref.read(mapIndexProvider.notifier).toggle();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
