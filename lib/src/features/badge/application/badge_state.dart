import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wom_pocket/src/features/badge/data/badge.dart';
import 'package:wom_pocket/src/features/badge/data/challenge.dart';

part 'badge_state.freezed.dart';

@freezed
abstract class BadgeState with _$BadgeState {
  const factory BadgeState({
    @Default([]) List<BadgeData> badges,
    @Default([]) List<ChallengeData> challenges,
  }) = _BadgeState;
}

extension BadgeStateX on BadgeState {
  List<BadgeData> get archivedBadges =>
      badges.where((badge) => badge.archived).toList();

  List<BadgeData> get unarchivedBadge =>
      badges.where((badge) => !badge.archived).toList();
}
