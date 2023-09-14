import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/my_logger.dart';
import 'package:wom_pocket/src/screens/pos_list/carousel.dart';
import 'package:wom_pocket/src/screens/pos_list/pos_list_screen.dart';
import 'package:wom_pocket/src/screens/pos_list/pos_map_data.dart';

part 'pos_map_notifier.g.dart';

@Riverpod()
class PosMapNotifier extends _$PosMapNotifier {
  PosMapData build() {
    return PosMapData.empty();
  }

  Future<void> loadPos({
    required double llx,
    required double lly,
    required double urx,
    required double ury,
  }) async {
    final currentState = state;
    try {
      state = state.copyWith(isLoading: true);
      final posList = await ref
          .read(getRegistryClientProvider)
          .getPosListAroundMe(llx: llx, lly: lly, urx: urx, ury: ury);

      final markers = await buildMarkers(posList);
      state = PosMapData(posList: posList, markers: markers);
    } catch (ex) {
      logger.e(ex);
      state = currentState;
    }
  }

  Future<Set<Marker>> buildMarkers(List<POSMap> points) async {
    final s = <Marker>{};
    for (int i = 0; i < points.length; i++) {
      final p = points[i];
      final marker = await buildMarker(p, i);
      s.add(marker);
    }
    return s;
  }

  Future<BitmapDescriptor> _getPosPin() async {
    return await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/images/wom_pos_pin.png');
  }

  BitmapDescriptor? _standardPin;

  Future<Marker> buildMarker(POSMap point, int index) async {
    _standardPin ??= await _getPosPin();
    // _selectedPin ??= await getCustomPinWithBorder(
    //   iconHeight,
    //   NewPalette.chivadoColor,
    //   Colors.white,
    // );
    final markerId = MarkerId(point.id);

    // if (index == 0 && selectedMarkerId == null) {
    //   selectedMarkerId = markerId;
    //   selectedIndex = 0;
    // }
    return Marker(
      markerId: markerId,
      position: LatLng(point.position.latitude, point.position.longitude),
      onTap: () {
        ref.read(getCarouselControllerProvider).jumpToPage(index);
        // selectMarker(markerId);
      },
      zIndex: index == 0 ? 1 : 0,
      infoWindow: InfoWindow(title: point.name),
      icon: _standardPin!,
      // icon: (markerId == selectedMarkerId ? _selectedPin : _standardPin) ??
      //     BitmapDescriptor.defaultMarker,
    );
  }
}
