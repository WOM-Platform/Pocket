import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      value: dark,
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

class MapBody extends StatelessWidget {
  double lastZoom = 0.0;

  @override
  Widget build(BuildContext context) {
    final MapBloc bloc = BlocProvider.of<MapBloc>(context);
    return Container(
      padding: EdgeInsets.only(
          bottom: minHeight, top: MediaQuery.of(context).padding.top),
      key: new PageStorageKey('map'),
      child: BlocBuilder<MapBloc, MapState>(
        buildWhen: (MapState p, MapState c) {
          if (p.markers.isEmpty && c.markers.isNotEmpty) {
            logger.i("move camera");
            bloc.clusteringHelper.mapController
                .animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(target: c.markers.first.position, zoom: lastZoom),
            ));
          }
          return true;
        },
        builder: (BuildContext context, MapState state) {
          return GoogleMap(
            initialCameraPosition: CameraPosition(target: LatLng(0.0, 0.0)),
            zoomControlsEnabled: false,
            minMaxZoomPreference: MinMaxZoomPreference(0.0, 16.0),
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            onMapCreated: (mapController) => bloc.onMapCreated(mapController),
            onCameraIdle: bloc.clusteringHelper.onMapIdle,
            onCameraMove: (cameraPosition) {
              bloc.clusteringHelper.onCameraMove(cameraPosition);
              lastZoom = cameraPosition.zoom;
            },
            markers: state.markers,
          );
        },
      ),
    );
  }
}

class MapPanel extends StatelessWidget {
  final style = TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w600, color: Colors.white);

  @override
  Widget build(BuildContext context) {
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
          BlocBuilder<MapBloc, MapState>(
            buildWhen: (MapState p, MapState c) {
              return p.womCountWithoutLocation != c.womCountWithoutLocation;
            },
            builder: (BuildContext context, MapState state) {
              logger.i(
                  "build wom withoud location: ${state.womCountWithoutLocation}");
              if (state.womCountWithoutLocation == 0) {
                return SizedBox.shrink();
              }
              return Text(
                '${AppLocalizations.of(context)?.translate('wom_without_location') ?? ''} ${state.womCountWithoutLocation}',
                textAlign: TextAlign.start,
                style: style,
              );
            },
          )
        ],
      ),
    );
  }
}
