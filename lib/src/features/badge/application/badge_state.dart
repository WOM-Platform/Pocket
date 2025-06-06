import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wom_pocket/src/features/badge/data/badge.dart';
import 'package:wom_pocket/src/features/badge/data/challenge.dart';

part 'badge_state.freezed.dart';

@freezed
class BadgeState with _$BadgeState {
  const factory BadgeState({
    @Default([]) List<BadgeData> badges,
    @Default([]) List<ChallengeData> challenges,
    // Puoi aggiungere altri campi di stato qui se necessario, ad esempio:
    // @Default(false) bool isLoading,
    // String? errorMessage,
  }) = _BadgeState;
}