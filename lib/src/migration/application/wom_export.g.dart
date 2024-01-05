// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wom_export.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WomExportImpl _$$WomExportImplFromJson(Map<String, dynamic> json) =>
    _$WomExportImpl(
      wom: Voucher.fromJson(json['wom'] as Map<String, dynamic>),
      sourceId: json['sourceId'] as String,
      sourceName: json['sourceName'] as String,
    );

Map<String, dynamic> _$$WomExportImplToJson(_$WomExportImpl instance) =>
    <String, dynamic>{
      'wom': instance.wom,
      'sourceId': instance.sourceId,
      'sourceName': instance.sourceName,
    };
