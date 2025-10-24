// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'totem_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TotemData _$TotemDataFromJson(Map<String, dynamic> json) => _TotemData(
  providerId: json['providerId'] as String,
  totemId: json['totemId'] as String,
  eventId: json['eventId'] as String?,
  requestId: json['requestId'] as String?,
);

Map<String, dynamic> _$TotemDataToJson(_TotemData instance) =>
    <String, dynamic>{
      'providerId': instance.providerId,
      'totemId': instance.totemId,
      'eventId': instance.eventId,
      'requestId': instance.requestId,
    };
