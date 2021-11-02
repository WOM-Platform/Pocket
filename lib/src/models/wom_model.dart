import 'package:dart_geohash/dart_geohash.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  LatLng? gLocation;
  String? secret;
  String? id;
  int? timestamp;
  WomStatus? live;
  String? geohash;
  String? sourceName;
  String? sourceId;
  int? transactionId;
  String? aim;

  WomModel(
      {this.gLocation,
      this.live,
      this.id,
      this.secret,
      this.timestamp,
      this.sourceId,
      this.sourceName,
      this.aim}) {
    final geohaser = GeoHasher();
    this.geohash = geohaser.encode(
      this.gLocation!.longitude,
      this.gLocation!.latitude,
    );
  }

  WomModel.fromMap(Map<String, dynamic> map)
      : id = map['id'].toString(),
        timestamp = map['timestamp'] is String
            ? DateTime.parse(map['timestamp']).millisecondsSinceEpoch
            : map['timestamp'],
        gLocation = LatLng(map['latitude'], map['longitude']),
        secret = map['secret'],
        sourceName = map['sourceName'],
        sourceId = map['sourceId'].toString(),
        aim = map['aim'] {
    GeoHasher geoHasher = GeoHasher();
    this.geohash = geoHasher.encode(
      this.gLocation!.longitude,
      this.gLocation!.latitude,
    );
    this.live = WomStatus.values[map['live'] ?? 0];
  }

  WomModel.fromDB(Map<String, dynamic> map)
      : id = map[dbId].toString(),
        timestamp = map[dbTimestamp] is String
            ? DateTime.parse(map[dbTimestamp]).millisecondsSinceEpoch
            : map[dbTimestamp],
        gLocation = LatLng(map[dbLat], map[dbLong]),
        secret = map[dbSecret],
        sourceName = map[dbSourceName],
        sourceId = map[dbSourceId].toString(),
        aim = map[dbAim] {
    GeoHasher geoHasher = GeoHasher();
    this.geohash =
        geoHasher.encode(this.gLocation!.longitude, this.gLocation!.latitude);
    this.live = WomStatus.values[map[dbLive] ?? 0];
  }

  Map<String, dynamic> toDBJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[dbId] = this.id;
    data[dbSecret] = this.secret;
    data[dbLat] = this.gLocation!.latitude;
    data[dbLong] = this.gLocation!.longitude;
    data[dbTimestamp] = this.timestamp;
    data[dbSourceName] = this.sourceName;
    data[dbSourceId] = this.sourceId;
    data[dbTransactionId] = this.transactionId;
    data[dbAim] = this.aim;
    return data;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['secret'] = this.secret;
    data['latitude'] = this.gLocation!.latitude;
    data['longitude'] = this.gLocation!.longitude;
    data['timestamp'] = this.timestamp;
    data['sourceName'] = this.sourceName;
    data['sourceId'] = this.sourceId;
    data['transactionId'] = this.transactionId;
    data['aim'] = this.aim;
    return data;
  }
}
