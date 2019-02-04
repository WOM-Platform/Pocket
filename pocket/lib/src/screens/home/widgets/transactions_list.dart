import 'package:pocket/localization/localizations.dart';
import 'package:pocket/src/models/transaction_model.dart';
import 'package:pocket/src/screens/home/home_bloc.dart';
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

        if(snapshot.data.isEmpty){
          return Center(child: Text(AppLocalizations.of(context).noTransactions,style: TextStyle(color: Colors.white),));
        }

        final List<TransactionModel> list = snapshot.data;
        return ListView.builder(
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
            return TicketCard(
              ticket: list[index],
            );
          },
        );
      },
    );
  }
}
