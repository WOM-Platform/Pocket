import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:wom_pocket/src/core/database/database.dart';
import 'package:wom_pocket/src/core/my_logger.dart';
import 'package:wom_pocket/src/features/badge/data/badge.dart';

void main() async {
  late MyDatabase db;
  var dbClosed = false;

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
    dbClosed = false;

    final thirtyDaysAgo =
        DateTime.now().subtract(Duration(days: 30)).millisecondsSinceEpoch;
    final oneYearAgo =
        DateTime.now().subtract(Duration(days: 365)).millisecondsSinceEpoch;
    await db.womsDao.addVouchers([
      ...List.generate(
        27,
        (index) => WomRow(
          id: index.toString(),
          sourceName: 'sourceName',
          secret: 'secret',
          geohash: 'abcde',
          aim: 'P',
          sourceId: 'sourceId',
          transactionId: index,
          addedOn: thirtyDaysAgo,
          spent: 0,
          latitude: 0.0,
          longitude: 0.0,
        ),
      ).map((w) => w.toCompanion(true)),
      ...List.generate(
        20,
        (index) => WomRow(
          id: (100 + index).toString(),
          sourceName: 'sourceName',
          secret: 'secret',
          geohash: 'abcde',
          aim: 'P',
          sourceId: 'sourceId',
          transactionId: 100 + index,
          addedOn: oneYearAgo,
          spent: 0,
          latitude: 0.0,
          longitude: 0.0,
        ),
      ).map((w) => w.toCompanion(true)),
    ]);
  });

  tearDown(() async {
    if (!dbClosed) {
      await db.close();
    }
  });

  group('query', () {
    test('schemeVersion', () async {
      final schemeVersion = db.schemaVersion;
      expect(schemeVersion, 13);
    });

    test('wom count', () async {
      final woms = await db.womsDao.getTotalWomCount();
      expect(woms, 47);
    });

    test('test maxAge query', () async {
      final filter = SimpleFilter(maxAge: 31);

      final woms = await db.womsDao.getVouchersForPayment(simpleFilter: filter);

      expect(woms.length, 27);
    });

    test('test maxAge query', () async {
      final filter = SimpleFilter(maxAge: 20);

      final woms = await db.womsDao.getVouchersForPayment(simpleFilter: filter);

      expect(woms.length, 0);
    });

    test('badge verification uses matching wom count', () async {
      final filter = BadgeSimpleFilter(count: 27, aim: 'P');

      final achieved = await db.womsDao.verifyBadge(filter);

      expect(achieved, isTrue);
    });

    test('payment vouchers tolerate legacy nullable source metadata', () async {
      await db.close();
      dbClosed = true;

      final legacyDb = MyDatabase.query(
        NativeDatabase.memory(
          setup: (rawDb) {
            rawDb.execute('''
              CREATE TABLE wom (
                Id TEXT UNIQUE,
                SourceName TEXT,
                Secret TEXT,
                geohash TEXT,
                Aim TEXT,
                SourceId TEXT,
                TransactionId INTEGER,
                addedOn INTEGER,
                spentOn INTEGER,
                spent INTEGER,
                Latitude REAL,
                Longitude REAL,
                donation_id TEXT
              );
            ''');
            rawDb.execute('''
              INSERT INTO wom (
                Id,
                SourceName,
                Secret,
                geohash,
                Aim,
                SourceId,
                TransactionId,
                addedOn,
                spent,
                Latitude,
                Longitude
              ) VALUES (
                'legacy-valid',
                'sourceName',
                'secret',
                'abcde',
                'P',
                NULL,
                1,
                1000,
                0,
                0.0,
                0.0
              );
            ''');
            rawDb.execute('''
              INSERT INTO wom (
                Id,
                SourceName,
                Secret,
                geohash,
                Aim,
                SourceId,
                TransactionId,
                addedOn,
                spent,
                Latitude,
                Longitude
              ) VALUES (
                'legacy-invalid',
                'sourceName',
                NULL,
                'abcde',
                'P',
                'sourceId',
                2,
                1000,
                0,
                0.0,
                0.0
              );
            ''');
            rawDb.execute('PRAGMA user_version = 13');
          },
        ),
      );
      addTearDown(legacyDb.close);

      final vouchers = await legacyDb.womsDao.getVouchersForPayment();

      expect(vouchers, hasLength(1));
      expect(vouchers.single.id, 'legacy-valid');
      expect(vouchers.single.sourceId, '');
    });
  });
}
