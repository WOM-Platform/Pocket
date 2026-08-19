import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexagon/hexagon.dart';
import 'package:wom_pocket/src/core/constants.dart';
import 'package:wom_pocket/src/core/ui/widgets/my_appbar.dart';
import 'package:wom_pocket/src/core/ui/widgets/my_button.dart';
import 'package:wom_pocket/src/core/utils/colors.dart';
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
  late bool hasBadgeArchived;
  late DateTime? archivedAt;

  @override
  void initState() {
    super.initState();
    hasBadgeArchived = widget.badge.archived;
    archivedAt = widget.badge.archivedAt;
    if (widget.badge.achieved) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        ref.read(badgeProvider.notifier).setAsSeen(widget.badge.id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final languageCode = context.locale.languageCode;
    final achievedAt = widget.badge.achievedAt;
    return Scaffold(
      appBar: SecondLevelAppBar(
        title: widget.badge.name[languageCode] ?? 'Badge',
        actions: [
          if (!hasBadgeArchived)
            Center(
              child: MyButton(
                backgroundColor: lightBlue,
                onPressed: () async {
                  final hasArchived = await ref
                      .read(badgeProvider.notifier)
                      .setAsArchived(widget.badge.id);

                  if (hasArchived) {
                    setState(() {
                      hasBadgeArchived = true;
                      archivedAt = DateTime.now();
                    });
                  }
                },
                child: Text('archive'.tr()),
              ),
            )
          else
            Center(
              child: MyButton(
                backgroundColor: lightBlue,
                onPressed: () async {
                  final hasUnarchived = await ref
                      .read(badgeProvider.notifier)
                      .setAsUnarchived(widget.badge.id);

                  if (hasUnarchived) {
                    setState(() {
                      hasBadgeArchived = false;
                      archivedAt = null;
                    });
                  }
                },
                child: Text('restore'.tr()),
              ),
            ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          if (widget.badge.lastUpdate != null && isDev)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'last_update'.tr(
                    args: [formatDate(widget.badge.lastUpdate!, languageCode)],
                  ),
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
          if (widget.badge.createdAt != null && isDev)
            Text(
              'creation_year'.tr(
                args: [widget.badge.createdAt!.year.toString()],
              ),
            ),
          if (hasBadgeArchived && archivedAt != null)
            Text(
              'archived_date'.tr(args: [formatDate(archivedAt!, languageCode)]),
            ),
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
          if (widget.badge.achieved && achievedAt != null) ...[
            const SizedBox(height: 16),
            Text(
              'badge_verified_date'.tr(
                args: [formatDate(achievedAt, languageCode)],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

String formatDate(DateTime date, String locale) {
  final c = locale.startsWith('it') ? 'alle' : 'at';

  final pattern = "d MMMM yyyy '$c' HH:mm";

  String formattedDate = DateFormat(pattern, locale).format(date);

  if (locale.startsWith('it')) {
    formattedDate = formattedDate.replaceFirstMapped(
      RegExp(r'\b[a-z]'),
      (match) => match.group(0)!.toUpperCase(),
    );
  }

  return formattedDate;
}
