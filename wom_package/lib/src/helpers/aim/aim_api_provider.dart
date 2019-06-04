import 'dart:io';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wom_package/wom_package.dart';

class AimApiProvider {
  //TODO HTTP GET LAST CHANGE
  checkUpdate() async {
    print("AimApiProvider: checkUpdate()");
    try{
      return await getAims();
    }catch(ex){
      return Future.value(null);
    }
  }

  Future<List<Aim>> getAims() async {
    print("AimApiProvider: getAims()");
    final url = "http://wom.social/api/v1/aims?format=flat";
    final resp = await http.get(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    if (resp.statusCode == 200) {
      //decode response body into json
      final body = resp.body;
      final jsonResponse = json.decode(body);
      return jsonResponse.map<Aim>((a) => Aim.fromNetworkMap(a)).toList();
    }

    final Map<String, dynamic> jsonError = json.decode(resp.body);
    throw Exception(jsonError['title']);
  }
}
