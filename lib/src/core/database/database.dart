// To open the database, add these imports to the existing file defining the
// database class. They are used to open the database.
import 'dart:io';

import 'package:wom_pocket/src/core/database/challenge_dao.dart';
import 'package:wom_pocket/src/features/badge/data/badge.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:wom_pocket/src/core/database/aims_dao.dart';
import 'package:wom_pocket/src/core/database/badge_dao.dart';
import 'package:wom_pocket/src/core/database/tables.dart';
import 'package:wom_pocket/src/core/database/totems_dao.dart';
import 'package:wom_pocket/src/core/database/transactions_dao.dart';
import 'package:wom_pocket/src/core/database/woms_dao.dart';
import 'package:wom_pocket/src/core/my_logger.dart';

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
  int get schemaVersion => 11;

  Future<void> importWoms(
    TransactionsCompanion tx,
    List<WomRow> woms,
  ) {
    return transaction(() async {
      final idx = await transactionsDao.addTransaction(tx);
      final finalWoms = woms
          .map((e) => e.copyWith(transactionId: idx))
          .map((e) => e.toCompanion(true))
          .toList();
      await womsDao.addVouchers(finalWoms);
    });
  }

  Future<void> importTotems(
    List<TotemsCompanion> totems,
  ) {
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
        logger.w('from $from to $to');

        Sentry.addBreadcrumb(
          Breadcrumb(
            message: 'db migration from $from to $to',
          ),
        );

        await transaction(() async {
          if (from < 4) {
            await m.addColumn(wom, wom.donationId);
            await m.addColumn(wom, wom.spentOn);
            await m.renameColumn(wom, 'live', wom.spent);
            await m.renameColumn(wom, 'Timestamp', wom.addedOn);
            await m.addColumn(transactions, transactions.pin);
            await m.addColumn(transactions, transactions.link);
            await m.addColumn(transactions, transactions.deadline);
          }

          if (from < 5) {
            await m.createTable(totems);
          }

          if (from < 6) {
            if (!(await _columnExists(
              m,
              totems.actualTableName,
              totems.eventName.name,
            ))) {
              await m.addColumn(totems, totems.eventName);
            }

            if (!(await _columnExists(
              m,
              totems.actualTableName,
              totems.sessionName.name,
            ))) {
              await m.addColumn(totems, totems.sessionName);
            }

            if (!(await _columnExists(
              m,
              totems.actualTableName,
              totems.womLink.name,
            ))) {
              await m.addColumn(totems, totems.womLink);
            }

            if (!(await _columnExists(
              m,
              totems.actualTableName,
              totems.womPin.name,
            ))) {
              await m.addColumn(totems, totems.womPin);
            }

            if (!(await _columnExists(
              m,
              totems.actualTableName,
              totems.latitude.name,
            ))) {
              await m.addColumn(totems, totems.latitude);
            }

            if (!(await _columnExists(
              m,
              totems.actualTableName,
              totems.longitude.name,
            ))) {
              await m.addColumn(totems, totems.longitude);
            }

            if (!(await _columnExists(
              m,
              totems.actualTableName,
              totems.totemName.name,
            ))) {
              await m.addColumn(totems, totems.totemName);
            }

            if (!(await _columnExists(
              m,
              totems.actualTableName,
              totems.providerName.name,
            ))) {
              await m.addColumn(totems, totems.providerName);
            }

            if (!(await _columnExists(
              m,
              totems.actualTableName,
              totems.email.name,
            ))) {
              await m.addColumn(totems, totems.email);
            }

            if (!(await _columnExists(
              m,
              totems.actualTableName,
              totems.phoneNumber.name,
            ))) {
              await m.addColumn(totems, totems.phoneNumber);
            }

            if (!(await _columnExists(
              m,
              totems.actualTableName,
              totems.url.name,
            ))) {
              await m.addColumn(totems, totems.url);
            }
          }

          if (from < 7) {
            if (!(await _columnExists(
              m,
              totems.actualTableName,
              totems.image.name,
            ))) {
              await m.addColumn(totems, totems.image);
            }

            if (!(await _columnExists(
              m,
              totems.actualTableName,
              totems.notes.name,
            ))) {
              await m.addColumn(totems, totems.notes);
            }
          }

          if (from < 8) {
            await m.createTable(badges);
            await m.createTable(challenges);
          }

          if (from < 9) {
            if (!(await _columnExists(
              m,
              badges.actualTableName,
              badges.informationUri.name,
            ))) {
              await m.addColumn(badges, badges.informationUri);
            }
          }

          if (from < 11) {
            logger.i(
              'Applying migration for schema version 11: checking for missing tables/columns from v6, v7, v8, v9.',
            );
            if (!await _tableExists(m, badges.actualTableName)) {
              await m.createTable(badges);
              Sentry.addBreadcrumb(
                Breadcrumb(
                  message:
                      'Migration to 11: Created "badges" table as it was missing.',
                ),
              );
              logger.i(
                'Migration to 11: Created "badges" table as it was missing.',
              );
            }

            if (!await _tableExists(m, challenges.actualTableName)) {
              await m.createTable(challenges);
              Sentry.addBreadcrumb(
                Breadcrumb(
                  message:
                      'Migration to 11: Created "challenges" table as it was missing.',
                ),
              );
              logger.i(
                'Migration to 11: Created "challenges" table as it was missing.',
              );
            }

            if (!await _tableExists(m, totems.actualTableName)) {
              await m.createTable(totems);
              Sentry.addBreadcrumb(
                Breadcrumb(
                  message:
                      'Migration to 11: Created "totems" table as it was missing.',
                ),
              );
              logger.i(
                'Migration to 11: Created "totems" table as it was missing.',
              );
            }

            await _checkTotemTables(m);

            if (await _tableExists(m, badges.actualTableName)) {
              if (!await _columnExists(
                m,
                badges.actualTableName,
                badges.informationUri.name,
              )) {
                await m.addColumn(badges, badges.informationUri);
                Sentry.addBreadcrumb(
                  Breadcrumb(
                    message:
                        'Migration to 11: Created "informationUri" table as it was missing.',
                  ),
                );
                logger.i(
                  'Migration to 11: Added "informationUri" column to "badges" table as it was missing.',
                );
              }
            }
          }
        });
      },
      beforeOpen: (details) async {
        final message =
            'db beforeOpen ${details.versionBefore} => ${details.versionNow}';
        logger.i(message);
        Sentry.addBreadcrumb(
          Breadcrumb(
            message: message,
          ),
        );
        if (kDebugMode) {
          // This check pulls in a fair amount of code that's not needed
          // anywhere else, so we recommend only doing it in debug builds.
          // await validateDatabaseSchema();
        }

        return Future.value();
      },
    );
  }

  _checkTotemTables(Migrator m) async {
    final columns = [
      totems.eventName,
      totems.sessionName,
      totems.womLink,
      totems.womPin,
      totems.latitude,
      totems.longitude,
      totems.totemName,
      totems.providerName,
      totems.email,
      totems.phoneNumber,
      totems.url,
      totems.notes,
      totems.image,
    ];

    if (await _tableExists(m, totems.actualTableName)) {
      for (final column in columns) {
        if (!await _columnExists(
          m,
          totems.actualTableName,
          column.name,
        )) {
          await m.addColumn(totems, column);
          Sentry.addBreadcrumb(
            Breadcrumb(
              message:
                  'Migration to 10: Added "${column.name}" column to "totems" table as it was missing.',
            ),
          );
          logger.i(
            'Migration to 10: Added "${column.name}" column to "totems" table as it was missing.',
          );
        }
      }
    }
  }

  Future<bool> _tableExists(Migrator m, String tableName) async {
    final result = await m.database.customSelect(
      "SELECT name FROM sqlite_master WHERE type='table' AND name = ?",
      variables: [Variable.withString(tableName)],
    ).getSingleOrNull();
    return result != null;
  }

  Future<bool> _columnExists(
    Migrator m,
    String tableName,
    String columnName,
  ) async {
    final List<QueryRow> columns =
        await m.database.customSelect("PRAGMA table_info('$tableName')").get();
    return columns.any((row) => row.read<String>('name') == columnName);
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
