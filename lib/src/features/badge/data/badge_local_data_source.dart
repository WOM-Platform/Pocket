import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/core/application/aim_notifier.dart';
import 'package:wom_pocket/src/core/database/database.dart';
import 'package:wom_pocket/src/core/my_logger.dart';
import 'package:wom_pocket/src/features/badge/data/badge.dart';
import 'package:drift/drift.dart' as drift;
import 'package:wom_pocket/src/features/badge/data/challenge.dart';

part 'badge_local_data_source.g.dart';

@riverpod
BadgeLocalDataSource getBadgeLocalDataSource(Ref ref) {
  return BadgeLocalDataSource(ref.read(getDatabaseProvider));
}

class BadgeLocalDataSource {
  final MyDatabase _db;

  BadgeLocalDataSource(this._db);

  BadgesCompanion _toCompanion(BadgeData badge) {
    return BadgesCompanion(
      id: drift.Value(badge.id),
      isPublic: drift.Value(badge.isPublic),
      name: drift.Value(badge.name),
      description: badge.description == null
          ? const drift.Value.absent()
          : drift.Value(badge.description!),
      image: badge.image == null
          ? const drift.Value.absent()
          : drift.Value(badge.image),
      achieved: drift.Value(badge.achieved),
      seen: const drift.Value.absent(),
      filter: badge.simpleFilter == null
          ? const drift.Value.absent()
          : drift.Value(badge.simpleFilter!),
      achievedAt: badge.achievedAt == null
          ? const drift.Value.absent()
          : drift.Value(badge.achievedAt!),
      createdAt: badge.createdAt == null
          ? const drift.Value.absent()
          : drift.Value(badge.createdAt),
      lastUpdate: badge.lastUpdate == null
          ? const drift.Value.absent()
          : drift.Value(badge.lastUpdate),
      challengeId: badge.challengeId == null
          ? const drift.Value.absent()
          : drift.Value(badge.challengeId),
    );
  }

  BadgesCompanion _toCompanionUpdate(BadgeData badge) {
    return BadgesCompanion(
      id: drift.Value(badge.id),
      isPublic: drift.Value(badge.isPublic),
      name: drift.Value(badge.name),
      description: badge.description == null
          ? const drift.Value.absent()
          : drift.Value(badge.description!),
      image: badge.image == null
          ? const drift.Value.absent()
          : drift.Value(badge.image),
      lastUpdate: badge.lastUpdate == null
          ? const drift.Value.absent()
          : drift.Value(badge.lastUpdate),
      achievedAt: badge.achievedAt == null
          ? const drift.Value.absent()
          : drift.Value(badge.achievedAt),
      achieved: drift.Value(badge.achieved),
      informationUri:  badge.informationUri == null
          ? const drift.Value.absent()
          : drift.Value(badge.informationUri),
      seen: drift.Value(badge.seen),
    );
  }

  BadgeData _fromBadgeEntry(BadgeEntry entry) {
    return BadgeData(
      id: entry.id,
      name: entry.name,
      description: entry.description,
      image: entry.image,
      achievedAt: entry.achievedAt,
      achieved: entry.achieved,
      createdAt: entry.createdAt,
      lastUpdate: entry.lastUpdate,
      isPublic: entry.isPublic,
      seen: entry.seen,
      challengeId: entry.challengeId,
      simpleFilter: entry.filter,
      informationUri: entry.informationUri,
    );
  }

  ChallengeData _fromChallengeEntry(
      ChallengeEntry entry, List<BadgeEntry> badges) {
    return ChallengeData(
      id: entry.id,
      name: entry.name,
      isPublic: entry.isPublic,
      description: entry.description,
      badges: badges.map((b) => _fromBadgeEntry(b)).toList(),
    );
  }

  _toChallengeEntry(ChallengeData data) {
    return ChallengesCompanion(
      id: drift.Value(data.id),
      isPublic: drift.Value(data.isPublic),
      name: drift.Value(data.name),
      description: drift.Value(data.description),
    );
  }

  Future<void> saveNewBadge(BadgeData badge) async {
    var updatedBadge = badge.copyWith();
    if (!updatedBadge.achieved) {
      final achieved = await verifyBadge(updatedBadge);
      if (achieved) {
        logger.i(
            'this badge has just verified verified: ${updatedBadge.name}, ${updatedBadge.id}');
        updatedBadge = updatedBadge.copyWith(
          achievedAt: DateTime.now(),
          achieved: true,
        );
      }
    }
    final companion = _toCompanion(updatedBadge);
    await _db.badgeDao.insertBadgeEntry(companion);
  }

