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

import '../../my_logger.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    SystemChrome.setSystemUIOverlayStyle(
//      SystemUiOverlayStyle(
//        statusBarIconBrightness: Brightness.dark,
//      ),
//    );

    return Scaffold(
      /*  appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.translate('map_title'),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        brightness: Brightness.dark,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),*/
      body: SafeArea(
        child: Stack(
          children: [
            SlidingUpPanel(
              parallaxEnabled: true,
              parallaxOffset: 0.3,
              maxHeight: Platform.isIOS ? 375.0 : 350,
              minHeight: Platform.isIOS ? 60.0 : 45.0,
              panel: MapPanel(),
              body: MapBody(),
            ),
            Positioned(
              left: 16,
              top: 16,
              child: IconButton(
                  icon: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.arrow_back,
                          color: Theme.of(context).primaryColor)),
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
  @override
  Widget build(BuildContext context) {
    final MapBloc bloc = BlocProvider.of<MapBloc>(context);
    return Container(
      key: new PageStorageKey('map'),
      child: BlocBuilder<MapBloc, MapState>(
        buildWhen: (MapState p, MapState c) {
          if (p.markers!.isEmpty && c.markers!.isNotEmpty) {
            logger.i("move camera");
            bloc.clusteringHelper.mapController.animateCamera(
                CameraUpdate.newCameraPosition(
                    CameraPosition(target: c.markers!.first.position)));
          }
          return true;
        },
        builder: (BuildContext context, MapState state) {
          return GoogleMap(
            initialCameraPosition: CameraPosition(target: LatLng(0.0, 0.0)),
            zoomControlsEnabled: false,
            // myLocationButtonEnabled: true,
            onMapCreated: (mapController) => bloc.onMapCreated(mapController),
            onCameraIdle: bloc.clusteringHelper.onMapIdle,
            onCameraMove: bloc.clusteringHelper.onCameraMove,
            markers: state.markers!,
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
            height: Platform.isIOS ? 40.0 : 25.0,
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
