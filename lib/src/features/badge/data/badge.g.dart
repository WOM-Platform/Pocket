// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BadgeDataImpl _$$BadgeDataImplFromJson(Map<String, dynamic> json) =>
    _$BadgeDataImpl(
      id: json['id'] as String,
      isPublic: json['isPublic'] as bool,
      name: Map<String, String>.from(json['name'] as Map),
      challengeId: json['challengeId'] as String?,
      description: (json['description'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      image: json['image'] == null
          ? null
          : ImageData.fromJson(json['image'] as Map<String, dynamic>),
      seen: json['seen'] as bool? ?? false,
      achieved: json['achieved'] as bool? ?? false,
      achievedAt: const DateTimeConverter().fromJson(json['achievedAt']),
      createdAt: const DateTimeConverter().fromJson(json['createdAt']),
      lastUpdate: const DateTimeConverter().fromJson(json['lastUpdate']),
      informationUri: json['informationUri'] as String?,
      simpleFilter: json['simpleFilter'] == null
          ? null
          : BadgeSimpleFilter.fromJson(
              json['simpleFilter'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BadgeDataImplToJson(_$BadgeDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isPublic': instance.isPublic,
      'name': instance.name,
      'challengeId': instance.challengeId,
      'description': instance.description,
      'image': instance.image,
      'seen': instance.seen,
      'achieved': instance.achieved,
      'achievedAt': const DateTimeConverter().toJson(instance.achievedAt),
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'lastUpdate': const DateTimeConverter().toJson(instance.lastUpdate),
      'informationUri': instance.informationUri,
      'simpleFilter': instance.simpleFilter,
    };

_$BadgeSimpleFilterImpl _$$BadgeSimpleFilterImplFromJson(
        Map<String, dynamic> json) =>
    _$BadgeSimpleFilterImpl(
      count: (json['count'] as num).toInt(),
      aim: json['aim'] as String?,
      sourceId: json['sourceId'] as String?,
      bounds: json['bounds'] == null
          ? null
          : Bounds.fromJson(json['bounds'] as Map<String, dynamic>),
      interval: json['interval'] == null
          ? null
          : Interval.fromJson(json['interval'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BadgeSimpleFilterImplToJson(
        _$BadgeSimpleFilterImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'aim': instance.aim,
      'sourceId': instance.sourceId,
      'bounds': instance.bounds,
      'interval': instance.interval,
    };

_$IntervalImpl _$$IntervalImplFromJson(Map<String, dynamic> json) =>
    _$IntervalImpl(
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
    );

Map<String, dynamic> _$$IntervalImplToJson(_$IntervalImpl instance) =>
    <String, dynamic>{
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
    };

_$ImageDataImpl _$$ImageDataImplFromJson(Map<String, dynamic> json) =>
    _$ImageDataImpl(
      fullSizeUrl: json['fullSizeUrl'] as String,
      midDensityFullWidthUrl: json['midDensityFullWidthUrl'] as String,
      highDensityFullWidthUrl: json['highDensityFullWidthUrl'] as String,
      squareThumbnailUrl: json['squareThumbnailUrl'] as String,
      blurHash: json['blurHash'] as String,
    );

Map<String, dynamic> _$$ImageDataImplToJson(_$ImageDataImpl instance) =>
    <String, dynamic>{
      'fullSizeUrl': instance.fullSizeUrl,
      'midDensityFullWidthUrl': instance.midDensityFullWidthUrl,
      'highDensityFullWidthUrl': instance.highDensityFullWidthUrl,
      'squareThumbnailUrl': instance.squareThumbnailUrl,
      'blurHash': instance.blurHash,
    };
