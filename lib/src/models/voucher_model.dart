import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../my_logger.dart';

class VoucherModel extends TicketModel {
  final String source;

  VoucherModel(
      {String id, DateTime date, String country, int size, this.source})
      : super(date: date, country: country, size: size);

//  VoucherModel.fromJson(Map<String, dynamic> parsedJson)
//      : id = parsedJson['id'],
//        date = parsedJson['date'],
//        country = parsedJson['country'],
//        type = parsedJson['type'];
//
//  VoucherModel.fromDb(Map<String, dynamic> parsedJson)
//      : id = parsedJson['id'],
//        type = parsedJson['type'],
//        date = parsedJson['date'],
//        country = parsedJson['country'];
//
//  Map<String, dynamic> toMap() {
//    return <String, dynamic>{
//      "id": id,
//      "type": type,
//      "country": country,
//      "date": date
//    };
//  }

}

abstract class TicketModel {
//  final String id;
  final DateTime date;
  final String country;
  final int size;

  TicketModel({@required this.date, @required this.country, this.size});

  formatDate() {
    logger.i(Intl.getCurrentLocale());
    var format = new DateFormat.yMMMMEEEEd(Intl.getCurrentLocale());
    return format.format(this.date);
  }
}
