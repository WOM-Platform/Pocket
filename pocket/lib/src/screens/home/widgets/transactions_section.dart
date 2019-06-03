import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket/localization/localizations.dart';
import 'package:pocket/src/blocs/transactions/bloc.dart';
import 'package:pocket/src/db/transaction_db.dart';
import 'package:pocket/src/models/transaction_model.dart';
import 'package:pocket/src/screens/home/home_bloc.dart';
import 'package:pocket/src/utils/colors.dart';
import 'package:pocket/src/widgets/voucher_card.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {
  final HomeBloc bloc;

  const TransactionsList({Key key, this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TransactionModel>>(
      stream: bloc.transactions,
      builder: (ctx, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.data.isEmpty) {
          return Center(
              child: Text(
            AppLocalizations.of(context).noTransactions,
            style: TextStyle(color: darkBlueColor),
          ));
        }

        final List<TransactionModel> list = snapshot.data;
        return ListView.builder(
          padding: const EdgeInsets.all(5.0),
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (c, int index) {
//            final transaction = TransactionModel(
//                id: "idad23",
//                date: DateTime.now(),
//                country: "ita",
//                size: 100,
//                transactionType:
//                index.isEven ? TransactionType.EARN : TransactionType.EXPENSE,
//                shop: "Parcheggio");
            return Hero(
              tag: list[index].date,
              child: TicketCard(
                transaction: list[index],
                isForHome: true,
              ),
            );
          },
        );
      },
    );
  }
}

class TransactionsList2 extends StatelessWidget {
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
