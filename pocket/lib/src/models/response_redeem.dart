
import 'package:pocket/src/models/wom_model.dart';

class ResponseRedeem {

  static const String VOUCHERS = 'Vouchers';

  List<WomModel> woms;

  ResponseRedeem({this.woms});

  ResponseRedeem.fromJson(Map<String, dynamic> json) {
    if (json[VOUCHERS] != null) {
      woms = new List<WomModel>();
      json[VOUCHERS].forEach((v) {
        woms.add(new WomModel.fromMap(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.woms != null) {
      data[VOUCHERS] = this.woms.map((v) => v.toJson()).toList();
    }
    return data;
  }
}