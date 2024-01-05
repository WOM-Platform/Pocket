// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aim_percentage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AimInPercentageImpl _$$AimInPercentageImplFromJson(
        Map<String, dynamic> json) =>
    _$AimInPercentageImpl(
      aim: json['aim'] as String,
      count: json['count'] as int,
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$$AimInPercentageImplToJson(
        _$AimInPercentageImpl instance) =>
    <String, dynamic>{
      'aim': instance.aim,
      'count': instance.count,
      'percentage': instance.percentage,
    };
