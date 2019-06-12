import 'package:intl/intl.dart';
import 'package:pocket/src/models/deep_link_model.dart';
import 'package:flutter/material.dart';

class TransactionModel {
  static const tblTransaction = "Transactions";
  static const dbId = "Id";
  static const dbTimestamp = "Timestamp";
  static const dbType = "type";
  static const dbCountry = "country";
  static const dbSize = "size";
  static const dbSource = "source";
  static const dbAim = "Aim";

  TransactionType transactionType;
  String source;
  String country;
  String aim;
  DateTime date;
  int size;

  TransactionModel({
    @required this.country,
    @required this.date,
    @required this.size,
    @required this.transactionType,
    @required this.source,
    @required this.aim,
  })  : assert(transactionType != null),
        assert(source != null),
        assert(date != null);

//        super(date: date, country: country, size: size);

  TransactionModel.fromMap(Map<String, dynamic> map)
      : this.source = map[dbSource],
        this.country = map[dbCountry],
        this.size = map[dbSize],
        this.aim = map[dbAim] {
    this.date = map[dbTimestamp] is String
        ? DateTime.parse(map[dbTimestamp])
        : DateTime.fromMillisecondsSinceEpoch(map[dbTimestamp]);
    this.transactionType = TransactionType.values[map[dbType]];
  }

  formatDate() {
    print(Intl.getCurrentLocale());
    var format = new DateFormat.yMMMMEEEEd(Intl.getCurrentLocale());
    return format.format(this.date);
  }

  @override
  String toString() {
    return "$transactionType,$source,$aim,$size,$date,";
  }
}
