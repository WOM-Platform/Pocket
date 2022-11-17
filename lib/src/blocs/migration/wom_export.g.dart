// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wom_export.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WomExport _$$_WomExportFromJson(Map<String, dynamic> json) => _$_WomExport(
      wom: Voucher.fromJson(json['wom'] as Map<String, dynamic>),
      sourceId: json['sourceId'] as String,
      sourceName: json['sourceName'] as String,
    );

Map<String, dynamic> _$$_WomExportToJson(_$_WomExport instance) =>
    <String, dynamic>{
      'wom': instance.wom,
      'sourceId': instance.sourceId,
      'sourceName': instance.sourceName,
    };
