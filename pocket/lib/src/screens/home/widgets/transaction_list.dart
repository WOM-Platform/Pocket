import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket/localization/localizations.dart';
import 'package:pocket/src/blocs/transactions/bloc.dart';
import 'package:pocket/src/utils/colors.dart';
import 'package:pocket/src/widgets/voucher_card.dart';

class TransactionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TransactionsBloc>(context);
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
                AppLocalizations.of(context).noTransactions,
                style: TextStyle(color: darkBlueColor),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(5.0),
            shrinkWrap: true,
            itemCount: state.transactions.length,
            itemBuilder: (c, int index) {
              return Hero(
                tag: state.transactions[index].date,
                child: TicketCard(
                  transaction: state.transactions[index],
                  isForHome: true,
                ),
              );
            },
          );
        }
        return Center(
          child: Text("Somethings wrong"),
        );
      },
    );
  }
}