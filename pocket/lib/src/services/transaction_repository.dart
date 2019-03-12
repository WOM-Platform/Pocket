import 'package:pocket/constants.dart';
import 'package:pocket/src/db/transaction_db.dart';
import 'package:pocket/src/db/wom_db.dart';
import 'package:pocket/src/models/deep_link_model.dart';
import 'package:pocket/src/models/response_confirm_pay.dart';
import 'package:pocket/src/models/response_info_pay.dart';
import 'package:pocket/src/models/response_redeem.dart';
import 'package:pocket/src/models/transaction_model.dart';
import 'package:pocket/src/models/wom_model.dart';
import 'dart:async';
import 'package:pocket/src/services/transaction_api.dart';
import 'package:pocket/src/utils/cryptography_helper.dart';
import 'package:simple_rsa/simple_rsa.dart';
import 'dart:convert';

class TransactionRepository {
  final String pin;
  final DeepLinkModel deepLinkModel;
  TransactionDB transactionsDB;
  WomDB womDB;
  TransactionApi transactionApi;

  TransactionRepository(this.pin, this.deepLinkModel) {
    print('Repository constructor');
    transactionsDB = TransactionDB.get();
    womDB = WomDB.get();
    transactionApi = TransactionApi();
  }

  Future<TransactionModel> getWoms(String otc) async {
    print('getWoms');
    try {
      final ResponseRedeem redeem = await downloadWoms(otc);
      return await saveWoms(redeem);
    } catch (ex) {
      throw Exception(ex.toString());
    }
  }

  Future<ResponseRedeem> downloadWoms(String otc) async {
    print("START DOWNLOAD WOMS");

    try {
      //get response body with generic request of protocol
      final jsonDecrypted = await performRequestAndDecryptPayload(otc);

      //create object from json payload
      final ResponseRedeem responseRedeem = ResponseRedeem.fromJson(jsonDecrypted);
      print(responseRedeem?.woms?.length?.toString());
      return responseRedeem;
    } catch (ex) {
      throw Exception(ex.toString());
    }
  }

  Future<TransactionModel> saveWoms(ResponseRedeem redeem) async {
    final womDB = WomDB.get();
    List<WomModel> woms = redeem.woms;
    Set<String> aims = Set();

    for (int i = 0; i < woms.length; i++) {
      aims.add(woms[i].aim);
    }

    String tmp = "";
    aims.forEach((aim) {
      tmp = tmp + "$aim,";
    });

    final aimsString = tmp.substring(0, tmp.length - 1);
    print(aimsString);
    print(tmp);

    TransactionModel tx = TransactionModel(
      date: DateTime.now(),
      country: "italy",
      size: woms.length,
      transactionType: TransactionType.VOUCHERS,
      source: redeem.sourceName,
      aim: aimsString,
    );

    final int id = await transactionsDB.insertTransaction(tx);

    for (int i = 0; i < woms.length; i++) {
      woms[i].sourceName = redeem.sourceName;
      woms[i].sourceId = redeem.sourceId;
      woms[i].transactionId = id;
      aims.add(woms[i].aim);
      await womDB.insertWom(woms[i]);
    }

    return tx;
  }

  Future<ResponseInfoPay> requestPayment(String otc) async {
    print("requestPayment");
    try {
      //get response body with generic request of protocol
      final jsonDecrypted = await performRequestAndDecryptPayload(otc);

      //create object from json payload
      final ResponseInfoPay infoPay = ResponseInfoPay.fromMap(jsonDecrypted);

      return infoPay;
    } catch (ex) {
      throw Exception(ex.toString());
    }
  }

  Future<TransactionModel> pay(String otc, ResponseInfoPay infoPay) async {
    print("pay");
    try {
      //generate temporary key from this transaction
      final key = CryptographyHelper.generateAsBase64String(32);

      print("key: " + key.toString());
      print("key length" + key.length.toString());
      print("pin: " + pin);
      print("otc: " + otc);

      final woms = await womDB.getWomsForPay(
        simpleFilters: infoPay.simpleFilter,
      );

      print("Ci sono ${woms.length} woms disponibili per questo pagamento");

      if (woms.length >= infoPay.amount) {
        final vouchers = woms.sublist(0, infoPay.amount);
        //create json map with parameters
        final Map<String, dynamic> map = {
          "Otc": otc,
          "Password": pin,
          "SessionKey": key,
          "Vouchers": vouchers.map((v) => v.toMap()).toList(),
        };

        //encode map to json string
        final mapEncoded = json.encode(map);

        //encrypt otc map with public_key
        final otcEncrypted = await encryptString(mapEncoded, PUBLIC_KEY);

        //create payload with endrypted otc json
        final Map<String, String> payload = {"Payload": otcEncrypted};

        //get response body from HTTP POST method
        String responseBody = await transactionApi.confirmPayments(payload);

        //decode response body into json
        final jsonResponse = json.decode(responseBody);

        //get encrypted payload from json
        final encryptedPayload = jsonResponse["payload"];

        //decrypt payload with AES CBC
        final decryptedPayload =
            CryptographyHelper.decryptAES(encryptedPayload, key);

        //decode response body into json
        final jsonDecryptedPayload = json.decode(decryptedPayload);

        final responsePayment =
            ResponseConfirmPay.fromMap(jsonDecryptedPayload);

        TransactionModel tx = TransactionModel(
          date: DateTime.now(),
          country: "italy",
          size: infoPay.amount,
          transactionType: TransactionType.PAYMENT,
          source: infoPay.posName,
          aim: infoPay?.simpleFilter?.aim,
        );

        final int id = await transactionsDB.insertTransaction(tx);

        int count = 0;
        if (responsePayment != null) {
          for (int i = 0; i < vouchers.length; i++) {
            final c = await womDB.updateWomStatusToOff(vouchers[i].id, id);
            count += c;
          }
          print("wom to off = $count");
          print(responsePayment.ack.toString());

          return tx;
        } else {
          throw Exception("Errore nel pagamento");
        }
      } else {
        throw Exception("Wom insufficienti per effettuare il pagamento");
      }
    } catch (ex) {
      throw Exception(ex.toString());
    }
  }

  Future<Map<String, dynamic>> performRequestAndDecryptPayload(
      String otc) async {
    print("performRequestAndDecryptPayload");
    try {
      //generate temporary key from this transaction
      final key = CryptographyHelper.generateAsBase64String(32);

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
      String responseBody;
      if (deepLinkModel.type == TransactionType.VOUCHERS) {
        responseBody = await transactionApi.redeemWoms(payload);
      } else {
        responseBody = await transactionApi.getInfoPayments(payload);
      }

      //decode response body into json
      final jsonResponse = json.decode(responseBody);

      //get encrypted payload from json
      final encryptedPayload = jsonResponse["payload"];

      //decrypt payload with AES CBC
      final decryptedPayload =
          CryptographyHelper.decryptAES(encryptedPayload, key);

      //decode decrypted paylod into json
      final Map<String, dynamic> jsonDecrypted = json.decode(decryptedPayload);
      print(jsonDecrypted.toString());
      return jsonDecrypted;
    } catch (ex) {
      throw Exception(ex.toString());
    }
  }
}
