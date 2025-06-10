import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hexagon/hexagon.dart';
import 'package:wom_pocket/src/features/badge/data/badge.dart';

class BadgeList extends StatelessWidget {
  final List<BadgeData> badges;

  const BadgeList({
    required this.badges,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (badges.isEmpty) {
      return SizedBox.shrink();
    }
    final remains = badges.length % columns;
    final rows = badges.length ~/ columns + (remains > 0 ? 1 : 0);

    return HexagonOffsetGrid.evenFlat(
      columns: columns,
      rows: rows,
      padding: EdgeInsets.all(8.0),
      buildTile: (col, row) {
        final index = getIndex(col, row);
        BadgeData? badge;
        if (index < badges.length) {
          badge = badges[index];
        }
        return HexagonWidgetBuilder(
          padding: 4.0,
          cornerRadius: 8.0,
          elevation: badge != null
              ? badge.achieved && !badge.seen
                  ? 6.0
                  : 2.0
              : 0.0,
          color: badge != null
              ? (badge.achieved ? Colors.amber.shade100 : Colors.grey.shade300)
              : Colors.grey.shade200,
          child: BadgeTile(
            badge: badge,
            onTap: () {
              context.go('/badge/details', extra: badge);
            },
          ),
        );
      },
    );
  }

  final columns = 3;

  int getIndex(int x, int y) {
    return y * columns + x;
  }
}

class BadgeTile extends ConsumerWidget {
  final BadgeData? badge;
  final Function()? onTap;

  const BadgeTile({
    Key? key,
    this.badge,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final badge = this.badge;
    if (badge == null) return SizedBox.shrink();

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        HapticFeedback.lightImpact();
        onTap?.call();
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (badge.image != null) ...[
            CachedNetworkImage(
              imageUrl: badge.image!.midDensityFullWidthUrl,
              fit: BoxFit.cover,
              imageBuilder: (_, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    colorFilter: badge.achieved
                        ? null
                        : ColorFilter.mode(
                            Colors.grey,
                            BlendMode.saturation,
                          ),
                  ),
                ),
              ),
              errorWidget: (context, error, stackTrace) =>
                  Icon(Icons.broken_image, size: 20),
              progressIndicatorBuilder: (context, child, loadingProgress) {
                return Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    value: loadingProgress.progress,
                  ),
                );
              },
            ),
            Opacity(
              opacity: 0.4,
              child: SvgPicture.asset(
                badge.achieved
                    ? 'assets/images/wom-badge-overlay-brand.svg'
                    : 'assets/images/wom-badge-overlay-white.svg',
                fit: BoxFit.cover,
              ),
            ),
          ],

          if (badge.achieved && !badge.seen)
            Positioned(
              bottom: 2,
              right: 2,
              top: 2,
              left: 2,
              child: SvgPicture.asset(
                'assets/images/wom-hexagon-overlay-brand.svg',
                fit: BoxFit.cover,
              ),
            ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Padding(
          //     padding: const EdgeInsets.all(16),
          //     child: Text(
          //       badge.name['it']?.toString() ?? '',
          //       textAlign: TextAlign.center,
          //       overflow: TextOverflow.ellipsis,
          //       style: TextStyle(
          //         fontSize: 12,
          //         fontWeight:
          //             badge.achieved ? FontWeight.bold : FontWeight.normal,
          //       ),
          //     ),
          //   ),
          // ),

          // if (badge.simpleFilter?.count != null)
          //   Center(
          //       child: Column(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       Text(
          //         badge.simpleFilter!.count.toString(),
          //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //       ),
          //       SvgPicture.asset('assets/images/wom-icon-brand.svg',width: 50,),
          //     ],
          //   )),
        ],
      ),
    );
  }
}
