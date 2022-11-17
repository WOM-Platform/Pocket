import 'package:flutter/material.dart';
import 'package:wom_pocket/src/models/transaction_model.dart';
import 'package:wom_pocket/src/widgets/voucher_card.dart';

class TransactionDetailsScreen extends StatefulWidget {
  final TransactionModel transactionModel;

  const TransactionDetailsScreen({
    Key? key,
    required this.transactionModel,
  }) : super(key: key);

  @override
  _TransactionDetailsScreenState createState() =>
      _TransactionDetailsScreenState();
}

class _TransactionDetailsScreenState extends State<TransactionDetailsScreen> {
//  String _animationName = "success";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 50.0),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          SizedBox(height: 40.0),
          Hero(
            tag: widget.transactionModel!.date!,
            child: TicketCard(
              transaction: widget.transactionModel,
              isForHome: true,
            ),
          ),
          Spacer(),
//          Hero(
//            tag: "qrcode",
//            child: Stack(
//              alignment: Alignment.center,
//              children: <Widget>[
//                getCorners(),
//                Image.asset(
//                  "images/qrcode.png",
//                  width: 140.0,
//                  color: Colors.white,
//                ),
//              ],
//            ),
//          ),
          SizedBox(height: 80.0),
        ],
      ),
    );
  }
}
