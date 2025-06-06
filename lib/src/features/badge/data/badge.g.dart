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
