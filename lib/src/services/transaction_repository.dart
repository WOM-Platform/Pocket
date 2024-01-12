import 'dart:async';
import 'dart:convert';

import 'package:dart_geohash/dart_geohash.dart';
import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wom_pocket/constants.dart';
import 'package:wom_pocket/src/application/aim_notifier.dart';
import 'package:wom_pocket/src/database/database.dart';
import 'package:wom_pocket/src/database/extensions.dart';
import 'package:wom_pocket/src/models/deep_link_model.dart';
import 'package:wom_pocket/src/models/totem_data.dart';
import 'package:wom_pocket/src/models/transaction_model.dart';
import 'package:wom_pocket/src/models/wom_model.dart';
import 'package:http/http.dart' as http;
import 'package:wom_pocket/src/screens/home/widgets/totem_dialog.dart';
import '../my_logger.dart';

final pocketProvider = Provider<Pocket>((ref) => Pocket(domain, registryKey));

final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
  return TransactionRepository(
      ref.watch(pocketProvider), ref.watch(getDatabaseProvider), Dio());
});

class TransactionRepository {
  final Pocket pocket;
  final MyDatabase database;
  final Dio dio;

  TransactionRepository(this.pocket, this.database, this.dio) {
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

    final type = redeem.sourceId == exchangeSourceId
        ? TransactionType.EXCHANGE_IMPORT
        : TransactionType.VOUCHERS;

    TransactionModel tx = TransactionModel(
      id: 0,
      date: DateTime.now(),
      size: vouchers.length,
      type: type,
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
            addedOn: e.timestamp.millisecondsSinceEpoch,
            spent: WomStatus.ON.index,
            latitude: e.latitude,
            longitude: e.longitude,
          ),
        )
        .toList());

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
              .getVouchersForPayment(simpleFilter: infoPay.simpleFilter))
          .map((e) => e.toVoucher())
          .toList();

      if (infoPay.amount > satisfyingVouchers.length) {
        throw InsufficientVouchers();
      }
      // satisfyingVouchers.shuffle();
      final vouchers = satisfyingVouchers.sublist(0, infoPay.amount);
      final ack = await pocket.pay(infoPay, otc, password, vouchers);

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
    } catch (e, st) {
      logger.e(e);
      logger.e(st);
      rethrow;
    }
  }

  Future<TotemResponse> getVoucherRequestFromEmbeddedQrCode(TotemData data,
      LatLng location, String? lastSessionIdScanned, int? participationCount, String? gender,
      {bool isMocked = false}) async {
    try {
      final json = data.toJson();
      json.removeWhere((key, value) => value == null);
      final response = await dio.post(
          'https://europe-west3-count-me-in-ef93b.cloudfunctions.net/embedded-scan',
          data: {
            ...json,
            'lastSessionIdScanned': lastSessionIdScanned,
            'latitude': location.latitude,
            'longitude': location.longitude,
            'gender': gender,
            'participationCount': participationCount,
            'isMocked': isMocked,
          });
      // final response = await http.post(
      //     Uri.parse(
      //         'https://europe-west3-count-me-in-ef93b.cloudfunctions.net/embedded-scan'),
      //     body: {
      //       ...json,
      //       'latitude': location.latitude.toString(),
      //       'longitude': location.longitude.toString(),
      //       'isMocked': isMocked,
      //     });
      if (response.statusCode == 200) {
        // final d = Map<String, dynamic>.from(jsonDecode(response));
        return TotemResponse.fromJson(response.data);
      }
      throw Exception('Error from embedded api: ${response.statusCode}');
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response!.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
      rethrow;
    } catch (ex) {
      rethrow;
    }
  }
}
