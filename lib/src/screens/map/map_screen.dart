import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Mappa dei WOM"),
      ),
      body: SlidingUpPanel(
        parallaxEnabled: true,
        parallaxOffset: 0.3,
        maxHeight: 450.0,
        minHeight: 30.0,
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
            bloc.mapController.animateCamera(CameraUpdate.newCameraPosition(
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
  @override
  Widget build(BuildContext context) {
    return Padding(
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
            height: 12,
          ),
          Text(
            "By Time",
            textAlign: TextAlign.start,
          ),
          CustomSlider(),
          Divider(),
          Text(
            "By Source",
            textAlign: TextAlign.start,
          ),
          SourcesList(),
          Divider(),
          Text("By Aim"),
          AimsList(),
        ],
      ),
    );
  }
}
