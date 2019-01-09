import 'package:borsellino/src/models/voucher_model.dart';
import 'package:flutter/material.dart';

class TransactionModel extends TicketModel {
  static final tblTransaction = "Transactions";
  static final dbId = "Id";
  static final dbTimestamp = "Timestamp";
  static final dbType = "type";
  static final dbCountry = "country";
  static final dbSize = "size";
  static final dbShop = "shop";

  TransactionType transactionType;
  String shop;

  TransactionModel({
    @required String country,
    @required DateTime date,
    @required int size,
    @required this.transactionType,
    @required this.shop,
  })  : assert(transactionType != null),
        assert(shop != null),
        assert(date != null),
        super(date: date, country: country, size: size);

  TransactionModel.fromMap(Map<String, dynamic> map)
      : super(
            date: map[dbTimestamp] is String
                ? DateTime.parse(map[dbTimestamp])
                : DateTime.fromMillisecondsSinceEpoch(map[dbTimestamp]),
            country: map[dbCountry],
            size: map[dbSize]) {
    this.transactionType = TransactionType.values[map[dbType]];
    this.shop = map[dbShop];
  }
}

enum TransactionType { EXPENSE, EARN }
