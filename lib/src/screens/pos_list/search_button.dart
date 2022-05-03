import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/src/screens/pos_list/pos_map.dart';

enum ZoomStatus { outside, enabled, disabled, loading }

final enableSearchButtonProvider = StateProvider.autoDispose<ZoomStatus>((ref) {
  final listAsync = ref.watch(posMapListProvider);
  if (listAsync is AsyncError) {
    return ZoomStatus.disabled;
  } else if (listAsync is AsyncLoading) {
    return ZoomStatus.loading;
  }
  return ZoomStatus.disabled;
});

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
    switch (searchButtonStatus) {
      case ZoomStatus.outside:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16)),
          child: Text(
            'Zoom in',
            style: TextStyle(
              fontSize: fontSize,
            ),
          ),
        );

      case ZoomStatus.enabled:
        return ElasticIn(
          duration: const Duration(milliseconds: 500),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).accentColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            onPressed: onPressed,
            child: Text(
              'Search here',
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        );
      case ZoomStatus.disabled:
        return const SizedBox.shrink();
      case ZoomStatus.loading:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).accentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
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
