/*
import 'package:flutter_test/flutter_test.dart';
import 'package:drift_dev/api/migrations.dart';
import 'package:wom_pocket/src/database/database.dart';

// The generated directory from before.
import 'generated_migrations/schema.dart';

void main() {
  late SchemaVerifier verifier;

  setUpAll(() {
    // GeneratedHelper() was generated by drift, the verifier is an api
    // provided by drift_dev.
    verifier = SchemaVerifier(GeneratedHelper());
  });

  test('upgrade from v4 to v5', () async {
    // Use startAt(1) to obtain a database connection with all tables
    // from the v4 schema.
    final connection = await verifier.startAt(4);
    final db = MyDatabase(connection);

    // Use this to run a migration to v5 and then validate that the
    // database has the expected schema.
    await verifier.migrateAndValidate(db, 5);
  });
}*/
