import 'package:pocket/src/screens/map/blocs/google_map_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatelessWidget{
  GoogleMap googleMap;

  GoogleMapBloc bloc;

  MapWidget({this.bloc}) {
    print("create map widget");
    googleMap = GoogleMap(
      onMapCreated: bloc.onMapCreated,
      trackCameraPosition: true,
      initialCameraPosition: bloc.initialGLocation,
    );
  }

  @override
  Widget build(BuildContext context) {
    print("build map widget");
    return Container(
        key: new PageStorageKey('map'),
        child: googleMap);
  }
}