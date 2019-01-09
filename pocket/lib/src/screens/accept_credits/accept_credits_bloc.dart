import 'dart:io';

import 'package:borsellino/src/blocs/bloc_provider.dart';
import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:borsellino/src/db/transaction_db.dart';
import 'package:borsellino/src/models/transaction_model.dart';
import 'package:borsellino/src/models/voucher_model.dart';
import 'package:borsellino/src/models/wom_model.dart';
import 'package:borsellino/src/db/wom_db.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simple_rsa/simple_rsa.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

const String PUBLIC_KEY =
    "MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA4gsUmdpM7LzpviixpBx8" +
        "0SO4t8NScnyzHngBSk9Vd9ECq8Q9Cc8b5KVQLTm+KVemzlFk4Cw1VwrwtiS8wZhJ" +
        "FrVmaViKiylExyvBc3sMBkavPlCaQXmc2thJge5uApn8rAX3U4tsh0JZPOgKr1KS" +
        "S9V3ZMKjWWxQ51ftQEXTphDy58LMQXmvxWe6cfHaNvXs8kyS6zAdO0Fri198eYxR" +
        "cX97ADtk6nTU8bBth3PTbsr3iyPyuH553nez4LejtmJDQYZvr0UaEGstiP5ZVuPD" +
        "sPndfJbjVLTRcEy50n8jBTDDLNebXBCbAEuScRTE1ja8wBXE8MRvGJIO7kpZTe7o" +
        "GPRfb7NjYb4+oY2VSrwbVKhsWvCkmFTXZzdGxcZM/upGTrVmegeBngU1TWcceS+7" +
        "TTe1pLTZfwzEVNs1GtYW1edC9ljw3UOYbhNEtlY6G+Zh7UEDSvuCk1k+tw9zicTA" +
        "k0MkIwMUurloQSobRxGVS0YFBiOQl11dAB8zGjWzjSvu1pezsCdeCZSTZNb5hF7p" +
        "vdC7s63YG9pztDVwCiYtWzns1OI15KTMYyoiShv4vSS1wou+O0VVN5Bmly/+4MWC" +
        "krXDLR4jFb4ioOuia4fJ7m9detyA9dHNpkAgwm0nNErGY1kaO9PqNUx0mDL+peve" +
        "SWThamgdlgxxOvr07dx+HEcCAwEAAQ==";

class AcceptCreditsBloc extends BlocBase {
  BehaviorSubject<String> _result = BehaviorSubject<String>();

  Observable<String> get result => _result.stream;

  Function get addResult => _result.sink.add;

  BehaviorSubject<VoucherModel> _voucher = BehaviorSubject<VoucherModel>();

  Observable<VoucherModel> get voucher => _voucher.stream;

  Function get addVoucher => _voucher.sink.add;

  final String id;
  TransactionDB transactionsDB;

  AcceptCreditsBloc({this.id}) {
    transactionsDB = TransactionDB.get();
    if (id != null) {
      downloadWoms(id);
    } else {
      scanQRCode();
    }

  }



  Future scanQRCode() async {
    try {
      String scanResult = await BarcodeScanner.scan();
//      fetchVoucher(id);
      final list = await downloadWoms(scanResult);

      //save wom on db

      final womDB = WomDB.get();
      list.forEach((wom) async {
        await womDB.updateWom(wom);
      });


      TransactionModel tx = TransactionModel(
//        id: "id212345",
        date: DateTime.now(),
        country: "italy",
        size: list.length,
        transactionType: TransactionType.EARN,
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


  } on PlatformException catch (ex) {
      if (ex == BarcodeScanner.CameraAccessDenied) {
        _voucher.addError("Permessi per la camera negati");
      } else {
        _voucher.addError("Errore sconosciuto: $ex");
      }
    } on FormatException {
      _voucher
          .addError("Hai premuto il pulsante back prima di acquisire il dato");
    } catch (ex) {
      _voucher.addError("Errore sconosciuto: $ex");
    }
  }

  Future<List<WomModel>> downloadWoms(String scanResult) async {
    try {
//      final String otc = "4988a56c5f234d4f85677e84d6344539";

      final otc = scanResult.split("/").last;

      print(otc);

      //create json map
      final Map<String, String> map = {"Otc": otc};

      //encode map to json string
      final mapEncoded = json.encode(map);

      //encrypt otc map with public_key
      final otcEncrypted = await encryptString(mapEncoded, PUBLIC_KEY);

      //create payload with endrypted otc json
      final Map<String, String> payload = {"Payload": otcEncrypted};

      //POST
      var url = "http://wom.social/api/v1/voucher/redeem";

      final resp = await http.post(
        url,
        body: json.encode(payload),
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
      );

      final jsonResponse = json.decode(resp.body);

      final encryptedPayload = jsonResponse["payload"];

      print(encryptedPayload);

      final decryptedPayload =
      await decryptStringWithPublicKey(encryptedPayload,"", PUBLIC_KEY);
      print(decryptedPayload);
      final jsonDecrypted = json.decode(decryptedPayload);

      print(jsonDecrypted);

      final ResultResponse result = ResultResponse.fromJson(jsonDecrypted);

      print(result.woms.length.toString());

      return result.woms;

    } catch (e) {
      print(e.toString());
      return null;
    }
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