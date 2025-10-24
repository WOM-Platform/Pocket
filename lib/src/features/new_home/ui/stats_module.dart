import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wom_pocket/src/features/new_home/application/wom_stats_notifier.dart';
import 'package:wom_pocket/src/features/new_home/ui/section_title.dart';
import 'package:wom_pocket/src/features/new_home/ui/stats_screen.dart';
import 'package:wom_pocket/src/features/root/widgets/wom_stats_widget.dart';

class AimChart extends ConsumerStatefulWidget {
  const AimChart({super.key, this.enabled = true});

  final bool enabled;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => AimChartState();
}

class AimChartState extends ConsumerState<AimChart> {
  String touchedIndex = '';

  @override
  Widget build(BuildContext context) {
    final count = ref.watch(availableWomCountProvider).value?.toString() ?? '-';
    final spentLastWeek =
        ref.watch(fetchWomCountSpentInTheLastWeekProvider).value?.toString() ??
        '-';
    final earnedLastWeek =
        ref.watch(fetchWomCountEarnedInTheLastWeekProvider).value?.toString() ??
        '-';
    final badgeStats = ref.watch(getBadgesStatsProvider);
    final totalBadges = badgeStats.$1;
    final achievedBadges = badgeStats.$2;
    final showBadgeStats = totalBadges > 0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionTitle(
          title: 'stats'.tr(),
          text: 'seeAll'.tr(),
          onTap: () {
            context.push('/stats');
          },
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextWithLabel(label: 'availableWom'.tr(), text: count),
                  const SizedBox(height: 4),
                  TextWithLabel(
                    label: 'earnLastWeek'.tr(),
                    text: earnedLastWeek,
                  ),
                  const SizedBox(height: 4),
                  TextWithLabel(
                    label: 'spentLastWeek'.tr(),
                    text: spentLastWeek,
                  ),
                  if (showBadgeStats) ...[
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Flexible(
                          child: TextWithLabel(
                            label: 'Traguardi totali:',
                            text: totalBadges.toString(),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: TextWithLabel(
                            label: 'Traguardi raggiunti:',
                            text: achievedBadges.toString(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
