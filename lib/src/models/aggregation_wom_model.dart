import 'package:google_maps_flutter/google_maps_flutter.dart';

//TODO eliminare location in piu
class AggregationWom {
  //Numero di wom aggregati
  final int number;

  //Posizione media dove mettere il pin
  final LatLng location;
  LatLng gLocation;

  AggregationWom(this.number, {this.location}) {
    this.gLocation = LatLng(location.latitude, location.longitude);
  }

  AggregationWom.fromMap(Map<String, dynamic> map)
      : number = map['n_marker'],
        this.location = LatLng(map['lat'], map['long']) {
    this.gLocation = LatLng(location.latitude, location.longitude);
  }
}
