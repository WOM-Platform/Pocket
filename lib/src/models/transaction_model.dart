import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:drift/drift.dart' as drift;
import 'package:intl/intl.dart';
import 'package:wom_pocket/src/database/database.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_model.freezed.dart';

@freezed
class TransactionModel with _$TransactionModel {
  static const tblTransaction = "Transactions";
  static const dbId = "Id";
  static const dbTimestamp = "Timestamp";
  static const dbType = "type";
  static const dbCountry = "country";
  static const dbSize = "size";
  static const dbSource = "source";
  static const dbAim = "Aim";
  static const dbAckUrl = "ackUrl";

  const factory TransactionModel({
    @TransactionTypeConverter() required TransactionType type,
    required String source,
    // required String country,
    @JsonKey(name: 'Aim') required String aimCode,
    @DateTimeConverter() @JsonKey(name: 'Timestamp') required DateTime date,
    // @JsonKey(name: 'Aim') required Aim aim,
    @JsonKey(name: 'Id') required int id,
    String? ackUrl,
    String? pin,
    String? link,
    @DateTimeConverter() DateTime? importDeadline,
    required int size,
  }) = _TransactionModel;

}

extension TransactionModelX on TransactionModel {
  TransactionsCompanion toTransactionCompanion() {
    return TransactionsCompanion.insert(
      source: source,
      aim: aimCode,
      timestamp: date.millisecondsSinceEpoch,
      type: type.index,
      size: size,
      ackUrl: ackUrl != null ? drift.Value(ackUrl) : drift.Value.absent(),
      deadline: drift.Value(importDeadline?.millisecondsSinceEpoch),
      link: drift.Value(link),
      pin: drift.Value(pin),
    );
  }

  String formatDate() {
    var format = DateFormat.yMMMEd(Intl.getCurrentLocale());
    return format.format(this.date);
  }

  List<String> get aimCodes {
    if (aimCode.isEmpty) return [];
    final list = aimCode.split(',');
    list.removeWhere((element) => element == '');
    return list;
  }

  String? get firstAimCode {
    return aimCodes.isNotEmpty ? aimCodes.first : null;
  }
}

class DateTimeConverter implements JsonConverter<DateTime, dynamic> {
  const DateTimeConverter();

  @override
  DateTime fromJson(dynamic value) {
    return value is String
        ? DateTime.parse(value)
        : DateTime.fromMillisecondsSinceEpoch(value);
  }

  @override
  String toJson(DateTime data) => data.toIso8601String();
}

class TransactionTypeConverter implements JsonConverter<TransactionType, int> {
  const TransactionTypeConverter();

  @override
  TransactionType fromJson(int value) {
    return TransactionType.values[value];
  }

  @override
  int toJson(TransactionType data) => data.index;
}
/*
class TransactionModel extends Equatable {


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
}*/
