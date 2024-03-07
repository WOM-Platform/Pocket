import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:wom_pocket/src/database/database.dart';
import 'package:wom_pocket/src/my_logger.dart';

main() {
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
          22000,
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
    ]);

  });

  tearDown(() async {
    await db.close();
  });
  group('migration', () {

  });
}