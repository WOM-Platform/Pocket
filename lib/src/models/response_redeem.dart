/*
import 'package:pocket/src/models/wom_model.dart';

class ResponseRedeem {
  static const String VOUCHERS = 'vouchers';
  static const String SOURCE_NAME = 'sourceName';
  static const String SOURCE_ID = 'sourceId';

  List<WomModel> woms;
  String sourceName;
  String sourceId;

  ResponseRedeem({this.woms, this.sourceName});

  ResponseRedeem.fromJson(Map<String, dynamic> json) {
    logger.i(json);
    if (json[VOUCHERS] != null) {
      woms = new List<WomModel>();
      json[VOUCHERS].forEach((v) {
        woms.add(new WomModel.fromMap(v));
      });
      sourceName = json[SOURCE_NAME] ?? "";
      sourceId = json[SOURCE_ID].toString();
    }
  }

//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    if (this.woms != null) {
//      data[VOUCHERS] = this.woms.map((v) => v.toJson()).toList();
//      data[SOURCE_NAME] = this.sourceName;
//      data[SOURCE_ID] = this.sourceId;
//    }
//    return data;
//  }
}
*/
