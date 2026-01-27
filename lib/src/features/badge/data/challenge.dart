import 'package:drift/drift.dart' show Value;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wom_pocket/src/core/database/database.dart';
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

  factory ChallengeData.fromChallengeEntry(
    ChallengeEntry entry,
    List<BadgeEntry> badges,
  ) {
    return ChallengeData(
      id: entry.id,
      name: entry.name,
      isPublic: entry.isPublic,
      description: entry.description,
      badges: badges.map((b) => BadgeData.fromBadgeEntry(b)).toList(),
    );
  }
}

extension ChallengeDataExtensions on ChallengeData {
  ChallengesCompanion toChallengeCompanion() {
    return ChallengesCompanion(
      id: Value(id),
      isPublic: Value(isPublic),
      name: Value(name),
      description: Value(description),
    );
  }
}
