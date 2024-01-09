import 'package:drift/drift.dart';
import 'package:wom_pocket/src/database/database.dart';
import 'package:wom_pocket/src/database/tables.dart';
import 'package:wom_pocket/src/my_logger.dart';

part 'totems_dao.g.dart';

// the _TodosDaoMixin will be created by drift. It contains all the necessary
// fields for the tables. The <MyDatabase> type annotation is the database class
// that should use this dao.
@DriftAccessor(tables: [Totems])
class TotemsDao extends DatabaseAccessor<MyDatabase> with _$TotemsDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  TotemsDao(MyDatabase db) : super(db);

  Future<int> addTotem(
    String providerId,
    String eventId,
    String totemId,
    String sessionId,
  ) async {
    return into(totems).insert(
      TotemsCompanion.insert(
        sessionId: sessionId,
        totemId: totemId,
        eventId: eventId,
        providerId: providerId,
        timestamp: DateTime.now(),
      ),
    );
  }

  Future<String?> getLastScan(
      String providerId, String eventId, String totemId) async {
    final List<TotemRow> roe = await (select(totems)
          ..where(
            (t) => Expression.and(
              [
                t.providerId.equals(providerId),
                t.eventId.equals(eventId),
              ],
            ),
          )
          ..orderBy([(t) => OrderingTerm(expression: t.timestamp)]))
        .get();
    if (roe.isEmpty) {
      return null;
    }
    roe.forEach((element) {
      print('${element.sessionId} ${element.timestamp}');
    });
    return roe.last.sessionId;
  }

  Future<void> deleteTable() async {
    final deleted = await delete(totems).go();
    logger.i('Deleted $deleted rows');
  }
}
