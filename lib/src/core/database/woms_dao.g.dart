// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'woms_dao.dart';

// ignore_for_file: type=lint
mixin _$WomsDaoMixin on DatabaseAccessor<MyDatabase> {
  $WomTable get wom => attachedDatabase.wom;
  $AimsTable get aims => attachedDatabase.aims;
  WomsDaoManager get managers => WomsDaoManager(this);
}

class WomsDaoManager {
  final _$WomsDaoMixin _db;
  WomsDaoManager(this._db);
  $$WomTableTableManager get wom =>
      $$WomTableTableManager(_db.attachedDatabase, _db.wom);
  $$AimsTableTableManager get aims =>
      $$AimsTableTableManager(_db.attachedDatabase, _db.aims);
}
