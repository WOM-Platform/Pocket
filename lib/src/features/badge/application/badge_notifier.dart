import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/core/my_logger.dart';
import 'package:wom_pocket/src/features/badge/application/badge_state.dart';
import 'package:wom_pocket/src/features/badge/data/badge.dart';
import 'package:wom_pocket/src/features/badge/data/challenge.dart';
import 'package:wom_pocket/src/features/badge/domain/badge_repository.dart';

part 'badge_notifier.g.dart';

@riverpod
class BadgeNotifier extends _$BadgeNotifier {
  Future<BadgeState> build() async {
    final repo = ref.read(getBadgeRepositoryProvider);
    final badges = await repo.getPublicBadges();
    final challenges = await repo.getChallenges();

    return BadgeState(
      badges: [
        ...badges,
        ...challenges.expand((c) => c.badges),
      ],
      // challenges: challenges,
    );
  }

  Future<void> setAsSeen(String badgeId) async {
    final currentState = state;
    try {
      // Accedi al valore solo se lo stato è AsyncData e non nullo
      final currentBadges = currentState.asData?.value.badges;
      // final currentChallenges = currentState.asData?.value.challenges;
      if (currentBadges == null) {
        return;
      }

      // Trova l'indice del badge da aggiornare
      final badgeIndex = currentBadges.indexWhere((b) => b.id == badgeId);

      // Se il badge non viene trovato, esci
      if (badgeIndex == -1) {
        return;
      }

      // Crea una nuova lista con il badge aggiornato per mantenere l'immutabilità
      final updatedBadges = List<BadgeData>.from(currentBadges);
      final badgeToUpdate = updatedBadges[badgeIndex];

      if (!badgeToUpdate.achieved || badgeToUpdate.seen == true) {
        return;
      }
      updatedBadges[badgeIndex] = badgeToUpdate.copyWith(seen: true);

      state = AsyncData(
        BadgeState(
          badges: updatedBadges,
          // challenges: currentChallenges ?? [],
        ),
      );
      await ref.read(getBadgeRepositoryProvider).setAsSeen(badgeId);
    } catch (ex, st) {
      state = currentState;
    }
  }

  Future<void> acceptChallenge(ChallengeData challenge) async {
    final currentState = state;
    try {
      final v = state.value;
      if (currentState is AsyncData && v != null) {
        await ref.read(getBadgeRepositoryProvider).saveChallenge(challenge);
        final newList = v.badges.toList();
        for (final badge in challenge.badges) {
          if (newList.firstWhereOrNull((b) => b.id == badge.id) == null) {
            newList.add(badge);
          }
        }
        state = AsyncData(
          BadgeState(
            badges: newList,
            // challenges: [...v.challenges, challenge],
          ),
        );
      }
    } catch (ex, st) {
      logger.e('acceptChallenge', error: ex, stackTrace: st);
    }
  }

  // _refreshBadgeVerify() async {
  //   final currentState = state;
  //   try {
  //     final v = state.value;
  //     if (currentState is AsyncData && v != null) {
  //       final badges =
  //           await ref.read(getBadgeRepositoryProvider).refreshBadgeVerify();
  //     }
  //   } catch (ex, st) {
  //     state = currentState;
  //     logger.e('refreshBadgeVerify', error: ex, stackTrace: st);
  //   }
  // }

  Future<void> resetAllBadges() async {
    try {
      await ref.read(getBadgeRepositoryProvider).deleteAllBadges();
      await ref.read(getBadgeRepositoryProvider).deleteAllChallenges();
      ref.invalidateSelf();
    } catch (ex, st) {
      logger.e('resetAllBadges', error: ex, stackTrace: st);
    }
  }
}
