/*
import 'dart:async' show TimeoutException;
import 'dart:math';


import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dart_wom_connector/dart_wom_connector.dart'
    hide Location, Position;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:wom_pocket/src/blocs/transaction/transaction_event.dart';
import 'package:wom_pocket/src/blocs/transaction/transaction_state.dart';
import 'package:wom_pocket/src/models/transaction_model.dart';
import 'package:wom_pocket/src/services/transaction_repository.dart';

import '../../my_logger.dart';
import '../../utils/my_extensions.dart';

class PocketException implements Exception {}

class LocationServiceException extends PocketException {}

class ServiceGPSDisabled extends LocationServiceException {}

class GetLocationTimeout extends LocationServiceException {}

class LocationPermissionDenied extends LocationServiceException {}

class LocationPermissionDeniedForever extends LocationServiceException {}

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionRepository _repository;
  final String otc;
  final TransactionType type;

  TransactionBloc(this._repository, this.otc, this.type)
      : super(TransactionLoadingState());

  exception() {
    throw Exception('fake exception');
  }

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
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
      timeLimit: Duration(seconds: 15),
    );

    return position;
  }

  @override
  Stream<TransactionState> mapEventToState(TransactionEvent event) async* {
    if (event is TransactionStarted) {
      yield TransactionLoadingState();
      if (await InternetConnectionChecker().hasConnection) {
        yield* handleEvent(event, () async {
          TransactionModel transaction;
          if (type == TransactionType.VOUCHERS) {
            logger.i("bloc: " + otc);

            final location = await getLocation2();
            transaction = await _repository.getWoms(
              otc,
              event.password,
              lat: location.latitude,
              long: location.longitude,
            );
            logger.i("transaction saved");
            logEvent('wom_redeemed');
            return TransactionCompleteState(transaction);
          } else {
            final infoPayment =
                await _repository.requestPayment(otc, event.password);
            logger.i(infoPayment);
            logEvent('wom_info_payment_retrieved');
            return TransactionInfoPaymentState(infoPayment, event.password);
          }
        });
      } else {
        yield TransactionNoDataConnectionState(password: event.password);
      }
    } else if (event is TransactionConfirmPayment) {
      yield TransactionLoadingState();
      if (await InternetConnectionChecker().hasConnection) {
        yield* handleEvent(event, () async {
          final transaction =
              await _repository.pay(otc, event.password, event.infoPay);
          logEvent('wom_payment_done');
          return TransactionCompleteState(transaction);
        });
      } else {
        yield TransactionNoDataConnectionState(
            infoPay: event.infoPay, password: event.password);
      }
    }
  }

  Stream<TransactionState> handleEvent(TransactionEvent event,
      Future<TransactionState> Function() operation) async* {
    try {
      yield await operation();
    } on InsufficientVouchers catch (ex) {
      yield TransactionErrorState(
          error: 'Non hai voucher a sufficienza per questa richiesta',
          translationKey: 'wrong_number_of_vouchers');
    } on ServerException catch (ex) {
      FirebaseCrashlytics.instance.recordError(ex, null, reason: ex.error);
      yield TransactionErrorState(
          error: ex.error, translationKey: ex.translationKey);
    } on TimeoutException catch (ex, stack) {
      FirebaseCrashlytics.instance.recordError(ex, stack);
      yield TransactionErrorState(
          error: 'La richiesta ha impiegato troppo tempo',
          translationKey: 'request_timeout_exception');
    } on LocationServiceException {
      yield TransactionMissingLocationState();
    } on LocationServiceDisabledException {
      yield TransactionMissingLocationState();
    } catch (ex, stack) {
      logger.i(ex.toString());
      FirebaseCrashlytics.instance.recordError(ex, stack);
      yield TransactionErrorState(
          error: ex.toString(), translationKey: 'unknown_error');
    }
  }
}
*/
