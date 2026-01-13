// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BadgeData _$BadgeDataFromJson(Map<String, dynamic> json) => _BadgeData(
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
  archived: json['archived'] as bool? ?? false,
  achievedAt: const DateTimeConverter().fromJson(json['achievedAt']),
  archivedAt: const DateTimeConverter().fromJson(json['archivedAt']),
  createdAt: const DateTimeConverter().fromJson(json['createdAt']),
  lastUpdate: const DateTimeConverter().fromJson(json['lastUpdate']),
  informationUri: json['informationUri'] as String?,
  simpleFilter: json['simpleFilter'] == null
      ? null
      : BadgeSimpleFilter.fromJson(
          json['simpleFilter'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$BadgeDataToJson(_BadgeData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isPublic': instance.isPublic,
      'name': instance.name,
      'challengeId': instance.challengeId,
      'description': instance.description,
      'image': instance.image,
      'seen': instance.seen,
      'achieved': instance.achieved,
      'archived': instance.archived,
      'achievedAt': const DateTimeConverter().toJson(instance.achievedAt),
      'archivedAt': const DateTimeConverter().toJson(instance.archivedAt),
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'lastUpdate': const DateTimeConverter().toJson(instance.lastUpdate),
      'informationUri': instance.informationUri,
      'simpleFilter': instance.simpleFilter,
    };

_BadgeSimpleFilter _$BadgeSimpleFilterFromJson(Map<String, dynamic> json) =>
    _BadgeSimpleFilter(
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

Map<String, dynamic> _$BadgeSimpleFilterToJson(_BadgeSimpleFilter instance) =>
    <String, dynamic>{
      'count': instance.count,
      'aim': instance.aim,
      'sourceId': instance.sourceId,
      'bounds': instance.bounds,
      'interval': instance.interval,
    };

_Interval _$IntervalFromJson(Map<String, dynamic> json) => _Interval(
  start: DateTime.parse(json['start'] as String),
  end: DateTime.parse(json['end'] as String),
);

Map<String, dynamic> _$IntervalToJson(_Interval instance) => <String, dynamic>{
  'start': instance.start.toIso8601String(),
  'end': instance.end.toIso8601String(),
};

_ImageData _$ImageDataFromJson(Map<String, dynamic> json) => _ImageData(
  fullSizeUrl: json['fullSizeUrl'] as String,
  midDensityFullWidthUrl: json['midDensityFullWidthUrl'] as String,
  highDensityFullWidthUrl: json['highDensityFullWidthUrl'] as String,
  squareThumbnailUrl: json['squareThumbnailUrl'] as String,
  blurHash: json['blurHash'] as String,
);

Map<String, dynamic> _$ImageDataToJson(_ImageData instance) =>
    <String, dynamic>{
      'fullSizeUrl': instance.fullSizeUrl,
      'midDensityFullWidthUrl': instance.midDensityFullWidthUrl,
      'highDensityFullWidthUrl': instance.highDensityFullWidthUrl,
      'squareThumbnailUrl': instance.squareThumbnailUrl,
      'blurHash': instance.blurHash,
    };
