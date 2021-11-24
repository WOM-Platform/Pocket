import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dart_wom_connector/dart_wom_connector.dart' hide Location;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pocket/src/blocs/transaction/transaction_event.dart';
import 'package:pocket/src/blocs/transaction/transaction_state.dart';
import 'package:pocket/src/models/transaction_model.dart';
import 'package:pocket/src/services/transaction_repository.dart';

import '../../my_logger.dart';

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

//   Future<LocationData?> getLocation() async {
// try{
//   final location = new Location();
//
//   bool _serviceEnabled;
//   PermissionStatus _permissionGranted;
//
//   _serviceEnabled = await location.serviceEnabled();
//   if (!_serviceEnabled) {
//     print('SERVICE NOT Enabled');
//     _serviceEnabled = await location.requestService().timeout(
//       Duration(seconds: 5),
//       onTimeout: (){
//         print('requestService timeout');
//         throw 'Unknown error occurred. Please reload.';
//       },
//     );
//     if (!_serviceEnabled) {
//       print('SERVICE NOT Enabled after request');
//       return null;
//     }
//     print('SERVICE Enabled after request');
//   }
//
//   _permissionGranted = await location.hasPermission();
//   print('Permission $_permissionGranted');
//   if (_permissionGranted == PermissionStatus.denied) {
//     print('Permission denied');
//     _permissionGranted = await location.requestPermission();
//     if (_permissionGranted != PermissionStatus.granted) {
//       print('Permission NOT granted after request');
//       return null;
//     }
//   }
//
//   // final result = await location.changeSettings(accuracy: LocationAccuracy.reduced);
//   print('changeSettings $result');
//   print('get Location');
//   final locData = await location.getLocation().timeout(
//     Duration(seconds: 5),
//     onTimeout: (){
//       print('requestService timeout');
//       throw 'Failed to get Location';
//     },
//   );
//   return locData;
// }catch(ex){
//   return null;
// }
//   }

  Future<Position> getLocation2() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      throw ServiceGPSDisabled();
    }

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
    final locData = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low,).timeout(
    Duration(seconds: 7),
    onTimeout: (){
      print('requestService timeout');
      throw GetLocationTimeout();
    },
  );
  return locData;
  }

  @override
  Stream<TransactionState> mapEventToState(TransactionEvent event) async* {
    if (event is TransactionStarted) {
      yield TransactionLoadingState();
      if (await InternetConnectionChecker().hasConnection) {
        try {
          TransactionModel transaction;
          if (type == TransactionType.VOUCHERS) {
            logger.i("bloc: " + otc);

            final location = await getLocation2();
            /*print(location);
            if (location == null) {
              yield TransactionMissingLocationState(event);
              return;
            }*/
            transaction = await _repository.getWoms(
              otc,
              event.password!,
              lat: location.latitude,
              long: location.longitude,
            );
            logger.i("transaction saved");
            yield TransactionCompleteState(transaction);
          } else {
            final infoPayment =
                await _repository.requestPayment(otc, event.password);
            logger.i(infoPayment);
            yield TransactionInfoPaymentState(infoPayment, event.password);
          }
        } on LocationServiceException catch (ex) {
          yield TransactionMissingLocationState(event, ex);
        } on InsufficientVouchers catch (ex) {
          yield TransactionErrorState(
              'Non hai voucher a sufficienza per questa richiesta');
        } on ServerException catch (ex) {
          yield TransactionErrorState(ex.error ?? 'Errore sconosciuto');
        } on TimeoutException catch (ex) {
          yield TransactionErrorState('La richiesta ha impiegato troppo tempo');
        } catch (ex) {
          yield TransactionErrorState(ex.toString());
        }
      } else {
        yield TransactionNoDataConnectionState();
      }
    } else if (event is TransactionConfirmPayment) {
      yield TransactionLoadingState();
      if (await InternetConnectionChecker().hasConnection) {
        try {
          final transaction =
              await _repository.pay(otc, event.password, event.infoPay!);
          yield TransactionCompleteState(transaction);
        } on InsufficientVouchers catch (ex) {
          yield TransactionErrorState(
              'Non hai voucher a sufficienza per questa richiesta');
        } on ServerException catch (ex) {
          yield TransactionErrorState(ex.error ?? 'Errore sconosciuto');
        } on TimeoutException catch (ex) {
          yield TransactionErrorState('La richiesta ha impiegato troppo tempo');
        } catch (ex) {
          logger.i(ex.toString());
          yield TransactionErrorState(ex.toString());
        }
      } else {
        yield TransactionNoDataConnectionState(infoPay: event.infoPay);
      }
    }
  }
}
