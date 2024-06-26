import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:wom_pocket/src/blocs/map/bloc.dart';
import 'package:wom_pocket/src/screens/map/widgets/aims_list.dart';
import 'package:wom_pocket/src/screens/map/widgets/custom_slider.dart';
import 'package:wom_pocket/src/screens/map/widgets/sources_list.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../constants.dart';
import '../../my_logger.dart';
import '../../utils/colors.dart';

final maxHeight = Platform.isIOS ? 375.0 : 350.0;
final minHeight = Platform.isIOS ? 80.0 : 45.0;

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: darkUiOverlayStyle,
      child: Scaffold(
        appBar: AppBar(
          title: Text('womMap'.tr()),
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: primaryColor,
              statusBarIconBrightness: Brightness.light),
          backgroundColor: Theme.of(context).primaryColor,
          actions: [
            // IconButton(
            //     icon: Icon(Icons.gps_fixed),
            //     color: Colors.white,
            //     onPressed: () {
            //       goToCurrentLocation();
            //     }),
          ],
        ),
        body: SlidingUpPanel(
          parallaxEnabled: true,
          parallaxOffset: 0.3,
          maxHeight: maxHeight,
          minHeight: minHeight,
          panel: MapPanel(),
          body: MapBody(),
        ),
      ),
    );
  }
}

class MapBody extends ConsumerWidget {
  final bool enabled;
  double lastZoom = 0.0;

  MapBody({this.enabled = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mapNotifierProvider);
    ref.listen<AsyncValue<MapState>>(mapNotifierProvider, (p, n) {
      if (p != null && p is AsyncData && n is AsyncData) {
        if (p.value!.markers.isEmpty && n.value!.markers.isNotEmpty) {
          logger.i("move camera");
          final controller = ref.read(mapNotifierProvider.notifier).controller;
          final middlePointLat = n.value!.markers
              .fold<double>(43.72, (sum, item) => sum + item.position.latitude);
          final middlePointLong = n.value!.markers.fold<double>(
              12.63, (sum, item) => sum + item.position.longitude);
          final lat =  middlePointLat / (n.value!.markers.length + 1);
          final long =  middlePointLong / (n.value!.markers.length + 1);
          logger.i('middle lat long = $lat, $long for ${n.value!.markers.length} markers');
          controller?.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(
               lat,
                long,
              ),
              zoom: lastZoom,
            ),
          ));
        }
      }
    });
    return Container(
      padding: enabled
          ? EdgeInsets.only(
              bottom: minHeight, top: MediaQuery.of(context).padding.top)
          : null,
      // key: PageStorageKey('map'),
      child: GoogleMap(
        initialCameraPosition: CameraPosition(target: LatLng(0.0, 0.0)),
        zoomControlsEnabled: false,
        minMaxZoomPreference: MinMaxZoomPreference(0.0, 16.0),
        myLocationButtonEnabled: false,
        compassEnabled: enabled ? true : false,
        myLocationEnabled: enabled ? true : false,
        rotateGesturesEnabled: enabled ? true : false,
        tiltGesturesEnabled: enabled ? true : false,
        mapToolbarEnabled: enabled ? true : false,
        zoomGesturesEnabled: enabled ? true : false,
        onMapCreated: (mapController) =>
            ref.read(mapNotifierProvider.notifier).onMapCreated(mapController),
        onCameraIdle: () {
          ref.read(mapNotifierProvider.notifier).clusterManager?.updateMap();
        },
        onCameraMove: enabled
            ? (cameraPosition) {
                ref
                    .read(mapNotifierProvider.notifier)
                    .clusterManager
                    ?.onCameraMove(cameraPosition);
                lastZoom = cameraPosition.zoom;
              }
            : null,
        markers: state.valueOrNull?.markers ?? {},
      ),
    );
  }
}

class MapPanel extends ConsumerWidget {
  final style = TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w600, color: Colors.white);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 12,
          ),
          Column(
            children: <Widget>[
              Container(
                width: 30,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
              ),
            ],
          ),
          SizedBox(
            height: Platform.isIOS ? 60.0 : 25.0,
          ),
          Text(
            'filter_by_time'.tr(),
            textAlign: TextAlign.start,
            style: style,
          ),
          CustomSlider(),
          Divider(),
          Text(
            'filter_by_source'.tr(),
            textAlign: TextAlign.start,
            style: style,
          ),
          SourcesList(),
          Divider(),
          Text(
            'filter_by_aim'.tr(),
            textAlign: TextAlign.start,
            style: style,
          ),
          AimsList(),
          Divider(),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final state = ref.watch(mapNotifierProvider);
              logger.i(
                  "build wom without location: ${state.valueOrNull?.womCountWithoutLocation}");
              if (state.valueOrNull?.womCountWithoutLocation == 0) {
                return SizedBox.shrink();
              }
              return Text(
                '${'wom_without_location'.tr() } ${state.valueOrNull?.womCountWithoutLocation}',
                textAlign: TextAlign.start,
                style: style,
              );
            },
          ),
          /*BlocBuilder<MapBloc, MapState>(
            buildWhen: (MapState p, MapState c) {
              return p.womCountWithoutLocation != c.womCountWithoutLocation;
            },
            builder: (BuildContext context, MapState state) {

            },
          )*/
        ],
      ),
    );
  }
}
