import 'dart:async';
import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:wom_pocket/src/offers/application/offers_notifier.dart';
import 'package:wom_pocket/src/offers/ui/offers_screen.dart';
import 'package:wom_pocket/src/offers/ui/search_button.dart';
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
    print('show map list filters');
    state = true;
  }

  hide() {
    print('hide map list filters');
    state = false;
  }
}

final mapControllerProvider = StateProvider<GoogleMapController?>((ref) {
  return null;
});

class OfferScreen extends ConsumerStatefulWidget {
  const OfferScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _OfferScreenState();
}

class _OfferScreenState extends ConsumerState<OfferScreen> {
  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(mapIndexProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'DEV WOM POCKET',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // vai alla mappa
              },
              child: Text('Vedi mappa'),
            )
          ],
          backgroundColor: Theme.of(context).primaryColor,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              IndexedStack(
                index: selectedIndex.index,
                children: [
                  OffersListScreen(),
                  OfferMapsScreen(),
                  // OffersList(
                  //   offers: posData.posList,
                  //   goToLocation: (l) async {
                  //     await _goToLocation(l, withAnimation: false);
                  //     await Future.delayed(Duration(milliseconds: 200));
                  //     onSearchPressed();
                  //   },
                  // ),
                ],
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
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
                            labels: PosScreen.values
                                .map((e) => e.name.toUpperCase())
                                .toList(),
                            icons: [
                              Icons.list,
                              Icons.map,
                            ],
                            activeBgColors: [
                              [Colors.pink],
                              [Colors.blue],
                            ],
                            onToggle: (index) {
                              print('switched to: $index');
                              if (index == null || index == selectedIndex.index)
                                return;
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
      ),
    );
  }
}

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
    print('onSearchPressed') ;
    ref.read(offersMapNotifierProvider.notifier).loadOffers(_controller.future);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(offersMapNotifierProvider);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(target: LatLng(0.0, 0.0)),
              myLocationEnabled: true,
              myLocationButtonEnabled: Platform.isAndroid,
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
                        _goToCurrentLocation();
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
                  const ListingCarouselWidget(),
                ],
              ),
            ),
            Positioned(top: 16.0, left: 16.0, child: BackButton()),
          ],
        ),
      ),
    );
  }
}
