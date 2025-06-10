import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/core/my_logger.dart';
import 'package:wom_pocket/src/features/badge/data/badge.dart';
import 'package:wom_pocket/src/features/badge/data/badge_local_data_source.dart';
import 'package:wom_pocket/src/features/badge/data/badge_remote_data_source.dart';
import 'package:wom_pocket/src/features/badge/data/challenge.dart';

part 'badge_repository.g.dart';

@riverpod
BadgeRepository getBadgeRepository(Ref ref) {
  return BadgeRepositoryImpl(
    ref.read(getBadgeRemoteDataSourceProvider),
    ref.read(getBadgeLocalDataSourceProvider),
  );
}

abstract class BadgeRepository {
  Future<void> setAsSeen(String badgeId);

  Future<List<BadgeData>> getPublicBadges();

  Future<List<BadgeData>> refreshBadgeVerify();

  Future<BadgeData> getBadgeById(String badgeId);

  Future<ChallengeData> getChallengeById(String challengeId);

  Future<List<ChallengeData>> getChallenges();

  Future saveChallenge(ChallengeData challenge);

  Future<void> deleteAllBadges();

  Future<void> deleteAllChallenges();
}

class BadgeRepositoryImpl implements BadgeRepository {
  final BadgeRemoteDataSource _remoteDataSource;
  final BadgeLocalDataSource _localDataSource;

  BadgeRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
  );

  @override
  Future<List<BadgeData>> getPublicBadges() async {
    try {
      final remoteBadges = await _remoteDataSource.getBadges();
      final localBadges = await _localDataSource.getAllPublicBadges();

      // Save new badge locally
      for (final remoteBadge in remoteBadges) {
        final localBadge = localBadges
            .firstWhereOrNull((localBadge) => localBadge.id == remoteBadge.id);
        if (localBadge == null) {
          await _localDataSource.saveNewBadge(remoteBadge);
        } else {
          // Aggiorna sole le info aggiornabili, name, description, image
          // non sovrascrive filter, achieved, achievedAt
          await _localDataSource.verifyAndUpdateBadge(localBadge);
        }
      }

      // Ricarico tutta la lista locale che rispecchia lo stato attuale dei
      // badge, visto che alcuni possono essere aggiornati a seguito di verifiche
      // di completamento (fatte in [LocalDataSource])
      final outputList = await _localDataSource.getAllPublicBadges();

      // Torno solo badge con immagine
      return outputList.where((badge) => badge.image != null).toList();
    } catch (e, st) {
      logger.e(
        'Error in BadgeRepositoryImpl fetching all badges: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<List<BadgeData>> refreshBadgeVerify() async {
    final localBadges = await _localDataSource.getAllPublicBadges();
    for (final localBadge in localBadges) {
      // Aggiorna sole le info aggiornabili, name, description, image
      // non sovrascrive filter, achieved, achievedAt
      await _localDataSource.verifyAndUpdateBadge(localBadge);
    }
    final outputList = await _localDataSource.getAllPublicBadges();
    return outputList;
  }

  @override
  Future<BadgeData> getBadgeById(String badgeId) async {
    try {
      return await _remoteDataSource.getBadgeById(badgeId);
    } catch (e) {
      logger.e(
          'Error in BadgeRepositoryImpl fetching badge with ID $badgeId: $e');
      rethrow;
    }
  }

  @override
  Future<void> setAsSeen(String badgeId) {
    return _localDataSource.setAsSeen(badgeId);
  }

  @override
  Future<ChallengeData> getChallengeById(String challengeId) async {
    try {
      return await _remoteDataSource.getChallengeById(challengeId);
    } catch (e) {
      logger.e(
          'Error in BadgeRepositoryImpl fetching challenge with ID $challengeId: $e');
      rethrow;
    }
  }

  @override
  Future<List<ChallengeData>> getChallenges() async {
    try {
      return await _localDataSource.getChallenges();
    } catch (e) {
      logger.e('Error in BadgeRepositoryImpl fetching challenges: $e');
      rethrow;
    }
  }

  @override
  Future saveChallenge(ChallengeData challenge) async {
    try {
      return await _localDataSource.saveChallenge(challenge);
    } catch (e) {
      logger.e('Error in BadgeRepositoryImpl fetching challenges: $e');
      rethrow;
    }
  }

  @override
  Future<void> deleteAllBadges() async {
    try {
      await _localDataSource.deleteAllBadges();
    } catch (e) {
      logger.e('Error in BadgeRepositoryImpl fetching challenges: $e');
      rethrow;
    }
  }

  @override
  Future<void> deleteAllChallenges()async {
    try {
      await _localDataSource.deleteAllChallenges();
    } catch (e) {
      logger.e('Error in BadgeRepositoryImpl fetching challenges: $e');
      rethrow;
    }
  }
}
