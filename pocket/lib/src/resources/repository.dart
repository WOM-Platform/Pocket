//import 'package:borsellino/src/models/voucher_model.dart';
//import 'package:borsellino/src/resources/api_provider.dart';
//import 'package:borsellino/src/resources/db_provider.dart';
//
//class Repository {
//  List<Source> sources = <Source>[
//    dbProvider,
//    ApiProvider(),
//  ];
//  List<Cache> caches = <Cache>[
//    dbProvider,
//  ];
//
//  // Iterate over sources when dbprovider
//  // get fetchTopIds implemented
//  Future<List<int>> fetchTopIds() {
//    return sources[1].fetchTopIds();
//  }
//
//  Future<VoucherModel> fetchItem(int id) async {
//    VoucherModel item;
//    var source;
//
//    for (source in sources) {
//      item = await source.fetchItem(id);
//      if (item != null) {
//        break;
//      }
//    }
//
//    for (var cache in caches) {
//      if (cache != source) {
//        cache.addItem(item);
//      }
//    }
//
//    return item;
//  }
//
//  clearCache() async {
//    for (var cache in caches) {
//      await cache.clear();
//    }
//  }
//}
//
//abstract class Source {
//  Future<List<int>> fetchTopIds();
//  Future<VoucherModel> fetchItem(int id);
//}
//
//abstract class Cache {
//  Future<int> addItem(VoucherModel item);
//  Future<int> clear();
//}