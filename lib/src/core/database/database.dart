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
        await _repairLegacyWomRows();
        if (kDebugMode) {
          // This check pulls in a fair amount of code that's not needed
          // anywhere else, so we recommend only doing it in debug builds.
          // await validateDatabaseSchema();
        }

        return Future.value();
      },
    );
  }

  Future<void> _repairLegacyWomRows() async {
    Future<void> logRepair(String message) async {
      logger.w(message);
      Sentry.addBreadcrumb(Breadcrumb(message: message));
      await Sentry.captureMessage(message, level: SentryLevel.warning);
    }

    final deletedRows = await customUpdate(
      'DELETE FROM ${wom.actualTableName} '
      'WHERE ${wom.id.name} IS NULL OR ${wom.secret.name} IS NULL',
      updates: {wom},
    );

    if (deletedRows > 0) {
      await logRepair('Repaired legacy WOM rows: deleted=$deletedRows');
    }

    final sourceNameNormalizedRows = await customUpdate(
      'UPDATE ${wom.actualTableName} SET '
      "${wom.sourceName.name} = COALESCE(${wom.sourceName.name}, '') "
      'WHERE ${wom.sourceName.name} IS NULL',
      updates: {wom},
    );

    if (sourceNameNormalizedRows > 0) {
      await logRepair(
        'Repaired legacy WOM rows for sourceName: normalized=$sourceNameNormalizedRows',
      );
    }

    final geohashNormalizedRows = await customUpdate(
      'UPDATE ${wom.actualTableName} SET '
      "${wom.geohash.name} = COALESCE(${wom.geohash.name}, '') "
      'WHERE ${wom.geohash.name} IS NULL',
      updates: {wom},
    );

    if (geohashNormalizedRows > 0) {
      await logRepair(
        'Repaired legacy WOM rows for geohash: normalized=$geohashNormalizedRows',
      );
    }

    final aimNormalizedRows = await customUpdate(
      'UPDATE ${wom.actualTableName} SET '
      "${wom.aim.name} = COALESCE(${wom.aim.name}, '0') "
      'WHERE ${wom.aim.name} IS NULL',
      updates: {wom},
    );

    if (aimNormalizedRows > 0) {
      await logRepair(
        'Repaired legacy WOM rows for aim: normalized=$aimNormalizedRows',
      );
    }

    final sourceIdNormalizedRows = await customUpdate(
      'UPDATE ${wom.actualTableName} SET '
      "${wom.sourceId.name} = COALESCE(${wom.sourceId.name}, '') "
      'WHERE ${wom.sourceId.name} IS NULL',
      updates: {wom},
    );

    if (sourceIdNormalizedRows > 0) {
      await logRepair(
        'Repaired legacy WOM rows for sourceId: normalized=$sourceIdNormalizedRows',
      );
    }

    final addedOnNormalizedRows = await customUpdate(
      'UPDATE ${wom.actualTableName} SET '
      '${wom.addedOn.name} = COALESCE(${wom.addedOn.name}, 0) '
      'WHERE ${wom.addedOn.name} IS NULL',
      updates: {wom},
    );

    if (addedOnNormalizedRows > 0) {
      await logRepair(
        'Repaired legacy WOM rows for addedOn: normalized=$addedOnNormalizedRows',
      );
    }

    final spentNormalizedRows = await customUpdate(
      'UPDATE ${wom.actualTableName} SET '
      '${wom.spent.name} = COALESCE(${wom.spent.name}, 1) '
      'WHERE ${wom.spent.name} IS NULL',
      updates: {wom},
    );

    if (spentNormalizedRows > 0) {
      await logRepair(
        'Repaired legacy WOM rows for spent: normalized=$spentNormalizedRows',
      );
    }

    final latitudeNormalizedRows = await customUpdate(
      'UPDATE ${wom.actualTableName} SET '
      '${wom.latitude.name} = COALESCE(${wom.latitude.name}, 0.0) '
      'WHERE ${wom.latitude.name} IS NULL',
      updates: {wom},
    );

    if (latitudeNormalizedRows > 0) {
      await logRepair(
        'Repaired legacy WOM rows for latitude: normalized=$latitudeNormalizedRows',
      );
    }

    final longitudeNormalizedRows = await customUpdate(
      'UPDATE ${wom.actualTableName} SET '
      '${wom.longitude.name} = COALESCE(${wom.longitude.name}, 0.0) '
      'WHERE ${wom.longitude.name} IS NULL',
      updates: {wom},
    );

    if (longitudeNormalizedRows > 0) {
      await logRepair(
        'Repaired legacy WOM rows for longitude: normalized=$longitudeNormalizedRows',
      );
    }
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
