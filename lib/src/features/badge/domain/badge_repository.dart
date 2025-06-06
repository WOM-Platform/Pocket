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

  Future<List<BadgeData>> getBadges();

  Future<BadgeData> getBadgeById(String badgeId);

  Future<ChallengeData> getChallengeById(String challengeId);

  Future<List<ChallengeData>>getChallenges();

  Future saveChallenge(ChallengeData challenge);
}

class BadgeRepositoryImpl implements BadgeRepository {
  final BadgeRemoteDataSource _remoteDataSource;
  final BadgeLocalDataSource _localDataSource;

  BadgeRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
  );

  @override
  Future<List<BadgeData>> getBadges() async {
    try {
      final remoteBadges = await _remoteDataSource.getBadges();
      final localBadges = await _localDataSource.getAllBadges();

      // Save new badge locally
      for (final remoteBadge in remoteBadges) {
        final localBadge = localBadges
            .firstWhereOrNull((localBadge) => localBadge.id == remoteBadge.id);
        if (localBadge == null) {
          await _localDataSource.saveBadge(remoteBadge);
        } else {
          await _localDataSource.updateBadge(remoteBadge);
        }
      }

      final outputList = await _localDataSource.getAllBadges();
      return outputList;
    } catch (e, st) {
      logger.e('Error in BadgeRepositoryImpl fetching all badges: $e',
          error: e, stackTrace: st);
      rethrow;
    }
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
  Future<List<ChallengeData>> getChallenges() async{
    try {
      return await _localDataSource.getChallenges();
    } catch (e) {
      logger.e(
          'Error in BadgeRepositoryImpl fetching challenges: $e');
      rethrow;
    }
  }

  @override
  Future saveChallenge(ChallengeData challenge) async{
    try {
      return await _localDataSource.saveChallenge(challenge);
    } catch (e) {
      logger.e(
          'Error in BadgeRepositoryImpl fetching challenges: $e');
      rethrow;
    }
  }
}
