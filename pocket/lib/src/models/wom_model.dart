import 'package:geohash/geohash.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

class WomModel {
  static final tblWom = "Wom";
  static final dbId = "Id";
  static final dbSecret = "Secret";
  static const dbTimestamp = "Timestamp";
  static const dbLat = "Latitude";
  static const dbLong = "Longitude";
  static const dbLive = "live";
  static const dbGeohash = "geohash";
  static const dbSourceName = "SourceName";
  static const dbSourceId = "SourceId";
  static const dbTransactionId = "TransactionId";
  static const dbAim = "Aim";

  LatLng gLocation;
  String secret;
  int id, timestamp;
  WomStatus live;
  String geohash;
  String sourceName;
  int sourceId;
  int transactionId;
  String aim;

  WomModel(
      {this.gLocation,
      this.live,
      this.id,
      this.secret,
      this.timestamp,
      this.sourceId,
      this.sourceName,
      this.aim}) {
    this.geohash =
        Geohash.encode(this.gLocation.latitude, this.gLocation.longitude);
  }

  WomModel.fromMap(Map<String, dynamic> map)
      : id = map[dbId],
  //TODO togliere sottrazione (solo per debug)
        timestamp = map[dbTimestamp] is String
            ? DateTime.parse(map[dbTimestamp]).millisecondsSinceEpoch - (86400 * 7)
            : map[dbTimestamp] - (86400 * 7),
        gLocation = LatLng(map[dbLat], map[dbLong]),
        secret = map[dbSecret],
        sourceName = map[dbSourceName],
        sourceId = map[dbSourceId],
        aim = map[dbAim] {
    this.geohash =
        Geohash.encode(this.gLocation.latitude, this.gLocation.longitude);
    this.live = WomStatus.ON;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[dbId] = this.id;
    data[dbSecret] = this.secret;
    data[dbLat] = this.gLocation.latitude;
    data[dbLong] = this.gLocation.longitude;
    data[dbTimestamp] = this.timestamp;
    data[dbSourceName] = this.sourceName;
    data[dbSourceId] = this.sourceId;
    data[dbTransactionId] = this.transactionId;
    data[dbAim] = this.aim;
    return data;
  }
}
