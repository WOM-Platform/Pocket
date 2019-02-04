import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:pocket/app.dart';
import 'package:pocket/constants.dart';
import 'package:pocket/src/blocs/bloc_provider.dart';
import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:pocket/src/db/transaction_db.dart';
import 'package:pocket/src/models/deep_link_model.dart';
import 'package:pocket/src/models/transaction_model.dart';
import 'package:pocket/src/models/voucher_model.dart';
import 'package:pocket/src/models/wom_model.dart';
import 'package:pocket/src/db/wom_db.dart';
import 'package:pointycastle/block/aes_fast.dart';
import 'package:pointycastle/block/modes/cbc.dart';
import 'package:pointycastle/block/modes/cfb.dart';
import 'package:pointycastle/digests/sha256.dart';
import 'package:pointycastle/key_derivators/pbkdf2.dart';
import 'package:pointycastle/macs/hmac.dart';
import 'package:pointycastle/paddings/pkcs7.dart';
import 'package:pointycastle/random/fortuna_random.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simple_rsa/simple_rsa.dart';
import 'dart:convert';
import 'package:convert/convert.dart' as convert;
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:latlong/latlong.dart' as latLong;
import 'package:pointycastle/pointycastle.dart';

class AcceptCreditsBloc extends BlocBase {
  BehaviorSubject<String> _result = BehaviorSubject<String>();

  Observable<String> get result => _result.stream;

  Function get addResult => _result.sink.add;

  BehaviorSubject<VoucherModel> _voucher = BehaviorSubject<VoucherModel>();

  Observable<VoucherModel> get voucher => _voucher.stream;

  Function get addVoucher => _voucher.sink.add;

  DeepLinkModel deepLinkModel;
  TransactionDB transactionsDB;
  final String pin;

  AcceptCreditsBloc(this.deepLinkModel, this.pin) {
    transactionsDB = TransactionDB.get();

    if (fakeModeVar) {
      getFakeWoms().then((list) {
        saveWoms(list);
      });
    } else {
      getWoms(deepLinkModel.otc);
    }
  }

//
//  Uint8List encrypt(String data, String token, String cipherIV) {
//    var key = utf8.encode(token);
//    var iv = utf8.encode(cipherIV);
//    CipherParameters params = new PaddedBlockCipherParameters(new ParametersWithIV(new KeyParameter(key), iv), null);
//
//    PaddedBlockCipherImpl cipherImpl = new PaddedBlockCipherImpl(new PKCS7Padding(), new CBCBlockCipher(new AESFastEngine()));
//    cipherImpl.init(true, params);
//    return cipherImpl.process(utf8.encode(data));
//  }
//
//  String decrypt(String data, String token, String cipherIV) {
//    var key = utf8.encode(token);
//    var iv = utf8.encode(cipherIV);
//    CipherParameters params = new PaddedBlockCipherParameters(new ParametersWithIV(new KeyParameter(key), iv), null);
//
//    PaddedBlockCipherImpl cipherImpl = new PaddedBlockCipherImpl(new PKCS7Padding(), new CBCBlockCipher(new AESFastEngine()));
//    cipherImpl.init(false, params);
//
//    return base64Encode(cipherImpl.process(utf8.encode(data)));
//  }

//  init() async {
//    if (deepLinkModel == null) {
//      try {
//        final scanResult = await scanQRCode();
//        deepLinkModel = DeepLinkModel.fromUri(Uri.parse(scanResult));
//        getWoms(deepLinkModel.otc);
//      } catch (ex) {
//        _voucher.addError(ex);
//      }
//    } else {
//      getWoms(deepLinkModel.otc);
//    }
//  }

  Future<String> scanQRCode() async {
    try {
      return await BarcodeScanner.scan();
    } on PlatformException catch (ex) {
      if (ex == BarcodeScanner.CameraAccessDenied) {
        throw Exception(ex);
      } else {
        throw Exception("unknow error");
      }
    } on FormatException {
      throw FormatException(
          "Hai premuto il pulsante back prima di acquisire il dato");
    } catch (ex) {
      throw Exception(ex);
    }
  }

