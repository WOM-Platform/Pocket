// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aim_percentage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AimInPercentage _$AimInPercentageFromJson(Map<String, dynamic> json) =>
    _AimInPercentage(
      aim: json['aim'] as String,
      count: (json['count'] as num).toInt(),
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$AimInPercentageToJson(_AimInPercentage instance) =>
    <String, dynamic>{
      'aim': instance.aim,
      'count': instance.count,
      'percentage': instance.percentage,
    };
