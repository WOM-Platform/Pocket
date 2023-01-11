// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aim_percentage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AimInPercentage _$$_AimInPercentageFromJson(Map<String, dynamic> json) =>
    _$_AimInPercentage(
      aim: json['aim'] as String,
      count: json['count'] as int,
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$$_AimInPercentageToJson(_$_AimInPercentage instance) =>
    <String, dynamic>{
      'aim': instance.aim,
      'count': instance.count,
      'percentage': instance.percentage,
    };
