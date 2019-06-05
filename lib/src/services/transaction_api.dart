import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pocket/constants.dart';
import 'dart:convert';

class TransactionApi {

  Future<String> redeemWoms(Map<String, String> map) async {
    try {
      return await responseBodyFromHttpPostRequest(URL_REDEEM, map);
    } catch (ex) {
      throw Exception(ex.toString());
    }
  }

  Future<String> confirmPayments(Map<String, String> map) async {
    try {
      return await responseBodyFromHttpPostRequest(URL_CONFIRM, map);
    } catch (ex) {
      throw Exception(ex.toString());
    }
  }

  Future<String> getInfoPayments(Map<String, String> map) async {
    try {
      return await responseBodyFromHttpPostRequest(URL_INFO_PAY, map);
    } catch (ex) {
      throw Exception(ex.toString());
    }
  }

  Future<String> responseBodyFromHttpPostRequest(
      String url, Map<String, String> map) async {
    final resp = await http.post(
      url,
      body: json.encode(map),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    print(resp.body);
    if (resp.statusCode == 200) {
      return resp.body;
    }
    final Map<String, dynamic> jsonError = json.decode(resp.body);
    throw Exception(jsonError['title']);
  }
}
