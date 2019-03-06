import 'package:pocket/src/models/deep_link_model.dart';
import 'package:pocket/src/models/transaction_model.dart';
import 'package:pocket/src/models/voucher_model.dart';
import 'package:pocket/src/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TicketCard extends StatelessWidget {
  final TransactionModel transaction;
  final bool isForHome;

  const TicketCard({Key key, this.transaction, this.isForHome = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipPath(
        clipper: VoucherClipper(10.0),
        child: Material(
          elevation: 4.0,
          shadowColor: Color(0x30E5E5E5),
          color: Colors.transparent,
          child: ClipPath(
            clipper: VoucherClipper(12.0),
            child: Container(
              height: 160.0,
              child: Card(
                elevation: 0.0,
                margin: const EdgeInsets.all(2.0),
                child: isForHome
                    ? _buildTransactionContent()
                    : _buildVoucherContent(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildVoucherContent() {
    TextStyle voucherIdStyle =
        new TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600);

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            transaction.formatDate(),
            style: voucherIdStyle,
          ),
          Divider(),
          Text(
            '${transaction.size} wom',
            style: TextStyle(color: Colors.green, fontSize: 30.0),
          ),
          Divider(),
          Text.rich(
            TextSpan(children: <TextSpan>[
              TextSpan(
                text: 'from ',
                style: TextStyle(color: backgroundColor, fontSize: 20.0),
              ),
              TextSpan(
                text: '${transaction.source}',
                style: TextStyle(
                    color: backgroundColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  _buildTransactionContent() {
    TextStyle voucherIdStyle =
        new TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600);

    bool isEarnTransaction =
        transaction.transactionType == TransactionType.VOUCHERS;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    transaction.formatDate(),
                    style: voucherIdStyle,
                  ),
                  Expanded(child: SizedBox()),
                  transaction.transactionType == TransactionType.PAYMENT
                      ? Icon(
                          Icons.payment,
                          color: Colors.red,
                        )
                      : Icon(
                          Icons.monetization_on,
                          color: Colors.green,
                        ),
                ],
              ),
              Expanded(
                child: Container(),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    transaction.source,
                    style: TextStyle(fontSize: 14.0),
                  ),
                  Expanded(child: Container()),
                  isEarnTransaction
                      ? Text(
                          "Road quality monitoring",
                          textAlign: TextAlign.end,
                          style: TextStyle(fontSize: 14.0),
                          maxLines: 2,
                        )
                      : Container(),
                ],
              ),
            ],
          ),
//          Center(child: Text("Hai ${isEarnTransaction ? "ottenuto": "speso"} ${ticket.size.toString()} WOM",style: TextStyle(fontSize: 20.0,color:isEarnTransaction ? Colors.green : Colors.red),)),

          Center(
            child: Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "You ${isEarnTransaction ? "earned" : "used"}",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: isEarnTransaction ? Colors.green : Colors.red),
                  ),
                  TextSpan(
                      text: ' ${transaction.size.toString()}',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: isEarnTransaction ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                    text: ' WOM',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: isEarnTransaction ? Colors.green : Colors.red),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class VoucherClipper extends CustomClipper<Path> {
  final double radius;

  VoucherClipper(this.radius);

  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.addOval(
        Rect.fromCircle(center: Offset(0.0, size.height / 2), radius: radius));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 2), radius: radius));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
