// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aims_dao.dart';

// ignore_for_file: type=lint
mixin _$AimsDaoMixin on DatabaseAccessor<MyDatabase> {
  $AimsTable get aims => attachedDatabase.aims;
  AimsDaoManager get managers => AimsDaoManager(this);
}

class AimsDaoManager {
  final _$AimsDaoMixin _db;
  AimsDaoManager(this._db);
  $$AimsTableTableManager get aims =>
      $$AimsTableTableManager(_db.attachedDatabase, _db.aims);
}
