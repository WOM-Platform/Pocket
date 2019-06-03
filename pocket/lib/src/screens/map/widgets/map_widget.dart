import 'package:pocket/src/blocs/bloc_provider.dart';
import 'package:pocket/src/db/wom_db.dart';
import 'package:pocket/src/screens/map/blocs/google_map_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {

  const MapWidget({Key key}) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  GoogleMapBloc bloc;
  Set<Marker> markers = Set();

  updateMarkers(Set<Marker> newMarkers) {
    setState(() {
      markers = newMarkers;
    });
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<GoogleMapBloc>(context);
    print("build map widget");
    return Container(
      key: new PageStorageKey('map'),
      child: GoogleMap(
        onMapCreated: (mapController) =>
            bloc.onMapCreated(mapController, updateMarkers),
        onCameraIdle: bloc.clusteringHelper.onMapIdle,
        onCameraMove: bloc.clusteringHelper.onCameraMove,
        initialCameraPosition: bloc.initialGLocation,
        markers: markers,
      ),
    );
  }
}
