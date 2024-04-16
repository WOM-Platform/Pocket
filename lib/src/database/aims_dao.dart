import 'package:drift/drift.dart';
import 'package:wom_pocket/src/database/database.dart';
import 'package:wom_pocket/src/database/tables.dart';
import 'package:wom_pocket/src/my_logger.dart';

part 'aims_dao.g.dart';

// the _TodosDaoMixin will be created by drift. It contains all the necessary
// fields for the tables. The <MyDatabase> type annotation is the database class
// that should use this dao.
@DriftAccessor(tables: [Aims])
class AimsDao extends DatabaseAccessor<MyDatabase> with _$AimsDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  AimsDao(MyDatabase db) : super(db);

  // Get all woms not spent
  Future<List<AimRow>> get getFlatAimList {
    return select(aims).get();
  }

  Future<AimRow> getAim(String aimCode) {
    return (select(aims)..where((tbl) => tbl.code.equals(aimCode))).getSingle();
  }

  // returns the generated id
  Future<void> addAims(List<AimsCompanion> entries) async {
    await batch((batch) {
      batch.insertAll(aims, entries, mode: InsertMode.insertOrReplace);
    });
  }

  Future<void> deleteTable() async {
    final deleted = await delete(aims).go();
    logger.i('Deleted $deleted rows');
  }
}
