import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

import '../my_logger.dart';

class TransactionModel extends Equatable {
  static const tblTransaction = "Transactions";
  static const dbId = "Id";
  static const dbTimestamp = "Timestamp";
  static const dbType = "type";
  static const dbCountry = "country";
  static const dbSize = "size";
  static const dbSource = "source";
  static const dbAim = "Aim";
  static const dbAckUrl = "ackUrl";

  TransactionType? transactionType;
  String? source;
  String? country;
  String? aimCode;
  DateTime? date;
  Aim? aim;
  int? id;
  int? size;
  String? ackUrl;

  TransactionModel({
    required this.country,
    required DateTime this.date,
    required this.size,
    required TransactionType this.transactionType,
    required String this.source,
    required this.aimCode,
    this.id,
    this.ackUrl,
  });

//        super(date: date, country: country, size: size);

  TransactionModel.fromMap(Map<String, dynamic> map)
      : this.source = map[dbSource],
        this.country = map[dbCountry],
        this.size = map[dbSize],
        this.id = map[dbId],
        this.aimCode = map[dbAim],
        this.ackUrl = map[dbAckUrl] {
    this.date = map[dbTimestamp] is String
        ? DateTime.parse(map[dbTimestamp])
        : DateTime.fromMillisecondsSinceEpoch(map[dbTimestamp]);
    this.transactionType = TransactionType.values[map[dbType]];
  }

  String formatDate() {
    logger.i(Intl.getCurrentLocale());
    var format = new DateFormat.yMMMEd(Intl.getCurrentLocale());
    return format.format(this.date!);
  }

  @override
  String toString() {
    return "$transactionType,$source,$aimCode,$size,$date,$ackUrl";
  }

  @override
  List<Object?> get props =>
      [transactionType, source, aimCode, size, date, ackUrl];
}
