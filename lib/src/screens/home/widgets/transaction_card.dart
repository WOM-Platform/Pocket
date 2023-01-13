import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wom_pocket/localization/app_localizations.dart';
import 'package:wom_pocket/src/application/aim_notifier.dart';
import 'package:wom_pocket/src/migration/data/migration_data.dart';
import 'package:wom_pocket/src/migration/ui/export_screen.dart';
import 'package:wom_pocket/src/models/transaction_model.dart';
import 'package:share/share.dart';
import 'package:collection/collection.dart';

class TransactionCard extends ConsumerWidget {
  final TransactionModel transaction;
  final Function? onDelete;
  final Function? onEdit;
  final Function? onDuplicate;

  const TransactionCard(
      {Key? key,
      required this.transaction,
      this.onDelete,
      this.onEdit,
      this.onDuplicate})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageCode = AppLocalizations.of(context)!.locale.languageCode;
    final aims = ref.watch(aimNotifierProvider).valueOrNull ?? [];
    final aimCode = transaction.firstAimCode;
    final aim = aims.firstWhereOrNull((element) => element.code == aimCode);
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    transaction.formatDate(),
                    style: TextStyle(color: Colors.grey),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      icon(transaction.type),
                      color: iconColor(transaction.type),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        '${getSign(transaction.type)}${transaction.size} WOM',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 8.0),
                  //   child: Icon(
                  //     icon(transaction.type),
                  //     color: iconColor(transaction.type),
                  //   ),
                  // ),
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
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: <Widget>[
//                           // ItemRow(t1: 'id', t2: transaction.id.toString()),
//                           // ItemRow(t1: 'date', t2: transaction.formatDate()),
//                         ],
//                       ),
//                     ),
//                Spacer(),
                  //TODO formatta la data di scadenza
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        if (transaction.importDeadline != null)
                          ItemRow(
                            t1: 'Scadenza backup',
                            t2: transaction.importDeadline.toString(),
                          ),
                        if ((aim?.titles ?? const {})[languageCode] != null)
                          ItemRow(
                              t1: 'aim',
                              t2: transaction.aimCodes.length > 1
                                  ? transaction.aimCode
                                  : (aim?.titles ?? const {})[languageCode] ??
                                      '-'),
                        if (transaction.source.isNotEmpty)
                          ItemRow(
                              t1: transaction.type == TransactionType.VOUCHERS
                                  ? 'instrument'
                                  : transaction.type == TransactionType.PAYMENT
                                      ? 'pos'
                                      : 'device',
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
      actions: <Widget>[
        if (transaction.type == TransactionType.MIGRATION_EXPORT &&
            !(transaction.pin == null ||
                transaction.importDeadline == null ||
                transaction.link == null))
          MySlideAction(
            icon: Icons.qr_code_2,
            color: Colors.green,
            onTap: () async {
              if (transaction.pin == null ||
                  transaction.importDeadline == null ||
                  transaction.link == null) {
                return;
              }

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => MigrationExportScreen(
                    backTo: false,
                    data: MigrationData(
                      code: transaction.pin!,
                      importDeadline: transaction.importDeadline!,
                      link: transaction.link!,
                    ),
                  ),
                ),
              );
            },
          )
        else if (transaction.type == TransactionType.PAYMENT &&
            transaction.ackUrl != null)
          MySlideAction(
            icon: Icons.receipt,
            color: Colors.orange,
            onTap: () async {
              if (await canLaunch(transaction.ackUrl!)) {
                launch(transaction.ackUrl!);
              }
            },
          )
      ],
      secondaryActions: <Widget>[
        MySlideAction(
          icon: Icons.share,
          color: Colors.blue,
          onTap: () async {
            // final aimCode = transaction.aimCodes.isNotEmpty
            //     ? transaction.aimCodes.first
            //     : null;
            // Aim? aim;
            // if (aimCode != null) {
            //   final aims = await ref.read(aimNotifierProvider.future);
            //   aim = aims.firstWhere((element) => element.code == aimCode);
            // }
            var message = shareMessage(transaction.type);
            if (aim != null) {
              message =
                  '$message  ${aim.title != null ? 'for ${aim.title}' : ''}';
            }
            Share.share(message);
          },
        ),
      ],
    );
  }

  String shareMessage(TransactionType type) {
    switch (type) {
      case TransactionType.VOUCHERS:
        return 'I earned '
            '${transaction.size} WOM  from '
            '${transaction.source}';
      case TransactionType.PAYMENT:
        return 'I used '
            '${transaction.size} WOM  at '
            '${transaction.source}';
      case TransactionType.MIGRATION_IMPORT:
        return 'I imported '
            '${transaction.size} WOM  from '
            '${transaction.source}';
      case TransactionType.MIGRATION_EXPORT:
        return 'I exported '
            '${transaction.size} WOM';
    }
  }

  IconData icon(TransactionType type) {
    switch (type) {
      case TransactionType.VOUCHERS:
        return Icons.monetization_on;
      case TransactionType.PAYMENT:
        return Icons.credit_card;
      case TransactionType.MIGRATION_IMPORT:
        return Icons.cloud_download;
      case TransactionType.MIGRATION_EXPORT:
        return Icons.cloud_upload;
    }
  }

  String getSign(TransactionType type) {
    switch (type) {
      case TransactionType.MIGRATION_IMPORT:
      case TransactionType.VOUCHERS:
        return '+';
      case TransactionType.PAYMENT:
      case TransactionType.MIGRATION_EXPORT:
        return '-';
    }
  }

  Color iconColor(TransactionType type) {
    switch (type) {
      case TransactionType.VOUCHERS:
        return Colors.green;
      case TransactionType.PAYMENT:
        return Colors.red;
      case TransactionType.MIGRATION_IMPORT:
        return Colors.green;
      case TransactionType.MIGRATION_EXPORT:
        return Colors.red;
    }
  }
}

class ItemRow extends StatelessWidget {
  final String? t1;
  final String? t2;

  const ItemRow({Key? key, this.t1, this.t2}) : super(key: key);

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
  final Function? onTap;
  final IconData? icon;
  final Color? color;
  final String? caption;

  const MySlideAction(
      {Key? key, this.onTap, this.icon, this.color, this.caption})
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
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: IconSlideAction(
          caption: caption,
          color: Colors.transparent,
          foregroundColor: Colors.white,
          icon: icon,
          onTap: onTap as void Function()?,
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
