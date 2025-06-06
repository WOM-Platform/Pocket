import 'package:drift/drift.dart';
import 'package:wom_pocket/src/core/database/database.dart';
import 'package:wom_pocket/src/core/database/tables.dart';

part 'challenge_dao.g.dart';

@DriftAccessor(tables: [Challenges])
class ChallengeDao extends DatabaseAccessor<MyDatabase>
    with _$ChallengeDaoMixin {
  ChallengeDao(MyDatabase db) : super(db);

  Future<List<ChallengeEntry>> getAllChallenges() => select(challenges).get();

  Stream<List<ChallengeEntry>> watchAllChallenges() =>
      select(challenges).watch();

  Future<ChallengeEntry?> getChallengeById(String id) {
    return (select(challenges)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Stream<ChallengeEntry?> watchChallengeById(String id) {
    return (select(challenges)..where((tbl) => tbl.id.equals(id)))
        .watchSingleOrNull();
  }

  Future<int> insertChallenge(ChallengesCompanion challenge) {
    return into(challenges).insert(challenge, mode: InsertMode.insertOrReplace);
  }

  Future<void> insertChallenges(List<ChallengesCompanion> challengeList) async {
    await batch((batch) {
      batch.insertAll(challenges, challengeList,
          mode: InsertMode.insertOrReplace);
    });
  }

  Future<bool> updateChallenge(ChallengesCompanion challenge) {
    // L'ID deve essere presente nel companion per l'aggiornamento
    return update(challenges).replace(challenge);
  }

  Future<int> deleteChallenge(String id) {
    return (delete(challenges)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<int> deleteAllChallenges() {
    return delete(challenges).go();
  }

  // Future<int> updateChallengeProgress(String id, int newProgress) {
  //   return (update(challenges)..where((tbl) => tbl.id.equals(id)))
  //       .write(ChallengesCompanion(
  //     currentProgress: Value(newProgress),
  //     updatedAt: Value(DateTime.now()),
  //   ));
  // }
  //
  // Future<int> updateChallengeStatus(String id, String newStatus) {
  //   return (update(challenges)..where((tbl) => tbl.id.equals(id)))
  //       .write(ChallengesCompanion(
  //     status: Value(newStatus),
  //     updatedAt: Value(DateTime.now()),
  //   ));
  // }
}
