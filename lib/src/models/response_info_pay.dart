import 'package:wom_package/wom_package.dart' show SimpleFilters;

class ResponseInfoPay {
  static const String POS_ID = 'posId';
  static const String POS_NAME = 'posName';
  static const String AMOUNT = 'amount';
  static const String SIMPLE_FILTER = 'simpleFilter';

  String posId;
  int amount;
  String posName;
  SimpleFilters simpleFilter;

  ResponseInfoPay.fromMap(Map<String, dynamic> map)
      : posId = map[POS_ID],
        amount = map[AMOUNT],
        posName = map[POS_NAME],
        simpleFilter = map[SIMPLE_FILTER] != null
            ? SimpleFilters.fromJson(map[SIMPLE_FILTER])
            : null;

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[POS_ID] = posId.toString();
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
