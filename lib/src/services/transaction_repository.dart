import 'dart:async';

import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:pocket/constants.dart';
import 'package:pocket/src/db/transaction_db.dart';
import 'package:pocket/src/db/wom_db.dart';
import 'package:pocket/src/models/deep_link_model.dart';
import 'package:pocket/src/models/transaction_model.dart';

import '../my_logger.dart';

class TransactionRepository {
  final DeepLinkModel deepLinkModel;
  late TransactionDB transactionsDB;
  late WomDB womDB;
  late Pocket pocket;

  TransactionRepository(this.deepLinkModel) {
    logger.i('Repository constructor');
    transactionsDB = TransactionDB.get();
    womDB = WomDB.get();
    pocket = Pocket(domain, registryKey);
  }

  Future<TransactionModel> getWoms(String otc, String password,
      {double? lat, double? long}) async {
    logger.i('getWoms');
    try {
      final response =
          await pocket.redeemVouchers(otc, password, lat: lat, long: long);
      return saveWoms(response);
    } on ServerException catch (ex) {
      logger.i(ex.error);
      rethrow;
    } catch (ex) {
      logger.e(ex);
      rethrow;
    }
  }

  Future<TransactionModel> saveWoms(ResponseRedeem redeem) async {
    final womDB = WomDB.get();
    final vouchers = redeem.vouchers!;
    final aims = <String?>{};

    for (int i = 0; i < vouchers.length; i++) {
      aims.add(vouchers[i].aim);
    }

    String tmp = "";
    aims.forEach((aim) {
      tmp = tmp + "$aim,";
    });

    final aimsString = tmp.substring(0, tmp.length - 1);
    logger.i(aimsString);
    logger.i(tmp);

    TransactionModel tx = TransactionModel(
      date: DateTime.now(),
      country: "italy",
      size: vouchers.length,
      transactionType: TransactionType.VOUCHERS,
      source: redeem.sourceName!,
      aimCode: tmp,
    );

    final int? id = await transactionsDB.insertTransaction(tx);

    for (int i = 0; i < vouchers.length; i++) {
      await womDB.insertVoucher(
          vouchers[i], redeem.sourceName, redeem.sourceId, id);
      logger.i("wom_$i saved");
    }

    return tx;
  }

  Future<InfoPayResponse> requestPayment(String otc, String? password) async {
    logger.i("requestPayment");
    return pocket.requestInfoPayment(otc, password);
  }

  Future<TransactionModel> pay(
      String otc, String? password, InfoPayResponse infoPay) async {
    logger.i("pay");

    try {
      final satisfyingVouchers =
          await womDB.getVouchersForPay(simpleFilter: infoPay.simpleFilter);

      if (infoPay.amount! > satisfyingVouchers.length) {
        throw InsufficientVouchers();
      }
      // satisfyingVouchers.shuffle();
      final vouchers = satisfyingVouchers.sublist(0, infoPay.amount);
      final ack = await pocket.pay(infoPay, otc, password, vouchers);

      //TODO change italy
      TransactionModel tx = TransactionModel(
        date: DateTime.now(),
        country: "italy",
        size: infoPay.amount,
        transactionType: TransactionType.PAYMENT,
        source: infoPay.posName!,
        aimCode: infoPay.simpleFilter?.aimCode,
        ackUrl: ack,
      );

      final id = await transactionsDB.insertTransaction(tx);

      int count = 0;
      if (ack == null) {
        throw Exception('Errore nel pagamento');
      }

      for (int i = 0; i < vouchers.length; i++) {
        final c = await womDB.updateWomStatusToOff(vouchers[i].id, id);
        count += c;
      }
      logger.i("wom to off = $count");
      logger.i(ack.toString());

      return tx;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
