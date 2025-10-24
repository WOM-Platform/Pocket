import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexagon/hexagon.dart';
import 'package:wom_pocket/src/core/ui/widgets/my_appbar.dart';
import 'package:wom_pocket/src/features/badge/application/badge_notifier.dart';
import 'package:wom_pocket/src/features/badge/data/badge.dart';
import 'package:wom_pocket/src/features/badge/ui/badge_list.dart';

class BadgeDetailsScreen extends ConsumerStatefulWidget {
  final BadgeData badge;

  const BadgeDetailsScreen({required this.badge, super.key});

  @override
  ConsumerState createState() => _BadgeDetailsScreenState();
}

class _BadgeDetailsScreenState extends ConsumerState<BadgeDetailsScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.badge.achieved) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        ref.read(badgeProvider.notifier).setAsSeen(widget.badge.id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd-MM-yyyy');
    final languageCode = context.locale.languageCode;
    return Scaffold(
      appBar: SecondLevelAppBar(
        title: widget.badge.name[languageCode] ?? 'Badge',
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          if (widget.badge.lastUpdate != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Ultimo aggiornamento: ${dateFormat.format(widget.badge.lastUpdate!)}',
                ),
              ],
            ),
          HexagonWidget(
            padding: 4.0,
            cornerRadius: 8.0,
            elevation: 2,
            width: 300,
            height: 300,
            type: HexagonType.FLAT,
            child: BadgeTile(badge: widget.badge),
          ),
          if (widget.badge.createdAt != null)
            Text('Anno di creazione: ${widget.badge.createdAt!.year}'),
          if (widget.badge.description != null) ...[
            const SizedBox(height: 16),
            Text(
              widget.badge.description?[languageCode] ?? '-',
              style: TextStyle(fontSize: 20),
            ),
          ],
          if (widget.badge.simpleFilter != null) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  widget.badge.simpleFilter!.count.toString(),
                  style: TextStyle(fontSize: 40),
                ),
                const SizedBox(width: 8),
                SvgPicture.asset(
                  'assets/images/wom-icon-brand.svg',
                  width: 100,
                ),
              ],
            ),
          ],
          if (widget.badge.achieved && widget.badge.achievedAt != null) ...[
            const SizedBox(height: 16),
            Text('Hai verificato questo badge il: ${widget.badge.achievedAt}'),
          ],
        ],
      ),
    );
  }
}
