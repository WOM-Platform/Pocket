import 'dart:convert';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';

class CryptographyHelper {

 static String decryptAES(String encryptedString, String keyString) {
    try {
      var decoder = new Base64Decoder();
      final Uint8List bytes = decoder.convert(encryptedString);
      final Key k = Key.fromBase64(keyString);
      final IV iv = IV(bytes.sublist(0, 16));
      final encrypter = Encrypter(AES(k, iv, mode: AESMode.cbc));
      final encrypted = Encrypted(bytes.sublist(16));
      final decryptedString = encrypter.decrypt(encrypted);
      return decryptedString;
    } catch (ex) {
      throw Exception(ex);
    }
  }
}
