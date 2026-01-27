import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_dev/api/migrations_native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:wom_pocket/src/core/database/database.dart';
import 'package:wom_pocket/src/core/database/schema_versions.dart';
import 'package:wom_pocket/src/core/my_logger.dart';

// Import the generated schema helper
import '../generated_migrations/schema.dart';

// Helper class to access protected methods for testing
class TestDatabase extends MyDatabase {
  TestDatabase(QueryExecutor e) : super.query(e);

  Future<void> exec(String sql) => customStatement(sql);
  Future<List<QueryRow>> query(String sql) => customSelect(sql).get();
}

void main() {
  late SchemaVerifier verifier;

  logger = Logger();
  setUpAll(() {
    verifier = SchemaVerifier(GeneratedHelper());
  });

  test('upgrade from v4 to v5', () async {
    final connection = await verifier.startAt(4);
    final db = MyDatabase(connection);
    await verifier.migrateAndValidate(db, 5);
    await db.close();
  });

  test('manual upgrade test to v13 (fix isPublic column)', () async {
    // Create a database in memory using our TestDatabase wrapper
    final db = TestDatabase(NativeDatabase.memory());
    final m = Migrator(db);

    // 1. Simulate v12 state manually
    await db.exec('''
      CREATE TABLE badges (
        id TEXT NOT NULL PRIMARY KEY,
        informationUri TEXT,
        challengeId TEXT,
        name BLOB NOT NULL,
        description BLOB,
        image BLOB,
        filter BLOB,
        achievedAt INTEGER,
        archivedAt INTEGER,
        createdAt INTEGER,
        lastUpdate INTEGER,
        seen INTEGER NOT NULL DEFAULT 0,
        achieved INTEGER NOT NULL DEFAULT 0,
        archived INTEGER NOT NULL DEFAULT 0
      );
    ''');

    await db.exec('''
      CREATE TABLE totems (
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        sessionId TEXT NOT NULL,
        totemId TEXT NOT NULL,
        eventId TEXT NOT NULL,
        providerId TEXT NOT NULL,
        providerName TEXT,
        womLink TEXT,
        eventName TEXT,
        sessionName TEXT,
        womPin TEXT,
        totemName TEXT,
        email TEXT,
        phoneNumber TEXT,
        image TEXT,
        url TEXT,
        notes TEXT,
        latitude REAL,
        longitude REAL,
        timestamp INTEGER NOT NULL
      );
    ''');

    // 2. Run migration from 12 to 13
    await runMigration(m, 12, 13, db);

    // 3. Verify isPublic column exists in 'badges' table
    final result = await db.query("PRAGMA table_info('badges')");
    final hasIsPublic = result.any(
      (row) => row.read<String>('name') == 'isPublic',
    );

    expect(
      hasIsPublic,
      isTrue,
      reason: 'The isPublic column should be added to badges table',
    );

    // 4. Verify default value
    await db.exec("INSERT INTO badges (id, name) VALUES ('test_id', x'00')");
    final rows = await db.query(
      "SELECT isPublic FROM badges WHERE id = 'test_id'",
    );
    expect(rows.first.read<int>('isPublic'), 0);

    await db.close();
  });
}
