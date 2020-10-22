import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter/material.dart';
import 'package:pocket/localization/app_localizations.dart';
import 'package:pocket/src/models/transaction_model.dart';
import 'package:share/share.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  final Function onDelete;
  final Function onEdit;
  final Function onDuplicate;

  const TransactionCard(
      {Key key, this.transaction, this.onDelete, this.onEdit, this.onDuplicate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageCode = AppLocalizations.of(context).locale.languageCode;
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          '${transaction.size} WOM',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        transaction.transactionType == TransactionType.VOUCHERS
                            ? Icons.monetization_on
                            : Icons.credit_card,
                        color: transaction.transactionType ==
                                TransactionType.VOUCHERS
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 2,
                ),
//              Padding(
//                padding: const EdgeInsets.symmetric(vertical: 4.0),
//                child: Text(
//                  transaction.source,
//                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//                  textAlign: TextAlign.start,
//                ),
//              ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
//              mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
//                Spacer(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          ItemRow(
                              t1: 'id', t2: transaction.id?.toString() ?? '-'),
                          ItemRow(t1: 'date', t2: transaction.formatDate()),
                        ],
                      ),
                    ),
//                Spacer(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          ItemRow(
                              t1: 'aim',
                              t2: (transaction?.aim?.titles ??
                                      const {})[languageCode ?? 'en'] ??
                                  '-'),
                          ItemRow(
                              t1: transaction.transactionType !=
                                      TransactionType.VOUCHERS
                                  ? 'pos'
                                  : 'instrument',
                              t2: transaction.source),
                        ],
                      ),
                    ),
//                Spacer(),
                  ],
                ),
                SizedBox(
                  height: 5,
                )
              ],
            ),
          ),
        ),
      ),
      actions: <Widget>[
//        MySlideAction(
//          icon: Icons.map,
//          color: Colors.green,
//          onTap: null,
//        ),
      ],
      secondaryActions: <Widget>[
        MySlideAction(
          icon: Icons.share,
          color: Colors.blue,
          onTap: () {
            Share.share(
                'I ${transaction.transactionType == TransactionType.VOUCHERS ? 'earned' : 'used'} '
                '${transaction.size} WOM  ${transaction.transactionType == TransactionType.VOUCHERS ? 'from' : 'at'} '
                '${transaction.source} ${transaction.aim?.title != null ? 'for ${transaction.aim?.title}' : ''}');
          },
        ),
      ],
    );
  }
}

class ItemRow extends StatelessWidget {
  final String t1;
  final String t2;

  const ItemRow({Key key, this.t1, this.t2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        AutoSizeText(
          ' $t1',
          style: TextStyle(color: Colors.grey),
          maxLines: 1,
          textAlign: TextAlign.start,
        ),
        Expanded(
          child: AutoSizeText(
            ' $t2',
            maxLines: 1,
            minFontSize: 9,
            stepGranularity: 0.1,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class MySlideAction extends StatelessWidget {
  final Function onTap;
  final IconData icon;
  final Color color;
  final String caption;

  const MySlideAction(
      {Key key, this.onTap, this.icon, this.color, this.caption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      color: Colors.transparent,
      child: Card(
        color: color,
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: IconSlideAction(
          caption: caption,
          color: Colors.transparent,
          foregroundColor: Colors.white,
          icon: icon,
          onTap: onTap,
        ),
      ),
    );
    /*return SlideAction(
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        color: Colors.transparent,
        child: Card(
          color: color,
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
      onTap: onTap,
    );*/
  }
}
