import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wom_pocket/localization/app_localizations.dart';
import 'package:wom_pocket/src/application/aim_notifier.dart';
import 'package:wom_pocket/src/exchange/ui/screens/exchange_receipt.dart';
import 'package:wom_pocket/src/migration/data/migration_data.dart';
import 'package:wom_pocket/src/migration/ui/export_screen.dart';
import 'package:wom_pocket/src/models/transaction_model.dart';
import 'package:share/share.dart';
import 'package:collection/collection.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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

    final isValidExchange =
        transaction.type == TransactionType.EXCHANGE_EXPORT &&
            !(transaction.pin == null || transaction.link == null);
    final isValidPayment = transaction.type == TransactionType.PAYMENT &&
        transaction.ackUrl != null;
    final isValidMigration =
        transaction.type == TransactionType.MIGRATION_EXPORT &&
            !(transaction.pin == null ||
                transaction.importDeadline == null ||
                transaction.link == null);

    return Slidable(
      key: ValueKey(transaction.id),
      // actionPane: SlidableDrawerActionPane(),
      // actionExtentRatio: 0.25,
      startActionPane: isValidMigration || isValidPayment || isValidExchange
          ? ActionPane(
              motion: const ScrollMotion(),
              extentRatio: 0.3,
              // dismissible: DismissiblePane(
              //   onDismissed: () {},
              // ),
              children: [
                if (isValidMigration)
                  SlidableAction(
                    onPressed: (context) async {
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
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    icon: Icons.qr_code_2,
                  )
                else if (isValidPayment)
                  SlidableAction(
                    onPressed: (context) async {
                      final uri = Uri.parse(transaction.ackUrl!);
                      if (await canLaunchUrl(uri)) {
                        launchUrl(uri);
                      }
                    },
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    icon: Icons.receipt,
                  )
                else if (isValidExchange)
                  SlidableAction(
                    onPressed: (context) async {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ExchangeReceiptScreen(
                            data: (
                              transaction.link!,
                              transaction.pin!,
                              transaction.size
                            ),
                          ),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    icon: Icons.receipt,
                  ),
              ],
            )
          : null,
      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        extentRatio: 0.3,
        children: [
          SlidableAction(
            flex: 2,
            borderRadius: BorderRadius.all(Radius.circular(16)),
            onPressed: (context) async {
              var message = shareMessage(transaction.type);
              if (aim != null) {
                final aimTitle = aim.title(
                    languageCode:
                        AppLocalizations.of(context)!.locale.languageCode);
                message =
                    '$message  ${aimTitle != null ? 'for $aimTitle' : ''}';
              }
              Share.share(message);
            },
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            icon: Icons.share,
          ),
        ],
      ),
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
                            t1: AppLocalizations.of(context)!
                                .translate('backupExpire'),
                            t2: MigrationExportScreen.format
                                .format(transaction.importDeadline!),
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
                                      : AppLocalizations.of(context)!
                                          .translate('device'),
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
    );
  }

  String shareMessage(TransactionType type) {
    return switch (type) {
      TransactionType.VOUCHERS => 'I earned '
          '${transaction.size} WOM  from '
          '${transaction.source}',
      TransactionType.PAYMENT => 'I used '
          '${transaction.size} WOM  at '
          '${transaction.source}',
      TransactionType.MIGRATION_IMPORT => 'I imported '
          '${transaction.size} WOM  from '
          '${transaction.source}',
      TransactionType.MIGRATION_EXPORT => 'I exported '
          '${transaction.size} WOM',
      TransactionType.EXCHANGE_EXPORT => 'Ho donato ${transaction.size} WOM',
      TransactionType.EXCHANGE_IMPORT => 'Ho ricevuto ${transaction.size} WOM',
    };
  }

  IconData icon(TransactionType type) {
    return switch (type) {
      TransactionType.VOUCHERS => Icons.monetization_on,
      TransactionType.PAYMENT => Icons.credit_card,
      TransactionType.MIGRATION_IMPORT => Icons.cloud_download,
      TransactionType.MIGRATION_EXPORT => Icons.cloud_upload,
      TransactionType.EXCHANGE_EXPORT => MdiIcons.handCoin,
      TransactionType.EXCHANGE_IMPORT => MdiIcons.handCoin,
    };
  }

  String getSign(TransactionType type) {
    return switch (type) {
      TransactionType.MIGRATION_IMPORT ||
      TransactionType.VOUCHERS ||
      TransactionType.EXCHANGE_IMPORT =>
        '+',
      TransactionType.PAYMENT ||
      TransactionType.MIGRATION_EXPORT ||
      TransactionType.EXCHANGE_EXPORT =>
        '-',
    };
  }

  Color iconColor(TransactionType type) {
    return switch (type) {
      TransactionType.VOUCHERS ||
      TransactionType.MIGRATION_IMPORT ||
      TransactionType.EXCHANGE_IMPORT =>
        Colors.green,
      TransactionType.PAYMENT ||
      TransactionType.MIGRATION_EXPORT ||
      TransactionType.EXCHANGE_EXPORT =>
        Colors.red,
    };
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
