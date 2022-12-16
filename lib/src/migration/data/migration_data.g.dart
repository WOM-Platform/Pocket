// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'migration_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MigrationData _$$_MigrationDataFromJson(Map<String, dynamic> json) =>
    _$_MigrationData(
      code: json['code'] as String,
      link: json['link'] as String,
      importDeadline:
          const DateTimeConverter().fromJson(json['importDeadline']),
    );

Map<String, dynamic> _$$_MigrationDataToJson(_$_MigrationData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'link': instance.link,
      'importDeadline':
          const DateTimeConverter().toJson(instance.importDeadline),
    };
