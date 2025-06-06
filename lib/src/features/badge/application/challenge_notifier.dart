import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/features/badge/data/challenge.dart';
import 'package:wom_pocket/src/features/badge/domain/badge_repository.dart';

part 'challenge_notifier.g.dart';

@riverpod
Future<ChallengeData> getChallenge(Ref ref, String challengeId) async {
  final repo = ref.read(getBadgeRepositoryProvider);
  return repo.getChallengeById(challengeId);
}
