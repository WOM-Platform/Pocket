// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_dao.dart';

// ignore_for_file: type=lint
mixin _$ChallengeDaoMixin on DatabaseAccessor<MyDatabase> {
  $ChallengesTable get challenges => attachedDatabase.challenges;
  ChallengeDaoManager get managers => ChallengeDaoManager(this);
}

class ChallengeDaoManager {
  final _$ChallengeDaoMixin _db;
  ChallengeDaoManager(this._db);
  $$ChallengesTableTableManager get challenges =>
      $$ChallengesTableTableManager(_db.attachedDatabase, _db.challenges);
}
