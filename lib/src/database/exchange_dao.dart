// import 'package:drift/drift.dart';
// import 'package:wom_pocket/src/database/database.dart';
// import 'package:wom_pocket/src/database/tables.dart';
// import 'package:wom_pocket/src/models/wom_model.dart';
// import 'package:wom_pocket/src/my_logger.dart';
//
// part 'exchange_dao.g.dart';
//
// // the _TodosDaoMixin will be created by drift. It contains all the necessary
// // fields for the tables. The <MyDatabase> type annotation is the database class
// // that should use this dao.
// @DriftAccessor(tables: [WomExchanges])
// class ExchangeDao extends DatabaseAccessor<MyDatabase> with _$ExchangeDaoMixin {
//   // this constructor is required so that the main database can create an instance
//   // of this object.
//   ExchangeDao(MyDatabase db) : super(db);
//
//   Future<List<WomExchange>> get getExchanges {
//     return select(womExchanges).get();
//   }
//
//   // Future<AimRow> getAim(String aimCode) {
//   //   return (select(aims)..where((tbl) => tbl.code.equals(aimCode))).getSingle();
//   // }
//   //
//   // // returns the generated id
//   Future<void> addExchange(WomExchangesCompanion entry) async {
//     await batch((batch) {
//       batch.insert(womExchanges, entry, mode: InsertMode.insertOrReplace);
//     });
//   }
//
//   // Future<void> deleteTable() async {
//   //   final deleted = await delete(aims).go();
//   //   logger.i('Deleted $deleted rows');
//   // }
// }