  Future<List<WomModel>> getFakeWoms() async {
    print("STAR GET FAKE WOM");
    List<dynamic> newData = json.decode(fakeData.toString());
    List<WomModel> womsList = [];
    for (int i = 0; i < newData.length; i++) {
      final point = newData[i];
      final wom = WomModel(
        location: latLong.LatLng(point["LATITUDE"], point["LONGITUDE"]),
        secret: "secret",
        source: "SmartRoadSense",
        timestamp: DateTime.now().millisecondsSinceEpoch,
        id: i,
        live: WomStatus.ON,
      );
      womsList.add(wom);
    }
    print("EXTRACT COMPLETE");

    return womsList;
  }

  getWoms(String otc) async {
    try {
      final list = await downloadWoms(otc);
      saveWoms(list);
    } catch (ex) {
      _voucher.addError(ex.toString());
    }
  }

  saveWoms(List list) async {
    final womDB = WomDB.get();
    for (int i = 0; i < list.length; i++) {
      await womDB.updateWom(list[i]);
    }
//    list.forEach((wom) async {
//
//    });

    TransactionModel tx = TransactionModel(
//        id: "id212345",
      date: DateTime.now(),
      country: "italy",
      size: list.length,
      transactionType: TransactionType.VOUCHERS,
      shop: "",
    );
    transactionsDB.updateTransaction(tx);

    //print at user result
    VoucherModel v = VoucherModel(
      id: "id212345",
      date: DateTime.now(),
      country: "italy",
      type: "SmartRoadSense",
      size: list.length,
    );
    addVoucher(v);
  }

