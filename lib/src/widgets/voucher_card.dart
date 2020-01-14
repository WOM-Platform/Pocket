import 'package:pocket/localization/app_localizations.dart';
import 'package:pocket/src/models/transaction_model.dart';
import 'package:pocket/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wom_package/wom_package.dart' show TransactionType;

class TicketCard extends StatelessWidget {
  final TransactionModel transaction;
  final bool isForHome;

  const TicketCard({Key key, this.transaction, this.isForHome = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          print(transaction.toString());
//          Navigator.push(
//            context,
//            MaterialPageRoute<bool>(
//                builder: (context) => TransactionDetailsScreen(
//                      transactionModel: transaction,
//                    )),
//          );
        },
        child: ClipPath(
          clipper: VoucherClipper(10.0),
          child: Material(
            elevation: 2.0,
            shadowColor: shadowColor,
            color: Colors.transparent,
            child: ClipPath(
              clipper: VoucherClipper(12.0),
              child: Card(
                color: Colors.white,
                margin: const EdgeInsets.all(2.0),
                child: isForHome
                    ? _buildTransactionContent(context)
                    : _buildVoucherContent(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildVoucherContent(BuildContext context) {
    TextStyle voucherIdStyle =
        new TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600);

    return Container(
      padding: const EdgeInsets.all(15.0),
      height: 160.0,
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
                text: AppLocalizations.of(context).translate('from'),
                style: TextStyle(color: backgroundColor, fontSize: 20.0),
              ),
              TextSpan(
                text: ' ${transaction.source}',
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

  _buildTransactionContent(BuildContext context) {
    TextStyle voucherIdStyle =
        new TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600);
    bool isEarnTransaction =
        transaction.transactionType == TransactionType.VOUCHERS;
    final languageCode = AppLocalizations.of(context).locale.languageCode;

    return Container(
      height: 160.0,
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
                    transaction.source ?? "",
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: baseIconColor),
                  ),
                  Expanded(child: Container()),
                  Text((transaction?.aim?.titles ??
                          const {})[languageCode ?? 'en'] ??
                      '-'),
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
                    text:
                        "${AppLocalizations.of(context).translate('you')} ${isEarnTransaction ? AppLocalizations.of(context).translate("earned") : AppLocalizations.of(context).translate("used")}",
                    style: TextStyle(
                        fontSize: 22.0,
                        color: isEarnTransaction ? Colors.green : Colors.red,
                        fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                      text: ' ${transaction.size.toString()}',
                      style: TextStyle(
                          fontSize: 22.0,
                          color: isEarnTransaction ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                    text: ' WOM',
                    style: TextStyle(
                        fontSize: 22.0,
                        color: isEarnTransaction ? Colors.green : Colors.red,
                        fontWeight: FontWeight.w400),
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

class AimsRow extends StatelessWidget {
  final String aims;
  Set<String> aimsSet = Set();

  AimsRow({Key key, this.aims}) {
    if (aims != null) {
      final aimsArray = aims.split(',');
      aimsArray.forEach((aim) {
        if (aim.contains('/')) {
          aimsSet.add(aim.split('/')[0]);
        } else {
          aimsSet.add(aim[0]);
        }
      });

      print("macrocategorie: $aimsSet");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: aimsSet.map((s) {
        return Icon(
          aimIcons[int.parse(s)],
          size: 20.0,
          color: baseIconColor,
        );
      }).toList(),
    );
  }
}

const aimIcons = [
  Icons.school,
  Icons.account_balance,
  Icons.map,
  Icons.tablet_android,
];
