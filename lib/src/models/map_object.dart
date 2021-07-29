import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pocket/src/models/aggregation_wom_model.dart';
import 'package:pocket/src/models/wom_model.dart';

class MapObject {
  final List<WomModel> woms;
  final List<AggregationWom> aggregationWom;
  final LatLng currentLocation;
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
