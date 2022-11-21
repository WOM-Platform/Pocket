import 'package:drift/drift.dart';
import 'package:wom_pocket/src/database/database.dart';
import 'package:wom_pocket/src/database/tables.dart';
import 'package:wom_pocket/src/models/wom_model.dart';

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
