import 'package:geohash/geohash.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:latlong/latlong.dart' as latLong;

//class WomModel {
//  static final tblWom = "Wom";
//  static final dbId = "Id";
//  static final dbSecret = "secret";
//  static final dbGuid = "guid";
//  static final dbDate = "date";
//  static final dbLat = "lat";
//  static final dbLong = "long";
//  static final dbLive = "live";
//  static final dbGeohash = "geohash";
//  static final dbAim = "aim";
//
//  final LatLng location;
//  int id, date;
//  final String guid;
//  final WomStatus live;
//  final Aim aim;
//  String geohash;
//
//  WomModel(this.date, this.location, this.live, this.guid, this.aim) {
//    this.geohash =
//        Geohash.encode(this.location.latitude, this.location.longitude);
//  }
//
//  Vouchers.fromJson(Map<String, dynamic> json) {
//    id = json['Id'];
//    secret = json['Secret'];
//    latitude = json['Latitude'];
//    longitude = json['Longitude'];
//    timestamp = json['Timestamp'];
//    source = json['Source'];
//  }
//
//  WomModel.fromMap(Map<String, dynamic> map)
//      : id = map[dbId],
//        guid = map[dbGuid],
//        date = map[dbDate],
//        live = WomStatus.values[map[dbLive]],
//        location = LatLng(map[dbLat], map[dbLong]),
//        geohash = map[dbGeohash],
//        aim = Aim.values[map[dbAim]];
//}

enum WomStatus { ON, OFF }

enum Aim { ROAD, MEDICAL }


//TODO eliminare location in più
class WomModel {
  static final tblWom = "Wom";
  static final dbId = "Id";
  static final dbSecret = "Secret";
//  static final dbGuid = "guid";
  static final dbTimestamp = "Timestamp";
  static final dbLat = "Latitude";
  static final dbLong = "Longitude";
  static final dbLive = "live";
  static final dbGeohash = "geohash";
  static final dbSource = "Source";

  latLong.LatLng location;
  LatLng gLocation;
  String secret;
  int id, timestamp;
  WomStatus live;
  String geohash;
  String source;

  WomModel(
      {this.location,
      this.live,
      this.id,
      this.secret,
      this.timestamp,
      this.source}) {
    this.geohash =
        Geohash.encode(this.location.latitude, this.location.longitude);

    this.gLocation = LatLng(location.latitude, location.longitude);
  }

  WomModel.fromMap(Map<String, dynamic> map)
      : id = map[dbId],
        timestamp = map[dbTimestamp] is String ? DateTime.parse(map[dbTimestamp]).millisecondsSinceEpoch : map[dbTimestamp],
        location = latLong.LatLng(map[dbLat], map[dbLong]),
        gLocation = LatLng(map[dbLat], map[dbLong]),
//        location = latLong.LatLng(map[dbLat], map[dbLong]),
        source = map[dbSource] {
    this.geohash =
        Geohash.encode(this.location.latitude, this.location.longitude);
    this.live = WomStatus.ON;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Secret'] = this.secret;
    data['Latitude'] = this.location.latitude;
    data['Longitude'] = this.location.longitude;
    data['Timestamp'] = this.timestamp;
    data['Source'] = this.source;
    return data;
  }
}
