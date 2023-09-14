import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/localization/app_localizations.dart';
import 'package:wom_pocket/src/application/transactions_notifier.dart';
import 'package:wom_pocket/src/blocs/transactions_list/bloc.dart';
import 'package:wom_pocket/src/screens/home/widgets/transaction_card.dart';
import 'package:wom_pocket/src/utils/colors.dart';

class TransactionsList extends ConsumerWidget {
  final int limit;

  const TransactionsList({this.limit = 6});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(fetchTransactionsProvider);
    if (state is AsyncLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (state is AsyncData) {
      final data = state.value;
      if (data is TransactionsLoaded) {
        if (data.transactions.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)!.translate('no_transactions'),
                  style: TextStyle(color: darkBlueColor),
                ),
              ],
            ),
          );
        } else {
          return Column(
            children: [
              for (int i = 0; i < min(limit, data.transactions.length); i++)
                TransactionCard(
                  transaction: data.transactions[i],
                )
            ],
          );
          // return ListView.builder(
          //   padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 90),
          //   shrinkWrap: true,
          //   itemCount: data.transactions.length,
          //   itemBuilder: (c, int index) {
          //     return TransactionCard(
          //       transaction: data.transactions[index],
          //     );
          //   },
          // );
        }
      } else if (data is TransactionsErrorState) {
        return Center(
          child: Text(
            AppLocalizations.of(context)!.translate(data.error),
            textAlign: TextAlign.center,
          ),
        );
      } else if (data is TransactionsNoDataConnectionState) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                AppLocalizations.of(context)!.translate('no_connection_title'),
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                AppLocalizations.of(context)!
                    .translate('no_connection_aim_desc'),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child:
                    Text(AppLocalizations.of(context)!.translate('try_again')),
                onPressed: () {
                  ref.invalidate(fetchTransactionsProvider);
                  // BlocProvider.of<TransactionsListBloc>(context)
                  //     .add(LoadTransactions());
                },
              ),
            ],
          ),
        );
      }
    }

    return Center(
      child: Text(AppLocalizations.of(context)!.translate('somethings_wrong')),
    );
  }

/*  void _clearTutorial(context) {
    FeatureDiscovery.clearPreferences(
      context,
      const <String>{
        'add_item_feature_id',
        'show_map_info',
        'show_demo_info',
      },
    );
  }

  void _showTutorial(BuildContext context) {
    FeatureDiscovery.discoverFeatures(
      context,
      const <String>{
        'add_item_feature_id',
        'show_map_info',
        'show_demo_info',
      },
    );
  }*/
}
