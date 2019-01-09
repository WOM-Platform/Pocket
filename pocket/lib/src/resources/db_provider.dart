//import 'dart:io';
//import 'package:borsellino/src/models/voucher_model.dart';
//import 'package:sqflite/sqflite.dart';
//import 'package:borsellino/src/resources/repository.dart';
//import 'package:path/path.dart';
//import 'package:path_provider/path_provider.dart';
//
//final dbProvider = DbProvider();
//
//class DbProvider implements Source, Cache {
//  Database db;
//
//  NewsDbProvider() {
//    init();
//  }
//
//  void init() async {
//    Directory documentsDirectory = await getApplicationDocumentsDirectory();
//    final path = join(documentsDirectory.path, "vouchers.db");
//    db = await openDatabase(
//      path,
//      version: 1,
//      onCreate: (Database newDb, int version) {
//        newDb.execute("""
//          CREATE TABLE Vouchers
//            (
//              id INTEGER PRIMARY KEY,
//              type TEXT,
//              by TEXT,
//              time INTEGER,
//              text TEXT,
//              parent INTEGER,
//              kids BLOB,
//              dead INTEGER,
//              deleted INTEGER,
//              url TEXT,
//              score INTEGER,
//              title TEXT,
//              descendants INTEGER
//            )
//        """);
//      },
//    );
//  }
//
//  Future<VoucherModel> fetchItem(int id) async {
//    final maps = await db.query(
//      "Vouchers",
//      columns: null,
//      where: "id = ?",
//      whereArgs: [id],
//    );
//
//    if (maps.length > 0) {
//      return VoucherModel.fromDb(maps.first);
//    }
//
//    return null;
//  }
//
//  Future<int> addItem(VoucherModel item) {
//    return db.insert(
//      "Items",
//      item.toMap(),
//      conflictAlgorithm: ConflictAlgorithm.ignore,
//    );
//  }
//
//  Future<int> clear() {
//    return db.delete("Items");
//  }
//
//  @override
//  Future<List<int>> fetchTopIds() {
//    // TODO: implement fetchTopIds
//  }
//}
//
//
