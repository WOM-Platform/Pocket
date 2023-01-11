import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/src/new_home/application/wom_stats_notifier.dart';

import 'package:wom_pocket/src/new_home/ui/section_title.dart';
import 'package:wom_pocket/src/new_home/ui/stats.dart';
import 'package:wom_pocket/src/screens/home/widgets/wom_stats_widget.dart';

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
    //
    final count =
        ref.watch(availableWomCountProvider).valueOrNull?.toString() ?? '-';
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

    final labelStyle = TextStyle(color: Colors.grey, fontSize: 14);
    final valueStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 20);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionTitle(
          title: 'Statistiche',
          text: 'Vedi tutte',
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => StatsScreen()));
          },
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Wom disponibili:',
                    style: labelStyle,
                  ),
                  Text(
                    count,
                    style: valueStyle,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Spesi nell\'ultima settimana:',
                    style: labelStyle,
                  ),
                  Text(
                    spentLastWeek,
                    style: valueStyle,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Guadagnati nell\'ultima settimana:',
                    style: labelStyle,
                  ),
                  Text(
                    earnedLastWeek,
                    style: valueStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
