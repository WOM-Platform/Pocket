import 'package:pocket/src/models/transaction_model.dart';
import 'package:pocket/src/models/voucher_model.dart';
import 'package:pocket/src/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TicketCard extends StatelessWidget {
  final TicketModel ticket;

  const TicketCard({Key key, this.ticket}) : super(key: key);

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
                child: ticket is VoucherModel
                    ? _buildVoucherContent()
                    : _buildTransactionContent(),
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
            "#1212",
            style: voucherIdStyle,
          ),
          Divider(),
          Text('${ticket.size} wom', style: TextStyle(color: Colors.green,fontSize: 30.0),),
          Divider(),
          Text('from ${(ticket as VoucherModel).type}', style: TextStyle(color: backgroundColor,fontSize: 20.0),),
        ],
      ),
    );
  }

  _buildTransactionContent() {
    TextStyle voucherIdStyle =
        new TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600);

    bool isEarnTransaction = (ticket as TransactionModel).transactionType == TransactionType.EARN;
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
                    ticket.formatDate(),
                    style: voucherIdStyle,
                  ),
                  Expanded(child: SizedBox()),
                  (ticket as TransactionModel).transactionType ==
                          TransactionType.EARN
                      ? Icon(
                          Icons.monetization_on,
                          color: Colors.green,
                        )
                      : Icon(
                          Icons.payment,
                          color: Colors.red,
                        ),
                ],
              ),
             Expanded(child: Container(),),
              isEarnTransaction ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "SOURCE",
                    style: TextStyle(fontSize: 14.0),
                  ),
                  Expanded(child: Container()),
                  Text(
                    "AIM|AIM|AIM",
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ) : Container(),
            ],
          ),
          Center(child: Text("Hai ${isEarnTransaction ? "ottenuto": "speso"} ${ticket.size.toString()} WOM",style: TextStyle(fontSize: 20.0,color:isEarnTransaction ? Colors.green : Colors.red),)),
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
