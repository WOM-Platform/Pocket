import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wom_pocket/localization/app_localizations.dart';
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
        body: Stack(
          children: [
            SlidingUpPanel(
              parallaxEnabled: true,
              parallaxOffset: 0.3,
              maxHeight: maxHeight,
              minHeight: minHeight,
              panel: MapPanel(),
              body: MapBody(),
            ),
            Positioned(
              left: 16,
              top: 8 + MediaQuery.of(context).padding.top,
              child: IconButton(
                  icon: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2, color: Colors.grey, spreadRadius: 1)
                      ],
                    ),
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.arrow_back,
                            color: Theme.of(context).primaryColor)),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ),
          ],
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
          ref
              .read(mapNotifierProvider.notifier)
              .controller
              ?.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: n.value!.markers.first.position, zoom: lastZoom),
              ));
        }
      }
    });
    return Container(
      padding: enabled
          ? EdgeInsets.only(
              bottom: minHeight, top: MediaQuery.of(context).padding.top)
          : null,
      key: PageStorageKey('map'),
      child: GoogleMap(
        initialCameraPosition: CameraPosition(target: LatLng(0.0, 0.0)),
        zoomControlsEnabled: false,
        minMaxZoomPreference: MinMaxZoomPreference(0.0, 16.0),
        myLocationButtonEnabled: enabled ? true : false,
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
            AppLocalizations.of(context)!.translate('filter_by_time'),
            textAlign: TextAlign.start,
            style: style,
          ),
          CustomSlider(),
          Divider(),
          Text(
            AppLocalizations.of(context)!.translate('filter_by_source'),
            textAlign: TextAlign.start,
            style: style,
          ),
          SourcesList(),
          Divider(),
          Text(
            AppLocalizations.of(context)!.translate('filter_by_aim'),
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
                '${AppLocalizations.of(context)?.translate('wom_without_location') ?? ''} ${state.valueOrNull?.womCountWithoutLocation}',
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
