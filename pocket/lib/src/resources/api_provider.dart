//import 'dart:convert';
//import 'package:pocket/src/models/voucher_model.dart';
//import 'package:http/http.dart' show Client;
//import 'dart:async';
//import 'transaction_repository.dart';
//
//final _root = 'https://....';
//
//class ApiProvider implements Source {
//  Client client = Client();
//
//  Future<List<int>> fetchTopIds() async {
//    final response = await client.get('$_root/topstories.json');
//    final ids = json.decode(response.body);
//
//    return ids.cast<int>();
//  }
//
//  Future<VoucherModel> fetchItem(int id) async {
//    final response = await client.get('$_root/item/$id.json');
//    final parsedJson = json.decode(response.body);
//
//    return VoucherModel.fromJson(parsedJson);
//  }
//}
