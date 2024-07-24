import 'package:drift/drift.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:wom_pocket/src/core/database/database.dart';
import 'package:wom_pocket/src/core/database/tables.dart';
import 'package:wom_pocket/src/core/my_logger.dart';

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
    String providerName,
    String eventId,
    String totemId,
    String sessionId,
    String? totemName,
    String? womLink,
    String? womPin,
    String? eventName,
    String? sessionName,
    String? email,
    String? url,
    String? phoneNumber,
    double? latitude,
    double? longitude,
  ) async {
    return into(totems).insert(
      TotemsCompanion.insert(
        sessionId: sessionId,
        totemId: totemId,
        eventId: eventId,
        providerId: providerId,
        providerName: Value(providerName),
        timestamp: DateTime.now(),
        womLink: Value(womLink),
        womPin: Value(womPin),
        eventName: Value(eventName),
        sessionName: Value(sessionName),
        latitude: Value(latitude),
        longitude: Value(longitude),
        totemName: Value(totemName),
        url: Value(url),
        email: Value(email),
        phoneNumber: Value(phoneNumber),
      ),
    );
  }

  Future<void> addTotems(List<TotemsCompanion> entries) async {
    await batch((batch) {
      batch.insertAll(totems, entries, mode: InsertMode.insertOrAbort);
    });
  }

  Future<List<TotemRow>> getScans() {
    return (select(totems)
          ..orderBy([
            (t) => OrderingTerm(
                  expression: t.timestamp,
                  mode: OrderingMode.desc,
                ),
          ]))
        .get();
  }

  Future<(String, int, bool)?> getLastScan(
    String providerId,
    String eventId,
    String totemId,
  ) async {
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
      logger.i('${element.sessionId} ${element.timestamp}');
    });
    final lastSessionId = roe.last.sessionId;
    final participationCount = roe.length;

    final List<TotemRow> newRoe = await (select(totems)
          ..where(
            (t) => Expression.and(
              [
                t.providerId.equals(providerId),
                t.eventId.equals(eventId),
                t.sessionId.equals(lastSessionId),
                t.totemId.equals(totemId),
              ],
            ),
          ))
        .get();
    if (newRoe.length > 1) {
      FirebaseAnalytics.instance.logEvent(
        name: 'SessionTotemQuery multiple row returned',
      );
    }
    return (
      lastSessionId,
      participationCount,
      newRoe.isNotEmpty,
    );
  }

  Future<Map<String, int>?> getLastScan2(
    String providerId,
    String totemId,
  ) async {
    final List<TotemRow> roe = await (select(totems)
          ..where(
            (t) => Expression.and(
              [
                t.providerId.equals(providerId),
                t.totemId.equals(totemId),
              ],
            ),
          )
          ..orderBy([(t) => OrderingTerm(expression: t.timestamp)]))
        .get();
    if (roe.isEmpty) {
      return null;
    }
    final m = <String, int>{};
    roe.forEach((element) {
      logger.i('${element.sessionId} ${element.timestamp}');
      m[element.sessionId] = (m[element.sessionId] ?? 0) + 1;
    });
    return m;
  }

  Future<void> deleteTable() async {
    final deleted = await delete(totems).go();
    logger.i('Deleted $deleted rows');
  }
}
