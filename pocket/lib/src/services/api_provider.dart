import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pocket/constants.dart';
import 'dart:convert';

class ApiProvider{

  //TODO do refactoring here
  static Future<String> redeemWoms(Map<String, String> map)async{
    final resp = await http.post(
      URL_REDEEM,
      body: json.encode(map),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    if(resp.statusCode == 200){
      return resp.body;
    }
    final Map<String, dynamic> jsonError = json.decode(resp.body);
    throw Exception(jsonError['title']);
  }

  static Future<String> confirmPayments(Map<String, String> map)async{
    final resp = await http.post(
      URL_CONFIRM,
      body: json.encode(map),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    if(resp.statusCode == 200){
      return resp.body;
    }
    final Map<String, dynamic> jsonError = json.decode(resp.body);
    throw Exception(jsonError['title']);
  }

  static Future<String> getInfoPayments(Map<String, String> map)async{
    final resp = await http.post(
      URL_INFO_PAY,
      body: json.encode(map),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    if(resp.statusCode == 200){
      return resp.body;
    }
    final Map<String, dynamic> jsonError = json.decode(resp.body);
    throw Exception(jsonError['title']);
  }

  static Future<String> getAims(Map<String, String> map)async{
//    return await genericPostRequest(URL_AIMS, map);
    final resp = await http.post(
      URL_AIMS,
      body: json.encode(map),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    if(resp.statusCode == 200){
      return resp.body;
    }
    final Map<String, dynamic> jsonError = json.decode(resp.body);
    throw Exception(jsonError['title']);
  }
//
//  static genericPostRequest(String url, Map<String, String> map) async{
//
//  }
}