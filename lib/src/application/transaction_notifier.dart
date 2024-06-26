import 'dart:async';

import 'package:dart_wom_connector/dart_wom_connector.dart'
    hide Location, Position;
import 'package:geolocator/geolocator.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/blocs/transaction/transaction_state.dart';
import 'package:wom_pocket/src/models/deep_link_model.dart';
import 'package:wom_pocket/src/models/transaction_model.dart';
import 'package:wom_pocket/src/my_logger.dart';
import 'package:wom_pocket/src/services/transaction_repository.dart';
import 'package:wom_pocket/src/utils/location_exception.dart';
import 'package:wom_pocket/src/utils/my_extensions.dart';

part 'transaction_notifier.g.dart';

class PocketException implements Exception {}

class TransactionNotifierParams {
  final DeepLinkModel deepLinkModel;
  final String password;

  TransactionNotifierParams(this.deepLinkModel, this.password);
}

@riverpod
class TransactionNotifier extends _$TransactionNotifier {
  late final String _otc;
  late final String _password;
  late final TransactionType _type;

  @override
  FutureOr<TransactionState> build(TransactionNotifierParams arg) async {
    _otc = arg.deepLinkModel.otc!;
    _type = arg.deepLinkModel.type;
    _password = arg.password;
    if (await InternetConnectionChecker().hasConnection) {
      try {
        TransactionModel transaction;
        if (_type == TransactionType.VOUCHERS) {
          logger.i("bloc: " + _otc);

          final location = await getLocation2();
          logger.i("position is mocked ${location.isMocked}");
          transaction = await ref.read(transactionRepositoryProvider).getWoms(
                _otc,
                _password,
                lat: location.latitude,
                long: location.longitude,
              );
          logger.i("transaction saved");
          logEvent('wom_redeemed');
          return TransactionCompleteState(transaction);
        } else {
          final infoPayment = await ref
              .read(transactionRepositoryProvider)
              .requestPayment(_otc, _password);
          logger.i(infoPayment);
          logEvent('wom_info_payment_retrieved');
          return TransactionInfoPaymentState(infoPayment, _password);
        }
      } on InsufficientVouchers catch (ex, st) {
        logger.e("InsufficientVouchers", error: ex, stackTrace: st);
        return TransactionErrorState(
            error: 'Non hai voucher a sufficienza per questa richiesta',
            translationKey: 'wrong_number_of_vouchers');
      } on ServerException catch (ex, st) {
        logger.e("ServerException: ${ex.statusCode}",
            error: ex, stackTrace: st);
        return TransactionErrorState(
            error: ex.error, translationKey: ex.translationKey);
      } on TimeoutException catch (ex, st) {
        logger.e("TimeoutException", error: ex, stackTrace: st);
        return TransactionErrorState(
            error: 'La richiesta ha impiegato troppo tempo',
            translationKey: 'request_timeout_exception');
      } on LocationServiceException catch (ex, st) {
        logger.e("TransactionMissingLocationState", error: ex, stackTrace: st);
        return TransactionMissingLocationState();
      } on LocationServiceDisabledException catch (ex, st) {
        logger.e("GPS service disabled", error: ex, stackTrace: st);
        return TransactionMissingLocationState();
      } catch (ex, st) {
        logger.e("Unknown error", error: ex, stackTrace: st);
        return TransactionErrorState(
            error: ex.toString(), translationKey: 'unknown_error');
      }
    } else {
      return TransactionNoDataConnectionState(password: _password);
    }
  }

  // exception() {
  //   throw Exception('fake exception');
  // }

  Future<Position> getLocation2() async {
    LocationPermission permission;

    // Test if location services are enabled.
    // bool serviceEnabled;
    // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   // Location services are not enabled don't continue
    //   // accessing the position and request users of the
    //   // App to enable the location services.
    //   throw ServiceGPSDisabled();
    // }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        throw LocationPermissionDenied();
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      throw LocationPermissionDeniedForever();
      // return Future.error(
      //     'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
      timeLimit: Duration(seconds: 15),
    );

    return position;
  }

  Future confirmPayment(PaymentInfoResponse infoPayment) async {
    state = AsyncLoading();
    if (await InternetConnectionChecker().hasConnection) {
      try {
        final transaction = await ref
            .read(transactionRepositoryProvider)
            .pay(_otc, _password, infoPayment);
        logEvent('wom_payment_done');
        state = AsyncData(TransactionCompleteState(transaction));
      } on InsufficientVouchers {
        state = AsyncData(TransactionErrorState(
            error: 'Non hai voucher a sufficienza per questa richiesta',
            translationKey: 'wrong_number_of_vouchers'));
      } on ServerException catch (ex, st) {
        logger.e("ServerException: ${ex.statusCode}",
            error: ex, stackTrace: st);
        state = AsyncData(TransactionErrorState(
            error: ex.error, translationKey: ex.translationKey));
      } on TimeoutException catch (ex, st) {
        logger.e("TimeoutException", error: ex, stackTrace: st);
        state = AsyncData(TransactionErrorState(
            error: 'La richiesta ha impiegato troppo tempo',
            translationKey: 'request_timeout_exception'));
      } catch (ex, st) {
        logger.e('Unknown error',error:ex, stackTrace: st);
        state = AsyncData(TransactionErrorState(
            error: ex.toString(), translationKey: 'unknown_error'));
      }
    } else {
      state = AsyncData(TransactionNoDataConnectionState(
        infoPay: infoPayment,
        password: _password,
      ));
    }
  }
}
