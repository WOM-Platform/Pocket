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


class WomModel {
  static final tblWom = "Wom";
  static final dbId = "Id";
  static final dbSecret = "Secret";

//  static final dbGuid = "guid";
  static const dbTimestamp = "Timestamp";
  static const dbLat = "Latitude";
  static const dbLong = "Longitude";
  static const dbLive = "live";
  static const dbGeohash = "geohash";
  static const dbSource = "SourceName";
  static const dbAim = "Aim";

  latLong.LatLng location;
  LatLng gLocation;
  String secret;
  int id, timestamp;
  WomStatus live;
  String geohash;
  String source;
  String aim;

  WomModel(
      {this.location,
      this.live,
      this.id,
      this.secret,
      this.timestamp,
      this.source,
      this.aim}) {
    this.geohash =
        Geohash.encode(this.location.latitude, this.location.longitude);

    this.gLocation = LatLng(location.latitude, location.longitude);
  }

  WomModel.fromMap(Map<String, dynamic> map)
      : id = map[dbId],
        timestamp = map[dbTimestamp] is String
            ? DateTime.parse(map[dbTimestamp]).millisecondsSinceEpoch
            : map[dbTimestamp],
        location = latLong.LatLng(map[dbLat], map[dbLong]),
        gLocation = LatLng(map[dbLat], map[dbLong]),
        secret = map[dbSecret],
//        location = latLong.LatLng(map[dbLat], map[dbLong]),
        source = map[dbSource],
        aim = map[dbAim] {
    this.geohash =
        Geohash.encode(this.location.latitude, this.location.longitude);
    this.live = WomStatus.ON;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[dbId] = this.id;
    data[dbSecret] = this.secret;
    data[dbLat] = this.location.latitude;
    data[dbLong] = this.location.longitude;
    data[dbTimestamp] = this.timestamp;
    data[dbSource] = this.source;
    return data;
  }
}