  Future<List<WomModel>> downloadWoms(String otc) async {
    print("START DOWNLOAD WOMS");

    try {
//      final String key = '603d57d77811f352c073b6108d72d9810a30914dff4';
//      final key = generateAsBase64String(32);
//      final key = await  generateAESKey();
//      print("aes key native : " + aaaaa + aaaaa.length.toString());
      final key = '5wK5cuDz3oyEV04TVaodjnUR0i8RT9FQmOQk2M3fDD8=';
      print("key" + key.length.toString());
      print("key: " + key.toString());
      print("pin: " + pin);
      print("otc: " + otc);

//      var encoder = new Base64Encoder();
//      final k = encoder.convert(key);
//      print(k);

      //create json map
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

      //POST
      //var url = "http://wom.social/api/v1/voucher/redeem";

      final resp = await http.post(
        URL_REDEEM,
        body: json.encode(payload),
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
      );

//      if(resp.statusCode == 200){
      final jsonResponse = json.decode(resp.body);

      final encryptedPayload = jsonResponse["payload"];

      print(encryptedPayload);

//      final Uint8List iv = key.sublist(0, 16);

//      var payloadEncryptedBytes = base64Decode(encryptedPayload);

      final decryptedPayload = await decryptAES(encryptedPayload, key);

//      final encrypter = new Encrypter(new AES(key));
//      final decryptedPayload = encrypter.decrypt(encryptedPayload);

//      final key64 = Key.fromBase64(key);
//      final iv = IV.fromBase64('');
//      final encrypter = Encrypter(AES(key64, iv, mode: AESMode.cbc));
//      final encrypted = Encrypted.fromBase64(encryptedPayload);
//      final decryptedPayload = encrypter.decrypt(encrypted);

//      var keyBytes = base64Decode(key.toStirng());
//
//      CipherParameters params = new PaddedBlockCipherParameters(
//          new ParametersWithIV(new KeyParameter(key), iv), null);
//      BlockCipher decryptionCipher = new PaddedBlockCipher("AES/CBC/PKCS7");
//      decryptionCipher.init(false, params);
//      String decryptedPayload =
//          base64Encode(decryptionCipher.process(payloadEncryptedBytes));

//      final decryptedPayload = decrypt(encryptedPayload, key);

//      final decryptedPayload =
//          await decryptStringWithPublicKey(encryptedPayload, "", PUBLIC_KEY);
      print(decryptedPayload);
      final jsonDecrypted = json.decode(decryptedPayload);

      print(jsonDecrypted);

      final ResultResponse result = ResultResponse.fromJson(jsonDecrypted);

      print(result?.woms?.length?.toString());

      return result.woms;
//      }else{
//        throw Exception("Response status: " + resp.statusCode.toString());
//      }

    } catch (e) {
      throw Exception(e);
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

    print(buffer.length.toString());
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

  @override
  void dispose() {
    _result.close();
    _voucher.close();
  }
}

class ResultResponse {
  List<WomModel> woms;

  ResultResponse({this.woms});

  ResultResponse.fromJson(Map<String, dynamic> json) {
    if (json['Vouchers'] != null) {
      woms = new List<WomModel>();
      json['Vouchers'].forEach((v) {
        woms.add(new WomModel.fromMap(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.woms != null) {
      data['Vouchers'] = this.woms.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// AES key size
const KEY_SIZE = 32; // 32 byte key for AES-256
const ITERATION_COUNT = 1000;

class AesHelper {
  static const CBC_MODE = 'CBC';
  static const CFB_MODE = 'CFB';

  static Uint8List deriveKey(dynamic password,
      {String salt = '',
      int iterationCount = ITERATION_COUNT,
      int derivedKeyLength = KEY_SIZE}) {
    if (password == null || password.isEmpty) {
      throw new ArgumentError('password must not be empty');
    }

    if (password is String) {
      password = createUint8ListFromString(password);
    }

    Uint8List saltBytes = createUint8ListFromString(salt);
    Pbkdf2Parameters params =
        new Pbkdf2Parameters(saltBytes, iterationCount, derivedKeyLength);
    KeyDerivator keyDerivator =
        new PBKDF2KeyDerivator(new HMac(new SHA256Digest(), 64));
    keyDerivator.init(params);

    return keyDerivator.process(password);
  }

  static Uint8List pad(Uint8List src, int blockSize) {
    var pad = new PKCS7Padding();
    pad.init(null);

    int padLength = blockSize - (src.length % blockSize);
    var out = new Uint8List(src.length + padLength)..setAll(0, src);
    pad.addPadding(out, src.length);

    return out;
  }

  static Uint8List unpad(Uint8List src) {
    var pad = new PKCS7Padding();
    pad.init(null);

    int padLength = pad.padCount(src);
    int len = src.length - padLength;

    return new Uint8List(len)..setRange(0, len, src);
  }

  static String encrypt(String password, String plaintext,
      {String mode = CBC_MODE}) {
    Uint8List derivedKey = deriveKey(password);
    KeyParameter keyParam = new KeyParameter(derivedKey);
    BlockCipher aes = new AESFastEngine();

    var rnd = FortunaRandom();
    rnd.seed(keyParam);
    Uint8List iv = rnd.nextBytes(aes.blockSize);

    BlockCipher cipher;
    ParametersWithIV params = new ParametersWithIV(keyParam, iv);
    switch (mode) {
      case CBC_MODE:
        cipher = new CBCBlockCipher(aes);
        break;
      case CFB_MODE:
        cipher = new CFBBlockCipher(aes, aes.blockSize);
        break;
      default:
        throw new ArgumentError('incorrect value of the "mode" parameter');
        break;
    }
    cipher.init(true, params);

    Uint8List textBytes = createUint8ListFromString(plaintext);
    Uint8List paddedText = pad(textBytes, aes.blockSize);
    Uint8List cipherBytes = _processBlocks(cipher, paddedText);
    Uint8List cipherIvBytes = new Uint8List(cipherBytes.length + iv.length)
      ..setAll(0, iv)
      ..setAll(iv.length, cipherBytes);

    return base64.encode(cipherIvBytes);
  }

  static String decrypt(String password, String ciphertext,
      {String mode = CBC_MODE}) {
    Uint8List derivedKey = deriveKey(password);
    KeyParameter keyParam = new KeyParameter(derivedKey);
    BlockCipher aes = new AESFastEngine();

    Uint8List cipherIvBytes = base64.decode(ciphertext);
    Uint8List iv = new Uint8List(aes.blockSize)
      ..setRange(0, aes.blockSize, cipherIvBytes);

    BlockCipher cipher;
    ParametersWithIV params = new ParametersWithIV(keyParam, iv);
    switch (mode) {
      case CBC_MODE:
        cipher = new CBCBlockCipher(aes);
        break;
      case CFB_MODE:
        cipher = new CFBBlockCipher(aes, aes.blockSize);
        break;
      default:
        throw new ArgumentError('incorrect value of the "mode" parameter');
        break;
    }
    cipher.init(false, params);

    int cipherLen = cipherIvBytes.length - aes.blockSize;
    Uint8List cipherBytes = new Uint8List(cipherLen)
      ..setRange(0, cipherLen, cipherIvBytes, aes.blockSize);
    Uint8List paddedText = _processBlocks(cipher, cipherBytes);
    Uint8List textBytes = unpad(paddedText);

    return new String.fromCharCodes(textBytes);
  }

  static Uint8List _processBlocks(BlockCipher cipher, Uint8List inp) {
    var out = new Uint8List(inp.lengthInBytes);

    for (var offset = 0; offset < inp.lengthInBytes;) {
      var len = cipher.processBlock(inp, offset, out, offset);
      offset += len;
    }

    return out;
  }
}

Uint8List createUint8ListFromString(String s) {
  var ret = new Uint8List(s.length);
  for (var i = 0; i < s.length; i++) {
    ret[i] = s.codeUnitAt(i);
  }
  return ret;
}

Uint8List createUint8ListFromHexString(String hex) {
  var result = new Uint8List(hex.length ~/ 2);
  for (var i = 0; i < hex.length; i += 2) {
    var num = hex.substring(i, i + 2);
    var byte = int.parse(num, radix: 16);
    result[i ~/ 2] = byte;
  }
  return result;
}

Uint8List createUint8ListFromSequentialNumbers(int len) {
  var ret = new Uint8List(len);
  for (var i = 0; i < len; i++) {
    ret[i] = i;
  }
  return ret;
}

String formatBytesAsHexString(Uint8List bytes) {
  var result = new StringBuffer();
  for (var i = 0; i < bytes.lengthInBytes; i++) {
    var part = bytes[i];
    result.write('${part < 16 ? '0' : ''}${part.toRadixString(16)}');
  }
  return result.toString();
}

List<int> decodePEM(String pem) {
  var startsWith = [
    "-----BEGIN PUBLIC KEY-----",
    "-----BEGIN PRIVATE KEY-----",
    "-----BEGIN ENCRYPTED MESSAGE-----",
    "-----BEGIN PGP PUBLIC KEY BLOCK-----\r\nVersion: React-Native-OpenPGP.js 0.1\r\nComment: http://openpgpjs.org\r\n\r\n",
    "-----BEGIN PGP PRIVATE KEY BLOCK-----\r\nVersion: React-Native-OpenPGP.js 0.1\r\nComment: http://openpgpjs.org\r\n\r\n",
  ];
  var endsWith = [
    "-----END PUBLIC KEY-----",
    "-----END PRIVATE KEY-----",
    "-----END ENCRYPTED MESSAGE-----",
    "-----END PGP PUBLIC KEY BLOCK-----",
    "-----END PGP PRIVATE KEY BLOCK-----",
  ];
  bool isOpenPgp = pem.indexOf('BEGIN PGP') != -1;

  for (var s in startsWith) {
    if (pem.startsWith(s)) {
      pem = pem.substring(s.length);
    }
  }

  for (var s in endsWith) {
    if (pem.endsWith(s)) {
      pem = pem.substring(0, pem.length - s.length);
    }
  }

  if (isOpenPgp) {
    var index = pem.indexOf('\r\n');
    pem = pem.substring(0, index);
  }

  pem = pem.replaceAll('\n', '');
  pem = pem.replaceAll('\r', '');

  return base64.decode(pem);
}

List<int> decodeHex(String hex) {
  hex = hex
      .replaceAll(':', '')
      .replaceAll('\n', '')
      .replaceAll('\r', '')
      .replaceAll('\t', '');

  return convert.hex.decode(hex);
}
