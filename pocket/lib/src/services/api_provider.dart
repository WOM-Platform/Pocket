import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pocket/constants.dart';
import 'dart:convert';

class ApiProvider{

  static Future<String> redeemWoms(Map<String, String> map)async{
    final resp = await http.post(
      URL_REDEEM,
      body: json.encode(map),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    if(resp.statusCode == 200){
      return resp.body;
    }
    throw Exception("Status code is ${resp.statusCode}");
  }
}