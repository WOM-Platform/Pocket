// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badge_dao.dart';

// ignore_for_file: type=lint
mixin _$BadgeDaoMixin on DatabaseAccessor<MyDatabase> {
  $BadgesTable get badges => attachedDatabase.badges;
  BadgeDaoManager get managers => BadgeDaoManager(this);
}

class BadgeDaoManager {
  final _$BadgeDaoMixin _db;
  BadgeDaoManager(this._db);
  $$BadgesTableTableManager get badges =>
      $$BadgesTableTableManager(_db.attachedDatabase, _db.badges);
}
