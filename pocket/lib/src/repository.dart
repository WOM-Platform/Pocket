import 'package:pocket/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';
import 'package:pocket/src/models/wom_model.dart';
import 'package:simple_rsa/simple_rsa.dart';
import 'dart:convert';

class Repository {


  Future<List<WomModel>> downloadWoms(
      String otc, String pin, String key) async {
    print("START DOWNLOAD WOMS");

    print("key" + key.length.toString());
    print("key: " + key.toString());
    print("pin: " + pin);
    print("otc: " + otc);

    try {
      final Map<String, String> map = {
        "Otc": otc,
        "Password": pin,
        "SessionKey": key,
      };

      //encode map to json string
      final mapEncoded = json.encode(map);

      //encrypt otc map with public_key
      final otcEncrypted = await encryptString(mapEncoded, PUBLIC_KEY);

      //create payload with endrypted otc json
      final Map<String, String> payload = {"Payload": otcEncrypted};

      final resp = await http.post(
        URL_REDEEM,
        body: json.encode(payload),
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
      );

      if (resp.statusCode == 200) {
        final jsonResponse = json.decode(resp.body);

        final encryptedPayload = jsonResponse["payload"];

        return encryptedPayload;
      } else {
        throw Exception("Response status: " + resp.statusCode.toString());
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
