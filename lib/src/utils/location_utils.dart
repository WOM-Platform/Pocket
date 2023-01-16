import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wom_pocket/src/my_logger.dart';

goToCurrentLocation(
    Future<GoogleMapController> controller, double zoom,
    {bool withAnimation = true}) async {
  if (await _requestPermission()) {
    final currentPosition = await Geolocator.getCurrentPosition();
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

Future<bool> _requestPermission() async {
  final permission = await Geolocator.requestPermission();
  return permission == LocationPermission.whileInUse ||
      permission == LocationPermission.always;
}
