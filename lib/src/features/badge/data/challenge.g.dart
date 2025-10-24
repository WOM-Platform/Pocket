// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChallengeData _$ChallengeDataFromJson(Map<String, dynamic> json) =>
    _ChallengeData(
      id: json['id'] as String,
      isPublic: json['isPublic'] as bool,
      badges: (json['badges'] as List<dynamic>)
          .map((e) => BadgeData.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: Map<String, String>.from(json['name'] as Map),
      description: (json['description'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$ChallengeDataToJson(_ChallengeData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isPublic': instance.isPublic,
      'badges': instance.badges,
      'name': instance.name,
      'description': instance.description,
    };
