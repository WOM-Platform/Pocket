import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket/localization/app_localizations.dart';
import 'package:pocket/src/blocs/transactions_list/bloc.dart';
import 'package:pocket/src/screens/home/widgets/transaction_card.dart';
import 'package:pocket/src/utils/colors.dart';

class TransactionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsListBloc, TransactionsState>(
      builder: (BuildContext context, TransactionsState state) {
        if (state is TransactionsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is TransactionsLoaded) {
          if (state.transactions != null) {
            if (state.transactions.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context).translate('no_transactions'),
                      style: TextStyle(color: darkBlueColor),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 90),
                shrinkWrap: true,
                itemCount: state.transactions.length,
                itemBuilder: (c, int index) {
                  return TransactionCard(
                    transaction: state.transactions[index],
                  );
                },
              );
            }
          } else {
            return Container(
              height: MediaQuery.of(context).size.height / 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)
                          .translate('somethings_wrong'),
                    ),
                  ),
                  FloatingActionButton.extended(
                    onPressed: () {
                      BlocProvider.of<TransactionsListBloc>(context)
                          .add(LoadTransactions());
                    },
                    label: Text(
                      AppLocalizations.of(context)
                          .translate('update_transactions'),
                    ),
                  ),
                ],
              ),
            );
          }
        } else if (state is TransactionsErrorState) {
          return Center(
            child: Text(
              AppLocalizations.of(context).translate(state.error),
              textAlign: TextAlign.center,
            ),
          );
        } else if (state is TransactionsNoDataConnectionState) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context).translate('no_connection_title'),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  AppLocalizations.of(context)
                      .translate('no_connection_aim_desc'),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                    child: Text(
                        AppLocalizations.of(context).translate('try_again')),
                    onPressed: () {
                      BlocProvider.of<TransactionsListBloc>(context)
                          .add(LoadTransactions());
                    }),
              ],
            ),
          );
        }
        return Center(
          child:
              Text(AppLocalizations.of(context).translate('somethings_wrong')),
        );
      },
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
