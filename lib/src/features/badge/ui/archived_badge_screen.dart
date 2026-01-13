import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/src/core/ui/widgets/my_appbar.dart';
import 'package:wom_pocket/src/features/badge/application/badge_notifier.dart';
import 'package:wom_pocket/src/features/badge/application/badge_state.dart';
import 'package:wom_pocket/src/features/badge/ui/badge_list.dart';

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}

class ArchivedBadgeScreen extends ConsumerWidget {
  const ArchivedBadgeScreen({Key? key}) : super(key: key);

  final columns = 3;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(badgeProvider);

    final languageCode = context.locale.languageCode;
    return Scaffold(
      appBar: SecondLevelAppBar(title: 'Badge Archiviati'),
      body: state.when(
        data: (badgeState) {
          final badgeDataList = badgeState.archivedBadges;
          if (badgeDataList.isEmpty) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Center(child: Text('Nessun badge archiviato.')),
                  ),
                );
              },
            );
          }

          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 150),
                child: Column(children: [BadgeList(badges: badgeDataList)]),
              ),
            ),
          );
        },
        error: (ex, st) {
          return Center(child: Text(ex.toString()));
        },
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
