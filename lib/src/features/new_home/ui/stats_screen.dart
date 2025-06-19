import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/src/core/application/aim_notifier.dart';
import 'package:collection/collection.dart';
import 'package:wom_pocket/src/features/new_home/application/wom_stats_notifier.dart';
import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:wom_pocket/src/features/new_home/ui/section_title.dart';
import 'package:wom_pocket/src/features/root/widgets/wom_stats_widget.dart';
import 'package:wom_pocket/src/core/utils/colors.dart';

class StatsScreen extends ConsumerStatefulWidget {
  const StatsScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _StatsScreenState();
}

class _StatsScreenState extends ConsumerState<StatsScreen> {
  String touchedIndex = '';

  @override
  Widget build(BuildContext context) {
    final availableWomCount =
        ref.watch(availableWomCountProvider).valueOrNull?.toString() ?? '-';

    final womSpentCount =
        ref.watch(fetchWomSpentProvider).valueOrNull?.toString() ?? '-';

    // final womExchangedCount =
    //     ref.watch(fetchWomSpentProvider).valueOrNull?.toString() ?? '-';

    final badgeStats = ref.watch(getBadgesStatsProvider);
    final totalBadges = badgeStats.$1;
    final achievedBadges = badgeStats.$2;
    final showBadgeStats = totalBadges > 0;
    final spentLastWeek = ref
            .watch(fetchWomCountSpentInTheLastWeekProvider)
            .valueOrNull
            ?.toString() ??
        '-';
    final earnedLastWeek = ref
            .watch(fetchWomCountEarnedInTheLastWeekProvider)
            .valueOrNull
            ?.toString() ??
        '-';
    final aimList = ref.watch(aimNotifierProvider).valueOrNull ?? [];
    final aims = ref.watch(fetchAimInPercentageProvider).valueOrNull ?? [];
    final baseSize = 90.0;
    final labelStyle = TextStyle(color: Colors.grey, fontSize: 14);
    final valueStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 20);
    return Scaffold(
      backgroundColor: lightBackground,
      appBar: AppBar(
        title: Text('stats'.tr()),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: primaryColor,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextWithLabel(
            label: 'availableWom'.tr(),
            text: availableWomCount,
          ),
          const SizedBox(height: 8),
          TextWithLabel(
            label: 'Wom spesi:',
            text: womSpentCount,
          ),
          if (showBadgeStats) ...[
            const SizedBox(height: 8),
            TextWithLabel(
              label: 'Traguardi totali:',
              text: totalBadges.toString(),
            ),
            const SizedBox(height: 8),
            TextWithLabel(
              label: 'Traguardi raggiunti:',
              text: achievedBadges.toString(),
            ),
          ],
          const SizedBox(height: 24),
          SectionTitle(
            title: 'lastWeek'.tr(),
          ),
          TextWithLabel(
            label: 'womEarned'.tr(),
            text: earnedLastWeek,
          ),
          const SizedBox(height: 8),
          TextWithLabel(
            label: 'womSpent'.tr(),
            text: spentLastWeek,
          ),
          const SizedBox(height: 24),
          SectionTitle(
            title: 'aim'.tr(),
          ),
          Row(
            children: [
              SizedBox(
                height: baseSize * 2,
                width: baseSize * 2,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = '';
                            return;
                          }
                          if (pieTouchResponse
                                  .touchedSection!.touchedSectionIndex >
                              0) {
                            touchedIndex = aims[pieTouchResponse
                                    .touchedSection!.touchedSectionIndex]
                                .aim;
                          }
                        });
                      },
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 0,
                    sections: [
                      for (int i = 0; i < aims.length; i++)
                        PieChartSectionData(
                          value: aims[i].count.toDouble(),
                          // showTitle: widget.enabled,
                          title: '${aims[i].percentage.toStringAsFixed(0)}%',
                          titlePositionPercentageOffset: 0.9,
                          // title: aims[i].aim,
                          color: aimColors[min(i, 9)],
                          radius: aims[i].aim == touchedIndex
                              ? baseSize
                              : baseSize - 10.0,
                          titleStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 3.0,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                    ],
                    // read about it in the PieChartData section
                  ),
                  swapAnimationDuration: Duration(milliseconds: 150),
                  // Optional
                  swapAnimationCurve: Curves.linear, // Optional
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    for (int i = 0; i < aims.length; i++) ...[
                      Indicator(
                        color: aimColors[min(i, 9)],
                        text: aimList
                                .firstWhereOrNull((a) => a.code == aims[i].aim)
                                ?.title(
                                  languageCode: context.locale.languageCode,
                                ) ??
                            aims[i].aim,
                        isSquare: true,
                      ),
                      SizedBox(height: 4),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    required this.color,
    required this.text,
    required this.isSquare,
    super.key,
    this.size = 16,
    this.textColor,
  });

  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Text(
            text,
            maxLines: 2,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: textColor ?? Theme.of(context).primaryColor,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}

List<Color> aimColors = <Color>[
  Colors.green,
  Colors.pink,
  Colors.blue,
  Colors.orange,
  Colors.purple,
  Colors.yellow,
  Colors.pink,
  Colors.indigoAccent,
  Colors.brown,
  Colors.purpleAccent,
  Colors.cyanAccent,
];

class TextWithLabel extends StatelessWidget {
  final String label;
  final String? text;

  TextWithLabel({
    super.key,
    required this.label,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        Text(
          text ?? '-',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ],
    );
  }
}
