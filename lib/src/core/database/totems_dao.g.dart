// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'totems_dao.dart';

// ignore_for_file: type=lint
mixin _$TotemsDaoMixin on DatabaseAccessor<MyDatabase> {
  $TotemsTable get totems => attachedDatabase.totems;
  TotemsDaoManager get managers => TotemsDaoManager(this);
}

class TotemsDaoManager {
  final _$TotemsDaoMixin _db;
  TotemsDaoManager(this._db);
  $$TotemsTableTableManager get totems =>
      $$TotemsTableTableManager(_db.attachedDatabase, _db.totems);
}
