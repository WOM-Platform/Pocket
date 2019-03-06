import 'package:pocket/src/screens/map/blocs/google_map_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  final GoogleMapBloc bloc;

  const MapWidget({Key key, this.bloc}) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  Set<Marker> markers = Set();

  updateMarkers(Set<Marker> newMarkers) {
    setState(() {
      markers = newMarkers;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build map widget");
    return Container(
      key: new PageStorageKey('map'),
      child: GoogleMap(
        onMapCreated: (mapController) =>
            widget.bloc.onMapCreated(mapController, updateMarkers),
        trackCameraPosition: true,
        initialCameraPosition: widget.bloc.initialGLocation,
        markers: markers,
      ),
    );
  }
}
