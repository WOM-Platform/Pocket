import 'package:drift/drift.dart';

// this will generate a table called "woms" for us. The rows of that table will
// be represented by a class called "Todo".
@DataClassName('WomRow')
class Wom extends Table {
  TextColumn get id => text().named('Id')();
  TextColumn get sourceName => text().named('SourceName')();
  TextColumn get secret => text().named('Secret')();
  TextColumn get geohash => text().named('geohash')();
  TextColumn get aim => text().named('Aim')();
  TextColumn get sourceId => text().named('SourceId')();
  IntColumn get transactionId => integer().named('TransactionId')();
  IntColumn get timestamp => integer().named('Timestamp')();
  IntColumn get live => integer().named('live')();
  RealColumn get latitude => real().named('Latitude')();
  RealColumn get longitude => real().named('Longitude')();
}

@DataClassName('AimRow')
class Aims extends Table {
  IntColumn get id => integer()();
  TextColumn get code => text().named('code')();
  TextColumn get titles => text().named('titles')();
}

@DataClassName('MyTransaction')
class Transactions extends Table {
  IntColumn get id => integer().autoIncrement().named('Id')();
  TextColumn get source => text().named('source')();
  TextColumn get country => text().named('country')();
  TextColumn get aim => text().named('Aim')();
  IntColumn get timestamp => integer().named('Timestamp')();
  IntColumn get type => integer().named('type')();
  IntColumn get size => integer().named('size')();
  TextColumn get ackUrl => text().named('ackUrl').nullable()();
}

// This will make drift generate a class called "Category" to represent a row in
// this table. By default, "Categorie" would have been used because it only
//strips away the trailing "s" in the table name.
// @DataClassName('Category')
// class Categories extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   TextColumn get description => text()();
// }