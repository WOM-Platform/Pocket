import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pocket/src/blocs/map/bloc.dart';
import 'package:pocket/src/screens/map/widgets/aims_list.dart';
import 'package:pocket/src/screens/map/widgets/custom_slider.dart';
import 'package:pocket/src/screens/map/widgets/sources_list.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    SystemChrome.setSystemUIOverlayStyle(
//      SystemUiOverlayStyle(
//        statusBarIconBrightness: Brightness.dark,
//      ),
//    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WOM Map",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[100],
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor ,
        ),

      ),
      body: SlidingUpPanel(
        parallaxEnabled: true,
        parallaxOffset: 0.3,
        maxHeight: 330.0,
        minHeight: 45.0,
        panel: MapPanel(),
        body: MapBody(),
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
      child: BlocBuilder(
        bloc: bloc,
        condition: (MapState p, MapState c) {
          if (p.markers.isEmpty && c.markers.isNotEmpty) {
            print("move camera");
            bloc.clusteringHelper.mapController.animateCamera(
                CameraUpdate.newCameraPosition(
                    CameraPosition(target: c.markers.first.position)));
          }
          return true;
        },
        builder: (BuildContext context, MapState state) {
          return GoogleMap(
            initialCameraPosition: CameraPosition(target: LatLng(0.0, 0.0)),
            onMapCreated: (mapController) => bloc.onMapCreated(mapController),
            onCameraIdle: bloc.clusteringHelper.onMapIdle,
            onCameraMove: bloc.clusteringHelper.onCameraMove,
            markers: state.markers,
          );
        },
      ),
    );
  }
}

class MapPanel extends StatelessWidget {
  final style = TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600,color: Colors.white);

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
            height: 25,
          ),
          Text(
            "Filter by Time",
            textAlign: TextAlign.start,
            style: style,
          ),
          CustomSlider(),
          Divider(),
          Text(
            "Filter by Source",
            textAlign: TextAlign.start,
            style: style,
          ),
          SourcesList(),
          Divider(),
          Text(
            "Filter by Aim",
            textAlign: TextAlign.start,
            style: style,
          ),
          AimsList(),
        ],
      ),
    );
  }
}
