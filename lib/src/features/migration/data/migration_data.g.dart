// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'migration_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MigrationData _$MigrationDataFromJson(Map<String, dynamic> json) =>
    _MigrationData(
      code: json['code'] as String,
      link: json['link'] as String,
      importDeadline: DateTime.parse(json['importDeadline'] as String),
    );

Map<String, dynamic> _$MigrationDataToJson(_MigrationData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'link': instance.link,
      'importDeadline': instance.importDeadline.toIso8601String(),
    };
