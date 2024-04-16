import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:wom_pocket/src/my_logger.dart';
import 'package:wom_pocket/src/new_home/application/wom_stats_notifier.dart';
import 'package:wom_pocket/src/new_home/ui/aim_chart.dart';
import 'package:wom_pocket/src/new_home/ui/nfc_widget.dart';
import 'package:wom_pocket/src/new_home/ui/section_title.dart';
import 'package:wom_pocket/src/nfc/application/nfc_notifier.dart';
import 'package:wom_pocket/src/screens/home/widgets/totem_dialog.dart';
import 'package:wom_pocket/src/screens/home/widgets/transaction_list.dart';
import 'package:wom_pocket/src/screens/map/map_screen.dart';
import 'package:wom_pocket/src/transaction/ui/transactions_screen.dart';
import 'package:wom_pocket/src/widgets/my_appbar.dart';

class NewHome extends ConsumerStatefulWidget {
  const NewHome({Key? key}) : super(key: key);

  @override
  ConsumerState<NewHome> createState() => _NewHomeState();
}

class _NewHomeState extends ConsumerState<NewHome> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    ref.read(nFCNotifierProvider.notifier).resume();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      ref.read(nFCNotifierProvider.notifier).resume();
    } else if (state == AppLifecycleState.hidden) {
      ref.read(nFCNotifierProvider.notifier).stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(nFCNotifierProvider, (previous, next) async {
      if (previous is NFCStateListening && next is NFCStateData) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => PopScope(
            canPop: false,
            child: TotemDialog(
              totemData: next.totemData,
            ),
          ),
        ).then((value){
          ref.read(nFCNotifierProvider.notifier).resume();
        });
      }
    });
    final transactionCountAsync = ref.watch(transactionCountNotifierProvider);

    return Scaffold(
      appBar: PocketAppBar(
        actions: [NfcWidget()],
      ),
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
                          title: 'womMap'.tr(),
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
                  // SliverToBoxAdapter(child: ExchangeCard()),
                  // SliverToBoxAdapter(
                  //   child: SizedBox(
                  //     height: 16,
                  //   ),
                  // ),
                  SliverToBoxAdapter(
                    child: SectionTitle(
                      title: 'lastTransactions'.tr(),
                      text: 'seeAll'.tr(),
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
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Center(
                  //   child: SvgPicture.asset(
                  //     'assets/images/empty_wom.svg',
                  //     width: MediaQuery.of(context).size.width - 48,
                  //     height: MediaQuery.of(context).size.width - 48,
                  //     // cacheWidth: 200,
                  //     // cacheHeight: 200,
                  //   ),
                  // ),
                  Center(
                    child: Image.asset(
                      'assets/images/empty_wom.png',
                      width: MediaQuery.of(context).size.width - 48,
                      height: MediaQuery.of(context).size.width - 48,
                      // cacheWidth: 200,
                      // cacheHeight: 200,
                    ),
                  ),

                  // const SizedBox(height: 8),
                  Text(
                    'noWoms'.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'noWomsDesc'.tr(),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
          error: (ex, st) {
            return Center(
              child: Text(
                'somethings_wrong'.tr(),
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
