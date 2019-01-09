import 'package:borsellino/src/models/transaction_model.dart';
import 'package:borsellino/src/screens/home/home_bloc.dart';
import 'package:borsellino/src/widgets/voucher_card.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {
  final HomeBloc bloc;

  const TransactionsList({Key key, this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TransactionModel>>(
      stream: bloc.transactions,
      builder: (ctx, snapshot) {
        if (!snapshot.hasData || snapshot.data.length == 0) {
          return Center(child: Text('Non ci sono transazioni',style: TextStyle(color: Colors.white),));
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
