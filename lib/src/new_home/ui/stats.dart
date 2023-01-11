import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/app.dart';
import 'package:wom_pocket/src/application/aim_notifier.dart';
import 'package:wom_pocket/src/new_home/application/wom_stats_notifier.dart';
import 'package:collection/collection.dart';
import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:wom_pocket/src/new_home/ui/section_title.dart';
import 'package:wom_pocket/src/screens/home/widgets/wom_stats_widget.dart';
import 'package:wom_pocket/src/transaction/ui/transactions_screen.dart';
import 'package:wom_pocket/src/utils/colors.dart';

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
    final aimList = ref.watch(aimNotifierProvider).valueOrNull ?? [];
    final aims = ref.watch(fetchAimInPercentageProvider).valueOrNull ?? [];
    final baseSize = 90.0;
    final labelStyle = TextStyle(color: Colors.grey, fontSize: 14);
    final valueStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 20);
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistiche'),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: primaryColor,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Column(
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
          const SizedBox(height: 16),
          SectionTitle(
            title: 'Aim',
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
                            touchedIndex = aims[pieTouchResponse
                                    .touchedSection!.touchedSectionIndex]
                                .aim;
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
                            // title: aims[i].aim,
                            color: aimColors[min(i, 9)],
                            radius: aims[i].aim == touchedIndex
                                ? baseSize
                                : baseSize - 10.0,
                            titleStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xffffffff),
                            ),
                          ),
                      ]
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
                                ?.title ??
                            '-',
                        isSquare: true,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                    ]
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
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
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
        )
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
