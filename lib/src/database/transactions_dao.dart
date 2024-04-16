import 'dart:math';

import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:drift/drift.dart';
import 'package:wom_pocket/src/database/database.dart';
import 'package:wom_pocket/src/database/tables.dart';
import 'package:wom_pocket/src/my_logger.dart';

part 'transactions_dao.g.dart';

// the _TodosDaoMixin will be created by drift. It contains all the necessary
// fields for the tables. The <MyDatabase> type annotation is the database class
// that should use this dao.
@DriftAccessor(tables: [Transactions])
class TransactionsDao extends DatabaseAccessor<MyDatabase>
    with _$TransactionsDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  TransactionsDao(MyDatabase db) : super(db);

  // Get all woms not spent
  Future<List<MyTransaction>> get getTransactions {
    return (select(transactions)
          ..orderBy(
            [
              (tbl) => OrderingTerm(
                  expression: tbl.timestamp, mode: OrderingMode.desc),
            ],
          ))
        .get();
  }

  // Get all woms not spent
  Future<List<MyTransaction>> get getExchangeTransactions {
    return (select(transactions)
          ..where((tbl) => tbl.type
              .isBiggerOrEqualValue(TransactionType.EXCHANGE_EXPORT.index))
          ..orderBy(
            [
              (tbl) => OrderingTerm(
                    expression: tbl.timestamp,
                    mode: OrderingMode.desc,
                  ),
            ],
          ))
        .get();
  }

  // Get all woms not spent
  Future<int> getExchangeDailyCount() async {
    logger.i('[WomDb] getExchangeDailyCount');
    final now = DateTime.now();
    final midnight = now.midnight;

    final customQuery = 'SELECT size FROM Transactions '
        'WHERE type == ${TransactionType.EXCHANGE_EXPORT.index} '
        'AND timestamp >= ${midnight.millisecondsSinceEpoch} '
        'GROUP BY size;';
    final count = await customSelect(
      customQuery,
      readsFrom: {transactions},
    ).get();
    if (count.isEmpty) return 0;
    return min(
        count.fold<int>(
            0,
            (previousValue, element) =>
                previousValue + element.data['size'] as int),
        60);
  }

  // returns the generated id
  Future<void> addTransactions(List<TransactionsCompanion> entries) async {
    await batch((batch) {
      batch.insertAll(transactions, entries, mode: InsertMode.insertOrReplace);
    });
  }

  Future<int> addTransaction(TransactionsCompanion entry) async {
    return into(transactions).insert(entry);
  }
}

extension DateTimeX on DateTime {
  DateTime get midnight => this.copyWith(hour: 0, minute: 0, second: 0);
}
