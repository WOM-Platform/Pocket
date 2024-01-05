import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/my_logger.dart';
import 'package:wom_pocket/src/offers/application/offers_notifier.dart';
import 'package:wom_pocket/src/utils/location_utils.dart';

part 'location_notifier.g.dart';

@Riverpod(keepAlive: true)
class LocationNotifier extends _$LocationNotifier {
  FutureOr<Position> build() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw LocationDisabledException();
    }

    final loc = await _getCurrentLocation();
    return loc;
  }


  Future<Position> _getCurrentLocation() async {
    logger.w('_getCurrentLocation');
    try {
      if (await requestPermission()) {
        final currentPosition = await Geolocator.getCurrentPosition(
          timeLimit: Duration(seconds: 15),
        );
        logger.i("position is mocked ${currentPosition.isMocked}");
        logger.wtf(currentPosition);
        return currentPosition;
        // return LatLng(currentPosition.latitude, currentPosition.longitude);
      }
      logger.w('permissions are not granted');
      throw LocationPermissionException();
    } on LocationServiceDisabledException catch (ex) {
      logger.e(ex);
      throw LocationDisabledException();
    } on TimeoutException catch (ex) {
      logger.e(ex);
      throw LocationTimeoutException();
    } catch (ex, st) {
      logger.e(ex);
      logger.e(st);
      throw LocationUnknownException(ex: ex, stackTrace: st);
    }
  }
}

extension PositionX on Position{
  toLocation(){
    return LatLng(latitude, longitude);
  }
}