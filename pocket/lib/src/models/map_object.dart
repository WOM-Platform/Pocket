import 'package:borsellino/src/models/aggregation_wom_model.dart';
import 'package:borsellino/src/models/wom_model.dart';
import 'package:latlong/latlong.dart' as latLong;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapObject {
  final List<WomModel> woms;
  final List<AggregationWom> aggregationWom;
  final latLong.LatLng currentLocation;
  LatLng gCurrentLocation;

  //TODO eliminate currentLocation inutilizzata
  MapObject({
    this.aggregationWom,
    this.currentLocation,
    this.woms,
  }) {
    this.gCurrentLocation =
        LatLng(currentLocation.latitude, currentLocation.longitude);
  }
}
