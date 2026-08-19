import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/core/utils/colors.dart';
import 'package:wom_pocket/src/features/badge/application/badge_notifier.dart';

part 'badge_module.g.dart';

@riverpod
class BadgeModuleNotifier extends _$BadgeModuleNotifier {
  @override
  int build() {
    final state = ref.watch(badgeProvider).value;
    final newBadgesToSee =
        (state?.badges
                .where((b) => b.seen == false && b.achieved == true)
                .length ??
            0) +
        (state?.challenges.fold<int>(
              0,
              (previous, challenge) =>
                  challenge.badges
                      .where((b) => b.seen == false && b.achieved == true)
                      .length +
                  previous,
            ) ??
            0);
    return newBadgesToSee;
  }
}

class BadgeModule extends ConsumerWidget {
  const BadgeModule({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(badgeModuleProvider);

    if (count <= 0) {
      return SliverToBoxAdapter(child: SizedBox.shrink());
    }
    return SliverToBoxAdapter(
      child: ElasticIn(
        duration: const Duration(milliseconds: 500),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
          child: GestureDetector(
            onTap: () {
              context.go('/badge');
            },
            child: Card(
              color: accentColor,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(MdiIcons.hexagon, size: 40, color: primaryColor),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          count > 1
                              ? 'Hai sbloccato $count nuovi traguardi, clicca qui per scoprirli.'
                              : 'Hai sbloccato 1 nuovo traguardo, clicca qui per scoprirlo.',
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
