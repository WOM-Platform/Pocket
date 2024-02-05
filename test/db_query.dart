import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:wom_pocket/src/database/database.dart';
import 'package:wom_pocket/src/my_logger.dart';

void main() async {
  late MyDatabase db;

  setUp(() async {
    logger = Logger(
      printer: PrettyPrinter(
        noBoxingByDefault: true,
        printEmojis: false,
      ),
      filter: ReleaseFilter(),
      output: DevOutput(),
    );

    db = MyDatabase.query(NativeDatabase.memory());

    final thirtyDaysAgo =
        DateTime.now().subtract(Duration(days: 30)).millisecondsSinceEpoch;
    final oneYearAgo =
        DateTime.now().subtract(Duration(days: 365)).millisecondsSinceEpoch;
    await db.womsDao.addVouchers([
      ...List.generate(
          27,
          (index) => WomRow(
                id: index.toString(),
                sourceName: "sourceName",
                secret: "secret",
                geohash: "abcde",
                aim: "P",
                sourceId: "sourceId",
                transactionId: index,
                addedOn: thirtyDaysAgo,
                spent: 0,
                latitude: 0.0,
                longitude: 0.0,
              )).map((w) => w.toCompanion(true)),
      ...List.generate(
          20,
          (index) => WomRow(
                id: (100 + index).toString(),
                sourceName: "sourceName",
                secret: "secret",
                geohash: "abcde",
                aim: "P",
                sourceId: "sourceId",
                transactionId: 100 + index,
                addedOn: oneYearAgo,
                spent: 0,
                latitude: 0.0,
                longitude: 0.0,
              )).map((w) => w.toCompanion(true)),
    ]);

  });

  tearDown(() async {
    await db.close();
  });

  group("query", () {

    test('schemeVersion', () async {
      final schemeVersion = await db.schemaVersion;
      expect(schemeVersion, 5);
    });
    test('wom count', () async {
      final woms = await db.womsDao.getTotalWomCount();
      expect(woms, 47);
    });

    test("test maxAge query", () async {

      final filter = SimpleFilter(maxAge: 31);

      final woms = await db.womsDao.getVouchersForPayment(simpleFilter: filter);

      expect(woms.length, 27);
    });


    test("test maxAge query", () async {

      final filter = SimpleFilter(maxAge: 20);

      final woms = await db.womsDao.getVouchersForPayment(simpleFilter: filter);

      expect(woms.length, 0);
    });
  });
}
