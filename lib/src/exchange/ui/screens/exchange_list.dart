import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/localization/app_localizations.dart';
import 'package:wom_pocket/src/exchange/application/exchange_notifier.dart';
import 'package:wom_pocket/src/new_home/ui/section_title.dart';
import 'package:wom_pocket/src/screens/home/widgets/transaction_card.dart';

class ExchangeListScreen extends ConsumerWidget {
  const ExchangeListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exchangeState = ref.watch(getExchangeTransactionsProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionTitle(
            title:
                AppLocalizations.of(context)?.translate('lastDonation') ?? '-',
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
                  if (list.isEmpty)
                    Text(
                        AppLocalizations.of(context)?.translate('noDonation') ??
                            '-'),
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
    // return Scaffold(
    //   appBar: AppBar(
    //     actions: [
    //       IconButton(
    //           icon: Icon(Icons.add),
    //           color: Colors.white,
    //           onPressed: () {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute<bool>(
    //                 builder: (context) => NewExchangeWidget(),
    //               ),
    //             );
    //           }),
    //     ],
    //   ),
    //   body: ,
    // );
  }
}
