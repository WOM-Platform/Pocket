import 'package:pocket/src/blocs/bloc_provider.dart';
import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:pocket/src/services/repository.dart';
import 'package:pocket/src/models/deep_link_model.dart';
import 'package:pocket/src/models/transaction_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/services.dart';

enum TransactionStatus {
  LOADING,
}

class TransactionSummaryBloc extends BlocBase {
  BehaviorSubject<String> _result = BehaviorSubject<String>();

  Observable<String> get result => _result.stream;

  Function get addResult => _result.sink.add;

  BehaviorSubject<TransactionModel> _voucher =
      BehaviorSubject<TransactionModel>();

  Observable<TransactionModel> get voucher => _voucher.stream;

  Function get addVoucher => _voucher.sink.add;

  final Repository _repository;

  TransactionSummaryBloc(this._repository) {
    init();
  }

  void init() async {
    TransactionModel transaction;
    try{
      if (_repository.deepLinkModel.type == TransactionType.VOUCHERS) {
        transaction  = await _repository.getWoms(_repository.deepLinkModel.otc);
      } else {
        transaction  = await _repository.pay(_repository. deepLinkModel.otc);
      }
      addVoucher(transaction);
    }catch(ex){
      _voucher.addError(ex.toString());
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

  @override
  void dispose() {
    _result.close();
    _voucher.close();
  }
}
