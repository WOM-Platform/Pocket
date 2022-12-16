// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionModel _$$_TransactionModelFromJson(Map<String, dynamic> json) =>
    _$_TransactionModel(
      type: const TransactionTypeConverter().fromJson(json['type'] as int),
      source: json['source'] as String,
      aimCode: json['Aim'] as String,
      date: const DateTimeConverter().fromJson(json['Timestamp']),
      id: json['Id'] as int,
      ackUrl: json['ackUrl'] as String?,
      pin: json['pin'] as String?,
      link: json['link'] as String?,
      importDeadline:
          const DateTimeConverter().fromJson(json['importDeadline']),
      size: json['size'] as int,
    );

Map<String, dynamic> _$$_TransactionModelToJson(_$_TransactionModel instance) =>
    <String, dynamic>{
      'type': const TransactionTypeConverter().toJson(instance.type),
      'source': instance.source,
      'Aim': instance.aimCode,
      'Timestamp': const DateTimeConverter().toJson(instance.date),
      'Id': instance.id,
      'ackUrl': instance.ackUrl,
      'pin': instance.pin,
      'link': instance.link,
      'importDeadline': _$JsonConverterToJson<dynamic, DateTime>(
          instance.importDeadline, const DateTimeConverter().toJson),
      'size': instance.size,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
