import 'package:drift/drift.dart';
import 'package:wom_pocket/src/database/database.dart';
import 'package:wom_pocket/src/database/tables.dart';
import 'package:wom_pocket/src/models/wom_model.dart';

part 'woms_dao.g.dart';

// the _TodosDaoMixin will be created by drift. It contains all the necessary
// fields for the tables. The <MyDatabase> type annotation is the database class
// that should use this dao.
@DriftAccessor(tables: [Wom])
class WomsDao extends DatabaseAccessor<MyDatabase> with _$WomsDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  WomsDao(MyDatabase db) : super(db);

  // Get all woms not spent
  Future<List<WomRow>> get getAllWoms =>
      (select(wom)..where((tbl) => tbl.live.equals(WomStatus.ON.index))).get();

  Future<int> getWomCount() async {
    var countExp = wom.id.count(filter: wom.live.equals(WomStatus.ON.index));
    final query = selectOnly(wom)..addColumns([countExp]);
    var result = await query.map((row) => row.read(countExp)).getSingle();
    return result ?? 0;
  }

  // returns the generated id
  Future<void> addVouchers(List<WomCompanion> entries) async {
    await batch((batch) {
      batch.insertAll(wom, entries);
    });
  }

  Future updateWomStatusToOff(String womId, int transactionId) {
    return (update(wom)..where((t) => t.id.equals(womId))).write(
      WomCompanion(
        live: Value(WomStatus.OFF.index),
        transactionId: Value(transactionId),
      ),
    );
  }

}