import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket/localization/app_localizations.dart';
import 'package:pocket/src/blocs/transactions_list/bloc.dart';
import 'package:pocket/src/screens/home/widgets/transaction_card.dart';
import 'package:pocket/src/utils/colors.dart';

class TransactionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TransactionsListBloc>(context);
    return BlocBuilder(
      bloc: bloc,
      builder: (BuildContext context, TransactionsState state) {
        if (state is TransactionsLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is TransactionsLoaded) {
          if (state.transactions.isEmpty) {
            return Center(
              child: Text(
                AppLocalizations.of(context).translate('no_transactions'),
                style: TextStyle(color: darkBlueColor),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(5.0),
            shrinkWrap: true,
            itemCount: state.transactions.length + 1,
            itemBuilder: (c, int index) {
              if (index == state.transactions.length) {
                return SizedBox(
                  height: 50.0,
                );
              }
              return TransactionCard(
                transaction: state.transactions[index],
              );
            },
          );
        } else if (state is TransactionsErrorLoading) {
          return Center(
            child: Text(
              AppLocalizations.of(context).translate(state.error),
              textAlign: TextAlign.center,
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
}
