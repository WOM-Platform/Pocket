import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wom_pocket/src/my_logger.dart';
import 'package:wom_pocket/src/utils/location_exception.dart';


goToCurrentLocation(
    Future<GoogleMapController> controller, double zoom,
    {bool withAnimation = true}) async {
  if (await requestPermission()) {
    final currentPosition = await Geolocator.getCurrentPosition();
    logger.i("position is mocked ${currentPosition.isMocked}");
    final c = await controller;
    await _goToLocation(
      c,
      LatLng(currentPosition.latitude, currentPosition.longitude),
      withAnimation: withAnimation,
      zoom: zoom,
    );
  }
}

Future<void> _goToLocation(GoogleMapController controller, LatLng latLng,
    {bool withAnimation = true, double zoom = 16}) async {
  logger.i('_goToLocation');
  if (withAnimation) {
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: latLng,
          zoom: zoom,
        ),
      ),
    );
  } else {
    await controller.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: latLng,
          zoom: zoom,
        ),
      ),
    );
  }
}

Future<bool> requestPermission() async {
  var permission = await Geolocator.checkPermission();
  logger.i("requestPermission $permission");
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return false;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    throw LocationPermissionDeniedForever();
  }

  return permission == LocationPermission.whileInUse ||
      permission == LocationPermission.always;
}
