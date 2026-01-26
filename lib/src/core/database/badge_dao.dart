import 'package:drift/drift.dart';
import 'package:wom_pocket/src/core/database/database.dart';
import 'package:wom_pocket/src/core/database/tables.dart';

part 'badge_dao.g.dart';

@DriftAccessor(tables: [Badges])
class BadgeDao extends DatabaseAccessor<MyDatabase> with _$BadgeDaoMixin {
  BadgeDao(MyDatabase db) : super(db);

  Future<List<BadgeEntry>> getAllBadgeEntries() => select(badges).get();

  /// Ritorna tutti i badge pubblici.
  Future<List<BadgeEntry>> getPublicBadges({bool excludeArchived = false}) {
    if (excludeArchived) {
      return (select(badges)
            ..where((b) => b.isPublic.equals(true) & b.archived.equals(false)))
          .get();
    }
    return (select(badges)..where((b) => b.isPublic.equals(true))).get();
  }

  Future<BadgeEntry?> getBadgeEntryById(String id) {
    return (select(badges)..where((b) => b.id.equals(id))).getSingleOrNull();
  }

  Future<List<BadgeEntry>> getBadgeEntryByChallengeId(String challengeId) {
    return (select(
      badges,
    )..where((b) => b.challengeId.equals(challengeId))).get();
  }

  Future<int> insertBadgeEntry(BadgesCompanion entry) {
    return into(badges).insert(entry, mode: InsertMode.insertOrReplace);
  }

  Future<void> insertBadgeEntries(List<BadgesCompanion> entries) async {
    await batch((batch) {
      batch.insertAll(badges, entries, mode: InsertMode.insertOrReplace);
    });
  }

  Future<int> updateBadgeEntry(BadgesCompanion entry) {
    return (update(
      badges,
    )..where((b) => b.id.equals(entry.id.value))).write(entry);
  }

  Future<int> deleteBadgeEntry(String id) {
    return (delete(badges)..where((b) => b.id.equals(id))).go();
  }

  Future<int> deleteAllBadgeEntries() {
    return delete(badges).go();
  }

  Future<int> markBadgeAsSeen(String id) {
    return (update(
      badges,
    )..where((b) => b.id.equals(id))).write(BadgesCompanion(seen: Value(true)));
  }

  Future<int> markBadgeAsAchieved(String badgeId) {
    return (update(badges)..where((b) => b.id.equals(badgeId))).write(
      BadgesCompanion(achieved: Value(true), achievedAt: Value(DateTime.now())),
    );
  }

  Future<int> markBadgeAsArchived(String badgeId) {
    return (update(badges)..where((b) => b.id.equals(badgeId))).write(
      BadgesCompanion(archived: Value(true), archivedAt: Value(DateTime.now())),
    );
  }

  Future<int> markBadgeAsUnarchived(String badgeId) {
    return (update(badges)..where((b) => b.id.equals(badgeId))).write(
      BadgesCompanion(archived: Value(false), archivedAt: Value.absent()),
    );
  }

  Future<int> resetBadge(String badgeId) async {
    return (update(badges)..where((b) => b.id.equals(badgeId))).write(
      BadgesCompanion(
        achieved: Value(false),
        achievedAt: Value.absent(),
        seen: Value(false),
      ),
    );
  }
}
