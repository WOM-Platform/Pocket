// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'totem_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TotemDataImpl _$$TotemDataImplFromJson(Map<String, dynamic> json) =>
    _$TotemDataImpl(
      providerId: json['providerId'] as String,
      eventId: json['eventId'] as String,
      totemId: json['totemId'] as String,
      requestId: json['requestId'] as String?,
    );

Map<String, dynamic> _$$TotemDataImplToJson(_$TotemDataImpl instance) =>
    <String, dynamic>{
      'providerId': instance.providerId,
      'eventId': instance.eventId,
      'totemId': instance.totemId,
      'requestId': instance.requestId,
    };
