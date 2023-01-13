import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/localization/app_localizations.dart';
import 'package:wom_pocket/src/my_logger.dart';
import 'package:wom_pocket/src/new_home/application/wom_stats_notifier.dart';
import 'package:wom_pocket/src/new_home/ui/aim_chart.dart';
import 'package:wom_pocket/src/new_home/ui/section_title.dart';
import 'package:wom_pocket/src/screens/home/widgets/transaction_list.dart';
import 'package:wom_pocket/src/screens/map/map_screen.dart';
import 'package:wom_pocket/src/transaction/ui/transactions_screen.dart';
import 'package:wom_pocket/src/widgets/my_appbar.dart';

class NewHome extends ConsumerWidget {
  const NewHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionCountAsync = ref.watch(transactionCountNotifierProvider);
    print(transactionCountAsync);
    return Scaffold(
      appBar: PocketAppBar(),
      body: SafeArea(
        child: transactionCountAsync.when(
          data: (count) {
            if (count > 0) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          AimChart(
                            enabled: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 16,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SectionTitle(
                          title: AppLocalizations.of(context)!.translate('womMap'),
                          leftPadding: 16,
                        ),
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Positioned.fill(
                                child: MapBody(
                                  enabled: false,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  logEvent('open_wom_map');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MapScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  color: Colors.transparent,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 16,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SectionTitle(
                      title: AppLocalizations.of(context)!.translate('lastTransactions'),
                      text: AppLocalizations.of(context)!.translate('seeAll'),
                      leftPadding: 16,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => TransactionsScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TransactionsList(),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 80,
                    ),
                  ),
                ],
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Placeholder(
                      fallbackHeight: 150,
                      fallbackWidth: 150,
                    ),
                  ],
                ),
                Text(
                  AppLocalizations.of(context)!.translate('noWoms'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.translate('noWomsDesc'),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
          error: (ex, st) {
            return Center(
              child: Text(
                AppLocalizations.of(context)!.translate('somethings_wrong'),
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            );
          },
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}