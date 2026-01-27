import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wom_pocket/src/core/database/database.dart';

// Import the generated schema helper
// Questo file viene aggiornato automaticamente quando lanci:
// dart run drift_dev schema generate drift_schemas/ test/generated_migrations/
import '../generated_migrations/schema.dart';

void main() {
  late SchemaVerifier verifier;

  setUpAll(() {
    verifier = SchemaVerifier(GeneratedHelper());
  });

  test('upgrade from v4 to v5', () async {
    final connection = await verifier.startAt(4);
    final db = MyDatabase(connection);
    await verifier.migrateAndValidate(db, 5);
    await db.close();
  });

  // --- DECOMMENTA E AGGIUNGI I TEST SOTTOSTANTI MAN MANO CHE GENERI GLI SCHEMI ---

  /*
  test('upgrade from v5 to v6', () async {
    final connection = await verifier.startAt(5);
    final db = MyDatabase(connection);
    await verifier.migrateAndValidate(db, 6);
    await db.close();
  });

  test('upgrade from v6 to v7', () async {
    final connection = await verifier.startAt(6);
    final db = MyDatabase(connection);
    await verifier.migrateAndValidate(db, 7);
    await db.close();
  });

  test('upgrade from v7 to v8', () async {
    final connection = await verifier.startAt(7);
    final db = MyDatabase(connection);
    await verifier.migrateAndValidate(db, 8);
    await db.close();
  });

  test('upgrade from v8 to v9', () async {
    final connection = await verifier.startAt(8);
    final db = MyDatabase(connection);
    await verifier.migrateAndValidate(db, 9);
    await db.close();
  });

  // Nota: v10 sembra essere stata saltata o inclusa nella v11 nel tuo codice di migrazione,
  // verifica la sequenza corretta nel file schema_versions.dart

  test('upgrade from v9 to v11', () async {
    final connection = await verifier.startAt(9);
    final db = MyDatabase(connection);
    await verifier.migrateAndValidate(db, 11);
    await db.close();
  });

  test('upgrade from v11 to v12', () async {
    final connection = await verifier.startAt(11);
    final db = MyDatabase(connection);
    await verifier.migrateAndValidate(db, 12);
    await db.close();
  });

  test('upgrade from v12 to v13', () async {
    final connection = await verifier.startAt(12);
    final db = MyDatabase(connection);
    
    // Validiamo che la migrazione avvenga correttamente e che lo schema finale
    // corrisponda a quello definito nel file v13.json
    await verifier.migrateAndValidate(db, 13);
    
    // Opzionale: Verifica dati specifici post-migrazione
    // final result = await db.customSelect("PRAGMA table_info('badges')").get();
    // final hasIsPublic = result.any((row) => row.read<String>('name') == 'isPublic');
    // expect(hasIsPublic, isTrue);
    
    await db.close();
  });
  */
}
