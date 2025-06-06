import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hexagon/hexagon.dart';
import 'package:wom_pocket/src/core/ui/widgets/my_appbar.dart';
import 'package:wom_pocket/src/features/badge/application/badge_notifier.dart';
import 'package:wom_pocket/src/features/badge/data/badge.dart';
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

class BadgeScreen extends ConsumerWidget {
  const BadgeScreen({Key? key}) : super(key: key);

  final columns = 3;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(badgeNotifierProvider);

    final languageCode = context.locale.languageCode;
    return Scaffold(
      appBar: PocketAppBar(
        actions: [
          IconButton(
            onPressed: () {
              ref.refresh(badgeNotifierProvider.future);
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(badgeNotifierProvider.future),
        child: state.when(
          data: (badgeState) {
            final badgeDataList = badgeState.badges;
            final challengeDataList = badgeState.challenges;
            if (badgeDataList.isEmpty && challengeDataList.isEmpty) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraints.maxHeight),
                      child: Center(
                        child: Text(
                          'Nessun badge trovato. Trascina per aggiornare.',
                        ),
                      ),
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
                  child: Column(
                    children: [
                      BadgeList(badges: badgeDataList),
                      for (final challenge in challengeDataList) ...[
                        const SizedBox(height: 16),
                        GestureDetector(
                            onTap: () {
                              context.go('/badge/challenge', extra: challenge);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  challenge.name[languageCode] ?? '',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Icon(Icons.info_outline_rounded),
                              ],
                            )),
                        BadgeList(badges: challenge.badges),
                      ],
                    ],
                  ),
                ),
              ),
            );
          },
          error: (ex, st) {
            return Center(
              child: Text(ex.toString()),
            );
          },
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  int getIndex(int x, int y) {
    return y * columns + x;
  }
}
