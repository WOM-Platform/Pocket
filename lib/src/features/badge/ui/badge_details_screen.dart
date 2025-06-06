import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexagon/hexagon.dart';
import 'package:wom_pocket/src/core/ui/widgets/my_appbar.dart';
import 'package:wom_pocket/src/features/badge/application/badge_notifier.dart';
import 'package:wom_pocket/src/features/badge/data/badge.dart';
import 'package:wom_pocket/src/features/badge/ui/badge_list.dart';

class BadgeDetailsScreen extends ConsumerStatefulWidget {
  final BadgeData badge;

  const BadgeDetailsScreen({
    required this.badge,
    super.key,
  });

  @override
  ConsumerState createState() => _BadgeDetailsScreenState();
}

class _BadgeDetailsScreenState extends ConsumerState<BadgeDetailsScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.badge.achieved) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        ref.read(badgeNotifierProvider.notifier).setAsSeen(widget.badge.id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final languageCode = context.locale.languageCode;
    return Scaffold(
      appBar: SecondLevelAppBar(title: ''),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          HexagonWidget(
            padding: 4.0,
            cornerRadius: 8.0,
            elevation: 2,
            width: 300,
            height: 300,
            type: HexagonType.FLAT,
            child: BadgeTile(
              badge: widget.badge,
            ),
          ),
          Text(
            widget.badge.name[languageCode] ?? '-',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          if (widget.badge.description != null) ...[
            const SizedBox(height: 16),
            Text(widget.badge.description?[languageCode] ?? '-'),
          ],
          if (widget.badge.achieved && widget.badge.achievedAt != null) ...[
            const SizedBox(height: 16),
            Text('Riscattato il: ${widget.badge.achievedAt}'),
          ],
          Text('Aggiornato il: ${widget.badge.lastUpdate}'),
          Text('Creato il: ${widget.badge.createdAt}'),
        ],
      ),
    );
  }
}
