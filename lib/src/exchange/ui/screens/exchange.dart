import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/src/exchange/application/exchange_notifier.dart';
import 'package:wom_pocket/src/exchange/application/new_exchange_state.dart';
import 'package:wom_pocket/src/exchange/ui/screens/exchange_list.dart';
import 'package:wom_pocket/src/exchange/ui/screens/exchange_receipt.dart';
import 'package:wom_pocket/src/exchange/ui/screens/new_exchange.dart';
import 'package:wom_pocket/src/widgets/my_appbar.dart';

class ExchangeScreen extends ConsumerWidget {
  const ExchangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final exchangeState = ref.watch(exchangeNotifierProvider);
    // final exchangeListState =
    //     ref.watch(getExchangeTransactionsProvider).valueOrNull;

    // ref.listen(exchangeNotifierProvider, (previous, next) {
    //   if (next is NewExchangeStateData) {
    //     Navigator.of(context).push(
    //       MaterialPageRoute(
    //         builder: (_) => ExchangeReceiptScreen(
    //           link: next.link,
    //           pin: next.pin,
    //           womCount: next.size,
    //         ),
    //       ),
    //     );
    //   }
    // });
    //
    // final isLoading =
    //     exchangeState is ExchangeStateInitial || exchangeListState == null;
    return Scaffold(
      appBar: PocketAppBar(),
      body: ListView(
              children: [
                NewExchangeWidget(),
                ExchangeListScreen(),
              ],
            )

    );
  }
}