  // Future<void> saveBadges(List<BadgeData> badges) async {
  //   final companions = badges.map(_toCompanion).toList();
  //   await _db.badgeDao.insertBadgeEntries(companions);
  // }

  Future<BadgeData?> getBadgeById(String id) async {
    final entry = await _db.badgeDao.getBadgeEntryById(id);
    return entry != null ? _fromBadgeEntry(entry) : null;
  }

  Future<List<BadgeData>> getAllBadges() async {
    final entries = await _db.badgeDao.getAllBadgeEntries();
    return entries.map(_fromBadgeEntry).toList();
  }

  Future<List<BadgeData>> getAllPublicBadges() async {
    final entries = await _db.badgeDao.getPublicBadges();
    return entries.map(_fromBadgeEntry).toList();
  }

  Future<void> verifyAndUpdateBadge(BadgeData badge) async {
    var updatedBadge = badge.copyWith();
    if (!updatedBadge.achieved) {
      final achieved = await verifyBadge(updatedBadge);
      if (achieved) {
        logger.i(
            'this badge has just verified verified: ${updatedBadge.name}, ${updatedBadge.id}');
        updatedBadge = updatedBadge.copyWith(
          achievedAt: DateTime.now(),
          achieved: true,
          seen: false,
        );
      }
    }
    final companion = _toCompanionUpdate(updatedBadge);
    await _db.badgeDao.updateBadgeEntry(companion);
  }

  Future<void> deleteAllBadges() async {
    await _db.badgeDao.deleteAllBadgeEntries();
  }

  Future<void> setAsSeen(String badgeId) async {
    await _db.badgeDao.markBadgeAsSeen(badgeId);
  }

  Future<void> setAsAchieved(String badgeId) async {
    await _db.badgeDao.markBadgeAsAchieved(badgeId);
  }

  Future<List<ChallengeData>> getChallenges() async {
    final output = <ChallengeData>[];
    try {
      final challenges = await _db.challengeDao.getAllChallenges();

      for (int i = 0; i < challenges.length; i++) {
        final challenge = challenges[i];

        // Solo badge con immagine
        final badges =
            (await _db.badgeDao.getBadgeEntryByChallengeId(challenge.id))
                .map(_fromBadgeEntry)
                .where((badge) => badge.image != null)
                .toList();

        for (int j = 0; j < badges.length; j++) {
          final badge = badges[j];
          if (!badge.achieved) {
            final achieved = await verifyBadge(badge);
            if (achieved) {
              logger.i(
                  'this badge has just verified verified: ${badge.name}, ${badge.id}');
              await setAsAchieved(badge.id);
            }
          }
        }
        final updatedBadges =
            await _db.badgeDao.getBadgeEntryByChallengeId(challenge.id);
        output.add(
          _fromChallengeEntry(challenge, updatedBadges),
        );
      }
    } catch (ex, st) {
      logger.e('getChallenges', error: ex, stackTrace: st);
    }
    return output;
  }

  Future saveChallenge(ChallengeData challenge) async {
    final entry = _toChallengeEntry(challenge);
    await _db.challengeDao.insertChallenge(entry);
    for (int i = 0; i < challenge.badges.length; i++) {
      final badge = challenge.badges[i];
      await saveNewBadge(badge);
    }
  }

  // Salva una nuova challenge e tutti i suoi badge
  Future saveNewChallenge(ChallengeData challenge) async {
    final entry = _toChallengeEntry(challenge);
    await _db.challengeDao.insertChallenge(entry);
    for (int i = 0; i < challenge.badges.length; i++) {
      final badge = challenge.badges[i];
      await saveNewBadge(badge);
    }
  }

  FutureOr<bool> verifyBadge(BadgeData badge) {
    if (badge.simpleFilter == null) return false;
    return _db.womsDao.verifyBadge(badge.simpleFilter!);
  }

  deleteAllChallenges() {
    _db.challengeDao.deleteAllChallenges();
  }

  // Future<void> resetAllBadges() async {
  //   final badges = await getAllBadges();
  //   for (int i = 0; i < badges.length; i++) {
  //     final badge = badges[i];
  //     await _db.badgeDao.resetBadge(badge.id);
  //   }
  // }
}
