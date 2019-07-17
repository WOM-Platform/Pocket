import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
//                AppLocalizations.of(context).noTransactions,
                "There are no transactions",
                style: TextStyle(color: darkBlueColor),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(5.0),
            shrinkWrap: true,
            itemCount: state.transactions.length,
            itemBuilder: (c, int index) {
              return TransactionCard(
                transaction: state.transactions[index],
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