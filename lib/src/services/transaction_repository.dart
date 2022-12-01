import 'dart:async';

import 'package:dart_geohash/dart_geohash.dart';
import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/constants.dart';
import 'package:wom_pocket/src/application/aim_notifier.dart';
import 'package:wom_pocket/src/database/database.dart';
import 'package:wom_pocket/src/database/extensions.dart';
import 'package:wom_pocket/src/db/transaction_db.dart';
import 'package:wom_pocket/src/db/wom_db.dart';
import 'package:wom_pocket/src/models/deep_link_model.dart';
import 'package:wom_pocket/src/models/transaction_model.dart';
import 'package:wom_pocket/src/models/wom_model.dart';

import '../my_logger.dart';

final pocketProvider = Provider<Pocket>((ref) => Pocket(domain, registryKey));

final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
  return TransactionRepository(
      ref.watch(pocketProvider), ref.watch(databaseProvider));
});

class TransactionRepository {
  // final DeepLinkModel deepLinkModel;
  // late TransactionDB transactionsDB;
  // late WomDB womDB;

  final Pocket pocket;
  final MyDatabase database;

  TransactionRepository(this.pocket, this.database) {
    logger.i('Repository constructor');
    // transactionsDB = TransactionDB.get();
    // womDB = WomDB.get();
  }

  Future<TransactionModel> getWoms(String otc, String password,
      {double? lat, double? long}) async {
    logger.i('getWoms');
    try {
      final response =
          await pocket.redeemVouchers(otc, password, lat: lat, long: long);
      return saveWoms(response);
    } on ServerException catch (ex) {
      logger.i(ex);
      rethrow;
    } catch (ex) {
      logger.e(ex);
      rethrow;
    }
  }

  Future<TransactionModel> saveWoms(ResponseRedeem redeem) async {
    final vouchers = redeem.vouchers;
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
      id: 0,
      date: DateTime.now(),
      // country: "italy",
      size: vouchers.length,
      type: TransactionType.VOUCHERS,
      source: redeem.sourceName,
      aimCode: tmp,
    );

    final id = await database.transactionsDao
        .addTransaction(tx.toTransactionCompanion());

    final geoHasher = GeoHasher();

    await database.womsDao.addVouchers(vouchers
        .map(
          (e) => WomCompanion.insert(
              id: e.id,
              sourceName: redeem.sourceName,
              secret: e.secret,
              geohash: geoHasher.encode(
                e.longitude,
                e.latitude,
              ),
              aim: e.aim,
              sourceId: redeem.sourceId,
              transactionId: id,
              timestamp: e.timestamp.millisecondsSinceEpoch,
              live: WomStatus.ON.index,
              latitude: e.latitude,
              longitude: e.longitude),
        )
        .toList());
    // logger.i("wom_$i saved");

    return tx.copyWith(id: id);
  }

  Future<PaymentInfoResponse> requestPayment(
      String otc, String? password) async {
    logger.i("requestPayment");
    return pocket.requestInfoPayment(otc, password);
  }

  Future<TransactionModel> pay(
      String otc, String? password, PaymentInfoResponse infoPay) async {
    logger.i("pay");

    try {
      final satisfyingVouchers = (await database.womsDao
              .getVouchersForPay(simpleFilter: infoPay.simpleFilter)).map((e) => e.toVoucher()).toList();

      if (infoPay.amount > satisfyingVouchers.length) {
        throw InsufficientVouchers();
      }
      // satisfyingVouchers.shuffle();
      final vouchers = satisfyingVouchers.sublist(0, infoPay.amount);
      final ack = await pocket.pay(infoPay, otc, password, vouchers);

      if (ack == null) {
        throw Exception('Errore nel pagamento');
      }

      TransactionModel tx = TransactionModel(
        id: 0,
        date: DateTime.now(),
        // country: "italy",
        size: infoPay.amount,
        type: TransactionType.PAYMENT,
        source: infoPay.posName,
        aimCode: infoPay.simpleFilter?.aim ?? '',
        ackUrl: ack,
      );

      final id = await database.transactionsDao
          .addTransaction(tx.toTransactionCompanion());

      int count = 0;

      for (int i = 0; i < vouchers.length; i++) {
        final c =
            await database.womsDao.updateWomStatusToOff(vouchers[i].id, id);
        count += c;
      }
      logger.i("wom to off = $count");
      logger.i(ack.toString());

      return tx.copyWith(id: id);
    } catch (e,st) {
      logger.e(e);
      logger.e(st);
      rethrow;
    }
  }
}
