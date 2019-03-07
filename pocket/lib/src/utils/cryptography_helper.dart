import 'dart:convert';
import 'dart:math';
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

 /// Generates a random salt of [length] bytes from a cryptographically secure random number generator.
 ///
 /// Each element of this list is a byte.
 static Uint8List generate(int length) {
   var buffer = new Uint8List(length);
   var rng = new Random.secure();
   for (var i = 0; i < length; i++) {
     buffer[i] = rng.nextInt(256);
   }
   return buffer;
 }

 /// Generates a random salt of [length] bytes from a cryptographically secure random number generator and encodes it to Base64.
 ///
 /// [length] is the number of bytes generated, not the [length] of the base64 encoded string returned. Decoding
 /// the base64 encoded string will yield [length] number of bytes.
 static String generateAsBase64String(int length) {
   var encoder = new Base64Encoder();
   return encoder.convert(generate(length));
 }

}
