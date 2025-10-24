import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wom_pocket/src/features/badge/data/badge.dart';

part 'challenge.freezed.dart';
part 'challenge.g.dart';

@freezed
abstract class ChallengeData with _$ChallengeData {
  const factory ChallengeData({
    required String id,
    required bool isPublic,
    required List<BadgeData> badges,
    required Map<String, String> name,
    Map<String, String>? description,
  }) = _ChallengeData;

  factory ChallengeData.fromJson(Map<String, dynamic> json) =>
      _$ChallengeDataFromJson(json);
}
