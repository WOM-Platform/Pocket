import 'package:pocket/src/models/simple_filters_model.dart';
import 'package:pocket/src/models/wom_model.dart';

class ResponseInfoPay {
  static const String POS_ID = 'PosId';
  static const String POS_NAME = 'PosName';
  static const String AMOUNT = 'Amount';
  static const String SIMPLE_FILTER = 'SimplerFilter';

  int posId;
  int amount;
  String posName;
  SimpleFilters simpleFilter;

  ResponseInfoPay.fromMap(Map<String, dynamic> map)
      : posId = map[POS_ID],
        amount = map[AMOUNT],
        posName = map[POS_NAME],
        simpleFilter = map[SIMPLE_FILTER] != null ? SimpleFilters.fromJson(map[SIMPLE_FILTER]) : null;

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[POS_ID] = posId;
    data[AMOUNT] = amount;
    data[POS_NAME] = posName;
    data[SIMPLE_FILTER] = simpleFilter.toJson();
    return data;
  }

  @override
  String toString() {
    return "$posId,$amount,$simpleFilter";
  }
}