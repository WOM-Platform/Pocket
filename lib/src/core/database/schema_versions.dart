import 'package:drift/drift.dart' as i1;
import 'package:drift/drift.dart'; // ignore_for_file: type=lint,unused_import
import 'package:drift/internal/versioned_schema.dart' as i0;
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:wom_pocket/src/core/database/database.dart';
import 'package:wom_pocket/src/core/my_logger.dart';

Future<void> runMigration(Migrator m, int from, int to, MyDatabase db) async {
  logger.w('from $from to $to');

  Sentry.addBreadcrumb(Breadcrumb(message: 'db migration from $from to $to'));

  if (from < 4) {
    await m.addColumn(db.wom, db.wom.donationId);
    await m.addColumn(db.wom, db.wom.spentOn);
    await m.renameColumn(db.wom, 'live', db.wom.spent);
    await m.renameColumn(db.wom, 'Timestamp', db.wom.addedOn);
    await m.addColumn(db.transactions, db.transactions.pin);
    await m.addColumn(db.transactions, db.transactions.link);
    await m.addColumn(db.transactions, db.transactions.deadline);
  }

  if (from < 5) {
    await m.createTable(db.totems);
  }

  if (from < 6) {
    if (!await _tableExists(m, db.totems.actualTableName)) {
      await m.createTable(db.totems);
      Sentry.addBreadcrumb(
        Breadcrumb(
          message:
              'Migration to $to: Created "totems" table as it was missing.',
        ),
      );
      logger.i('Migration to $to: Created "totems" table as it was missing.');
    }

    if (!(await _columnExists(
      m,
      db.totems.actualTableName,
      db.totems.eventName.name,
    ))) {
      await m.addColumn(db.totems, db.totems.eventName);
    }

    if (!(await _columnExists(
      m,
      db.totems.actualTableName,
      db.totems.sessionName.name,
    ))) {
      await m.addColumn(db.totems, db.totems.sessionName);
    }

    if (!(await _columnExists(
      m,
      db.totems.actualTableName,
      db.totems.womLink.name,
    ))) {
      await m.addColumn(db.totems, db.totems.womLink);
    }

    if (!(await _columnExists(
      m,
      db.totems.actualTableName,
      db.totems.womPin.name,
    ))) {
      await m.addColumn(db.totems, db.totems.womPin);
    }

    if (!(await _columnExists(
      m,
      db.totems.actualTableName,
      db.totems.latitude.name,
    ))) {
      await m.addColumn(db.totems, db.totems.latitude);
    }

    if (!(await _columnExists(
      m,
      db.totems.actualTableName,
      db.totems.longitude.name,
    ))) {
      await m.addColumn(db.totems, db.totems.longitude);
    }

    if (!(await _columnExists(
      m,
      db.totems.actualTableName,
      db.totems.totemName.name,
    ))) {
      await m.addColumn(db.totems, db.totems.totemName);
    }

    if (!(await _columnExists(
      m,
      db.totems.actualTableName,
      db.totems.providerName.name,
    ))) {
      await m.addColumn(db.totems, db.totems.providerName);
    }

    if (!(await _columnExists(
      m,
      db.totems.actualTableName,
      db.totems.email.name,
    ))) {
      await m.addColumn(db.totems, db.totems.email);
    }

    if (!(await _columnExists(
      m,
      db.totems.actualTableName,
      db.totems.phoneNumber.name,
    ))) {
      await m.addColumn(db.totems, db.totems.phoneNumber);
    }

    if (!(await _columnExists(
      m,
      db.totems.actualTableName,
      db.totems.url.name,
    ))) {
      await m.addColumn(db.totems, db.totems.url);
    }
  }

  if (from < 7) {
    if (!(await _columnExists(
      m,
      db.totems.actualTableName,
      db.totems.image.name,
    ))) {
      await m.addColumn(db.totems, db.totems.image);
    }

    if (!(await _columnExists(
      m,
      db.totems.actualTableName,
      db.totems.notes.name,
    ))) {
      await m.addColumn(db.totems, db.totems.notes);
    }
  }

  if (from < 8) {
    await m.createTable(db.badges);
    await m.createTable(db.challenges);
  }

  if (from < 9) {
    if (!(await _columnExists(
      m,
      db.badges.actualTableName,
      db.badges.informationUri.name,
    ))) {
      await m.addColumn(db.badges, db.badges.informationUri);
    }
  }

  if (from < 11) {
    logger.i(
      'Applying migration for schema version 11: checking for missing tables/columns from v6, v7, v8, v9.',
    );
    if (!await _tableExists(m, db.badges.actualTableName)) {
      await m.createTable(db.badges);
      Sentry.addBreadcrumb(
        Breadcrumb(
          message: 'Migration to 11: Created "badges" table as it was missing.',
        ),
      );
      logger.i('Migration to 11: Created "badges" table as it was missing.');
    }

    if (!await _tableExists(m, db.challenges.actualTableName)) {
      await m.createTable(db.challenges);
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

    if (!await _tableExists(m, db.totems.actualTableName)) {
      await m.createTable(db.totems);
      Sentry.addBreadcrumb(
        Breadcrumb(
          message: 'Migration to 11: Created "totems" table as it was missing.',
        ),
      );
      logger.i('Migration to 11: Created "totems" table as it was missing.');
    }

    await _checkTotemTables(m, db);

    if (await _tableExists(m, db.badges.actualTableName)) {
      if (!await _columnExists(
        m,
        db.badges.actualTableName,
        db.badges.informationUri.name,
      )) {
        await m.addColumn(db.badges, db.badges.informationUri);
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

  if (from < 12) {
    await m.addColumn(db.badges, db.badges.archived);
    await m.addColumn(db.badges, db.badges.archivedAt);
  }

  if (from < 13) {
    if (!await _columnExists(
      m,
      db.badges.actualTableName,
      db.badges.isPublic.name,
    )) {
      await m.addColumn(db.badges, db.badges.isPublic);
    }
  }
}

Future<void> _checkTotemTables(Migrator m, MyDatabase db) async {
  final columns = [
    db.totems.eventName,
    db.totems.sessionName,
    db.totems.womLink,
    db.totems.womPin,
    db.totems.latitude,
    db.totems.longitude,
    db.totems.totemName,
    db.totems.providerName,
    db.totems.email,
    db.totems.phoneNumber,
    db.totems.url,
    db.totems.notes,
    db.totems.image,
  ];

  if (await _tableExists(m, db.totems.actualTableName)) {
    for (final column in columns) {
      if (!await _columnExists(m, db.totems.actualTableName, column.name)) {
        await m.addColumn(db.totems, column);
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
  final result = await m.database
      .customSelect(
        "SELECT name FROM sqlite_master WHERE type='table' AND name = ?",
        variables: [Variable.withString(tableName)],
      )
      .getSingleOrNull();
  return result != null;
}

Future<bool> _columnExists(
  Migrator m,
  String tableName,
  String columnName,
) async {
  final List<QueryRow> columns = await m.database
      .customSelect("PRAGMA table_info('$tableName')")
      .get();
  return columns.any((row) => row.read<String>('name') == columnName);
}
