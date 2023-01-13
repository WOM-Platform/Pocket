import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/localization/app_localizations.dart';
import 'package:wom_pocket/src/offers/application/offers_notifier.dart';
import 'package:wom_pocket/src/offers/ui/map_screen.dart';
import 'package:wom_pocket/src/utils/colors.dart';

import '../../my_logger.dart';

enum ZoomStatus { outside, enabled, disabled, loading }

final enableCarouselProvider = Provider.autoDispose<bool>((ref) {
  final zoom = ref.watch(zoomMapProvider);
  return zoom >= 16;
});

final enableSearchButtonProvider =
    AutoDisposeNotifierProvider<EnableSearchButtonNotifier, ZoomStatus>(
        EnableSearchButtonNotifier.new);

class EnableSearchButtonNotifier extends AutoDisposeNotifier<ZoomStatus> {
  @override
  ZoomStatus build() {
    logger.wtf('EnableSearchButtonNotifier build');
    final posMapData = ref.watch(offersMapNotifierProvider);
    final zoom = ref.watch(zoomMapProvider);
    if (posMapData.isLoading) {
      logger.wtf('EnableSearchButtonNotifier build => loading');
      return ZoomStatus.loading;
    }
    logger.wtf('EnableSearchButtonNotifier build => disabled');
    if (zoom >= 16) {
      return ZoomStatus.enabled;
    }
    return ZoomStatus.outside;
  }
}

class SearchNewPointButton extends ConsumerWidget {
  final Function()? onPressed;

  const SearchNewPointButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fontSize = 18.0;
    final searchButtonStatus = ref.watch(enableSearchButtonProvider);
    logger.i('SEARCH NEW POINT $searchButtonStatus');
    switch (searchButtonStatus) {
      case ZoomStatus.outside:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.pinch,
                color: primaryColor,
              ),
              const SizedBox(width: 8),
              Text(
                AppLocalizations.of(context)!.translate('zoomInToSearch'),
                style: TextStyle(
                  color: primaryColor,
                  fontSize: fontSize,
                ),
              ),
            ],
          ),
        );

      case ZoomStatus.enabled:
        return ElasticIn(
          duration: const Duration(milliseconds: 500),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () {
              logEvent('search_pos_map');
              onPressed?.call();
            },
            child: Text(
              AppLocalizations.of(context)!.translate('search_here'),
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        );
      case ZoomStatus.disabled:
        return const SizedBox.shrink();
      case ZoomStatus.loading:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: onPressed,
          child: const SizedBox(
            height: 20,
            width: 20,
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 1,
              ),
            ),
          ),
        );
    }
  }
}
