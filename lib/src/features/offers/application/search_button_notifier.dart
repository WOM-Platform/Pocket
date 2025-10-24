import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/core/my_logger.dart';
import 'package:wom_pocket/src/features/offers/application/offer_map_notifier.dart';
import 'package:wom_pocket/src/features/offers/ui/map_screen.dart';

part 'search_button_notifier.g.dart';

enum ZoomStatus { outside, enabled, disabled, loading }

final enableCarouselProvider = Provider.autoDispose<bool>((ref) {
  final zoom = ref.watch(zoomMapProvider);
  return zoom >= minZoom;
});

@riverpod
class EnableSearchButtonNotifier extends _$EnableSearchButtonNotifier {
  // final LatLng? position;
  //
  // EnableSearchButtonNotifier(this.position)

  ZoomStatus build(LatLng? position) {
    logger.w('EnableSearchButtonNotifier build');
    final posMapData = ref.watch(offersMapProvider(position));
    final zoom = ref.watch(zoomMapProvider);
    if (posMapData.isLoading) {
      logger.w('EnableSearchButtonNotifier build => loading');
      return ZoomStatus.loading;
    }
    logger.w('EnableSearchButtonNotifier build => disabled');
    if (zoom >= minZoom) {
      return ZoomStatus.enabled;
    }
    return ZoomStatus.outside;
  }
}
