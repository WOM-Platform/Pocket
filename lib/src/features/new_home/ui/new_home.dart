import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wom_pocket/src/core/constants.dart';
import 'package:wom_pocket/src/core/models/totem_data.dart';
import 'package:wom_pocket/src/core/my_logger.dart';
import 'package:wom_pocket/src/core/ui/widgets/my_appbar.dart';
import 'package:wom_pocket/src/core/ui/widgets/my_button.dart';
import 'package:wom_pocket/src/features/map/map_screen.dart';
import 'package:wom_pocket/src/features/new_home/application/wom_stats_notifier.dart';
import 'package:wom_pocket/src/features/new_home/ui/nfc_widget.dart';
import 'package:wom_pocket/src/features/new_home/ui/section_title.dart';
import 'package:wom_pocket/src/features/new_home/ui/stats_module.dart';
import 'package:wom_pocket/src/features/new_home/ui/widgets/badge_module.dart';
import 'package:wom_pocket/src/features/nfc/application/nfc_notifier.dart';
import 'package:wom_pocket/src/features/root/widgets/transaction_list.dart';
import 'package:wom_pocket/src/features/totem/utils.dart';

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
    // ref.read(nFCNotifierProvider.notifier).resume();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      ref.read(nFCProvider.notifier).resume();
    }
  }

  @override
  Widget build(BuildContext context) {
    final transactionCountAsync = ref.watch(transactionCountProvider);

    return Scaffold(
      appBar: PocketAppBar(actions: [if (Platform.isAndroid) NfcWidget()]),
      body: SafeArea(
        child: transactionCountAsync.when(
          data: (count) {
            if (count > 0) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(children: [AimChart(enabled: false)]),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 16)),
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SectionTitle(title: 'womMap'.tr(), leftPadding: 16),
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Positioned.fill(child: MapBody(enabled: false)),
                              GestureDetector(
                                onTap: () {
                                  logEvent('open_wom_map');
                                  context.push('/wom-map');
                                },
                                child: Container(color: Colors.transparent),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 16)),
                  // SliverToBoxAdapter(child: ExchangeCard()),
                  BadgeModule(),
                  SliverToBoxAdapter(
                    child: SectionTitle(
                      title: 'lastTransactions'.tr(),
                      text: 'seeAll'.tr(),
                      leftPadding: 16,
                      onTap: () {
                        context.push('/transactions');
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TransactionsList(),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 80)),
                ],
              );
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/empty_wom.png',
                      width: MediaQuery.sizeOf(context).width - 48,
                      height: MediaQuery.sizeOf(context).width - 48,
                      // cacheWidth: 200,
                      // cacheHeight: 200,
                    ),
                  ),

                  // const SizedBox(height: 8),
                  Text(
                    'noWoms'.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Text('noWomsDesc'.tr(), textAlign: TextAlign.center),
                  const SizedBox(height: 8),
                  MyButton(
                    child: Text('redeem_welcome_wom'.tr()),
                    onPressed: () {
                      final totemData = validateTotemQrCodeWithRegex(
                        welcomeTotem,
                      );
                      if (totemData != null) {
                        launchTotemDialog(context, totemData);
                      }
                    },
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
          loading: () => Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
