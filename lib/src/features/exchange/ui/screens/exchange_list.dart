import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:wom_pocket/src/features/exchange/application/exchange_notifier.dart';
import 'package:wom_pocket/src/features/new_home/ui/section_title.dart';
import 'package:wom_pocket/src/features/root/widgets/transaction_card.dart';

class ExchangeListScreen extends ConsumerWidget {
  const ExchangeListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exchangeState = ref.watch(getExchangeTransactionsProvider);
    if (exchangeState.valueOrNull?.isEmpty ?? true) {
      return SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionTitle(
            title: 'lastDonation'.tr(),
          ),
          const SizedBox(height: 16),
          exchangeState.when(
            data: (list) {
              return Column(
                children: [
                  for (int i = 0; i < list.length; i++)
                    TransactionCard(
                      transaction: list[i],
                    ),
                  if (list.isEmpty) Text('noDonation'.tr()),
                ],
              );
            },
            error: (ex, st) {
              return Text(ex.toString());
            },
            loading: () => SizedBox(
              height: 200,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
