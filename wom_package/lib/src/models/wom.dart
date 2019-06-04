enum WomStatus { ON, OFF }

class Wom {
  static final tblWom = "Wom";
  static final dbId = "Id";
  static final dbSecret = "Secret";
  static const dbTimestamp = "Timestamp";
  static const dbLat = "Latitude";
  static const dbLong = "Longitude";
  static const dbLive = "live";
  static const dbSourceName = "SourceName";
  static const dbSourceId = "SourceId";
  static const dbTransactionId = "TransactionId";
  static const dbAim = "Aim";
  static const dbCount = "Count";

  double latitude, longitude;
  int id;
  DateTime timestamp;
  WomStatus live;
  String sourceName;
  int sourceId;
  int transactionId;
  String aim;
  int count;

  Wom(
      {this.latitude,
      this.longitude,
      this.live,
      this.id,
      this.timestamp,
      this.sourceId,
      this.sourceName,
      this.aim,
      this.count});

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[dbLat] = this.latitude;
    data[dbLong] = this.longitude;
    data[dbTimestamp] = this.timestamp.toIso8601String();
    data[dbAim] = this.aim;
    data[dbCount] = this.count;
    return data;
  }
}
