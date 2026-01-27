// To open the database, add these imports to the existing file defining the
// database class. They are used to open the database.
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:wom_pocket/src/core/database/aims_dao.dart';
import 'package:wom_pocket/src/core/database/badge_dao.dart';
import 'package:wom_pocket/src/core/database/challenge_dao.dart';
import 'package:wom_pocket/src/core/database/schema_versions.dart';
import 'package:wom_pocket/src/core/database/tables.dart';
import 'package:wom_pocket/src/core/database/totems_dao.dart';
import 'package:wom_pocket/src/core/database/transactions_dao.dart';
import 'package:wom_pocket/src/core/database/woms_dao.dart';
import 'package:wom_pocket/src/core/my_logger.dart';
import 'package:wom_pocket/src/features/badge/data/badge.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [Wom, Aims, Transactions, Totems, Badges, Challenges],
  daos: [WomsDao, AimsDao, TransactionsDao, TotemsDao, BadgeDao, ChallengeDao],
)
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase([DatabaseConnection? connection])
    : super(connection ?? _openConnection());

  @visibleForTesting
  MyDatabase.query(QueryExecutor executor) : super(executor);

  @override
  int get schemaVersion => 13;

  Future<void> importWoms(TransactionsCompanion tx, List<WomRow> woms) {
    return transaction(() async {
      final idx = await transactionsDao.addTransaction(tx);
      final finalWoms = woms
          .map((e) => e.copyWith(transactionId: idx))
          .map((e) => e.toCompanion(true))
          .toList();
      await womsDao.addVouchers(finalWoms);
    });
  }

  Future<void> importTotems(List<TotemsCompanion> totems) {
    return transaction(() async {
      await totemsDao.addTotems(totems);
    });
  }

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
        logger.i('onCreate');
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        await runMigration(m, from, to, this);
      },
      beforeOpen: (details) async {
        final message =
            'db beforeOpen ${details.versionBefore} => ${details.versionNow}';
        logger.i(message);
        Sentry.addBreadcrumb(Breadcrumb(message: message));
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
    logger.i(dbFolder.path);
    final file = File(p.join(dbFolder.path, 'pocket.db'));
    return NativeDatabase(file);
  });
}
