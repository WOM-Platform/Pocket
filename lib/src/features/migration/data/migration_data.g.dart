// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'migration_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MigrationDataImpl _$$MigrationDataImplFromJson(Map<String, dynamic> json) =>
    _$MigrationDataImpl(
      code: json['code'] as String,
      link: json['link'] as String,
      importDeadline:
          const DateTimeConverter().fromJson(json['importDeadline']),
    );

Map<String, dynamic> _$$MigrationDataImplToJson(_$MigrationDataImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'link': instance.link,
      'importDeadline':
          const DateTimeConverter().toJson(instance.importDeadline),
    };
