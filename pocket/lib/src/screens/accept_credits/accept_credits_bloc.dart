import 'dart:math';
import 'dart:typed_data';
import 'package:pocket/constants.dart';
import 'package:pocket/src/blocs/bloc_provider.dart';
import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:pocket/src/cryptography_helper.dart';
import 'package:pocket/src/db/transaction_db.dart';
import 'package:pocket/src/models/deep_link_model.dart';
import 'package:pocket/src/models/response_redeem.dart';
import 'package:pocket/src/models/transaction_model.dart';
import 'package:pocket/src/models/voucher_model.dart';
import 'package:pocket/src/models/wom_model.dart';
import 'package:pocket/src/db/wom_db.dart';
import 'package:pocket/src/services/api_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simple_rsa/simple_rsa.dart';
import 'dart:convert';
import 'package:flutter/services.dart';


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
    getWoms(deepLinkModel.otc);
  }

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

//  Future<List<WomModel>> getFakeWoms() async {
//    print("STAR GET FAKE WOM");
//    List<dynamic> newData = json.decode(fakeData.toString());
//    List<WomModel> womsList = [];
//    for (int i = 0; i < newData.length; i++) {
//      final point = newData[i];
//      final wom = WomModel(
//        location: latLong.LatLng(point["LATITUDE"], point["LONGITUDE"]),
//        secret: "secret",
//        source: "SmartRoadSense",
//        timestamp: DateTime.now().millisecondsSinceEpoch,
//        id: i,
//        live: WomStatus.ON,
//      );
//      womsList.add(wom);
//    }
//    print("EXTRACT COMPLETE");
//    return womsList;
//  }

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
      //generate temparary key from this transaction
      final key = generateAsBase64String(32);

      print("key: " + key.toString());
      print("key length" + key.length.toString());
      print("pin: " + pin);
      print("otc: " + otc);

      //create json map with parameters
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

      //get response body from HTTP POST method
      final responseBody = await ApiProvider.redeemWoms(payload);

      //decode response body into json
      final jsonResponse = json.decode(responseBody);

      //get encrypted payload from json
      final encryptedPayload = jsonResponse["payload"];

      //decrypt payload with AES CBC
      final decryptedPayload =
          CryptographyHelper.decryptAES(encryptedPayload, key);

      //decode decrypted paylod into json
      final jsonDecrypted = json.decode(decryptedPayload);

      //create object from json payload
      final ResponseRedeem result = ResponseRedeem.fromJson(jsonDecrypted);
      print(result?.woms?.length?.toString());

      //return woms list
      return result.woms;
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
