import 'package:flutter_test/flutter_test.dart';
import 'package:wom_pocket/src/core/utils/utils.dart';
import 'dart:convert';

import 'package:wom_pocket/src/core/models/totem_data.dart';
main() {
  test('encrypt', () {
    final now = DateTime.now().millisecondsSinceEpoch;
    final totemId = 'totemId';
    final eventId = 'eventId';
    final params = '$eventId/$totemId?timestamp=$now&latitude=90.0&longitude=180.0';
    final encrypted = aesEncrypt(params);
    final decrypted = aesDecrypt(encrypted);
    expect(params, decrypted);
  });

  test('connection', () {
    final now = DateTime.now().millisecondsSinceEpoch;
    final totemId = '2pWabjiM1wcim2cDICb8';
    final params = '$totemId?timestamp=$now&latitude=90.0&longitude=180.0';
    // final bytes = utf8.encode(params);
    // final base64Str = base64.encode(bytes);
    final encrypted = aesEncrypt(params);
    final decoded = Uri.encodeComponent(encrypted);
    final link = '$connectionBaseUrl/$decoded';
    print(link);


    final data = createTotemLinkFromConnection(link);

    final decrypted = '$connectionBaseUrl/$params';
    expect(Uri.tryParse(decrypted)?.toString(), data?.toLink);
  });
}