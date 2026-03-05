import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/core/exceptions/location_exception.dart';
import 'package:wom_pocket/src/core/my_logger.dart';
import 'package:wom_pocket/src/core/utils/location_utils.dart';

part 'location_notifier.g.dart';

@Riverpod(keepAlive: true)
class LocationNotifier extends _$LocationNotifier {
  FutureOr<Position> build() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw ServiceGPSDisabled();
    }

    final loc = await _getCurrentLocation();
    return loc;
  }

  Future<Position> _getCurrentLocation() async {
    logger.w('_getCurrentLocation');
    try {
      if (await requestPermission()) {
        final serviceEnabled = await Geolocator.isLocationServiceEnabled();

        if (!serviceEnabled) {
          throw ServiceGPSDisabled();
        }

        final currentPosition = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(
            timeLimit: const Duration(seconds: 15),
            accuracy: LocationAccuracy.medium,
          ),
        );
        logger.i('position is mocked ${currentPosition.isMocked}');
        logger.w(currentPosition);
        return currentPosition;
      }
      logger.w('permissions are not granted');
      logger.e('LocationPermissionException');
      throw LocationPermissionDenied();
    } on LocationServiceDisabledException catch (ex, st) {
      logger.e('LocationServiceDisabledException', error: ex, stackTrace: st);
      throw ServiceGPSDisabled();
    } on LocationPermissionDeniedForever catch (ex, st) {
      logger.w('LocationPermissionDeniedForever', error: ex, stackTrace: st);
      throw LocationPermissionDenied();
    } on TimeoutException catch (ex, st) {
      logger.e('LocationTimeoutException', error: ex, stackTrace: st);
      throw GetLocationTimeout();
    } catch (ex, st) {
      logger.e('LocationUnknownException', error: ex, stackTrace: st);
      rethrow;
    }
  }
}

extension PositionX on Position {
  toLocation() {
    return LatLng(latitude, longitude);
  }
}

@riverpod
Future<Position> getPosition(Ref ref) async {
  try {
    if (await requestPermission()) {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        throw LocationServiceDisabledException();
      }

      final currentPosition = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(
          timeLimit: const Duration(seconds: 30),
          accuracy: LocationAccuracy.high,
        ),
      );
      logger.i('position is mocked ${currentPosition.isMocked}');
      logger.i(currentPosition);
      return currentPosition;
    }
    throw Exception('requestPermission returns false');
  } on LocationServiceDisabledException catch (ex, st) {
    logger.w('LocationServiceDisabledException', error: ex, stackTrace: st);
    throw ServiceGPSDisabled();
  } on TimeoutException catch (ex, st) {
    logger.w('LocationTimeoutException', error: ex, stackTrace: st);
    throw GetLocationTimeout();
  } on LocationPermissionDenied catch (ex, st) {
    logger.w('LocationPermissionDenied', error: ex, stackTrace: st);
    throw LocationPermissionDenied();
  } on LocationPermissionDeniedForever catch (ex, st) {
    logger.w('LocationPermissionDeniedForever', error: ex, stackTrace: st);
    throw LocationPermissionDenied();
  } catch (ex, st) {
    logger.e(
      'LocationNotifier: LocationUnknownException',
      error: ex,
      stackTrace: st,
    );
    rethrow;
  }
}
