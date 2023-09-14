// To open the database, add these imports to the existing file defining the
// database class. They are used to open the database.
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:wom_pocket/src/database/aims_dao.dart';
import 'package:wom_pocket/src/database/tables.dart';
import 'package:wom_pocket/src/database/transactions_dao.dart';
import 'package:wom_pocket/src/database/woms_dao.dart';
import 'package:wom_pocket/src/my_logger.dart';

part 'database.g.dart';

@DriftDatabase(
    tables: [Wom, Aims, Transactions],
    daos: [WomsDao, AimsDao, TransactionsDao])
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase([DatabaseConnection? connection]) : super(connection ?? _openConnection());

  @override
  int get schemaVersion => 4;

  Future<void> deleteEverything() async {
    await transaction(() async {
      // Deleting tables in reverse topological order to avoid foreign-key conflicts
      final tables = allTables.toList().reversed;
      for (final table in tables) await delete(table).go();
    });
  }

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {

        logger.wtf('from $from to $to');
        if (from < 4) {
          await m.addColumn(wom, wom.donationId);
          await m.addColumn(wom, wom.spentOn);
          await m.renameColumn(wom, 'live', wom.spent);
          await m.renameColumn(wom, 'Timestamp', wom.addedOn);
          await m.addColumn(transactions, transactions.pin);
          await m.addColumn(transactions, transactions.link);
          await m.addColumn(transactions, transactions.deadline);
        }
      },
      beforeOpen: (details) async {
        print('version before: ${details.versionBefore}');
        print('version now: ${details.versionNow}');

        if (kDebugMode) {
          // This check pulls in a fair amount of code that's not needed
          // anywhere else, so we recommend only doing it in debug builds.
          // await validateDatabaseSchema();
        }

        return Future.value();
      },
    );
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    print(dbFolder.path);
    final file = File(p.join(dbFolder.path, 'pocket.db'));
    return NativeDatabase(file);
  });
}
