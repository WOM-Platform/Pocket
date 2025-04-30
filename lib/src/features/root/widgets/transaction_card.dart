import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wom_pocket/app.dart';
import 'package:wom_pocket/src/core/application/aim_notifier.dart';
import 'package:wom_pocket/src/core/routing/route_extensions.dart';
import 'package:wom_pocket/src/features/exchange/ui/screens/exchange_receipt.dart';
import 'package:collection/collection.dart';
import 'package:wom_pocket/src/features/in_app_webview/ui/in_app_webview.dart';
import 'package:wom_pocket/src/features/migration/data/migration_data.dart';
import 'package:wom_pocket/src/features/migration/ui/export_screen.dart';
import 'package:wom_pocket/src/core/models/transaction_model.dart';
import 'package:share/share.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TransactionCard extends ConsumerWidget {
  final TransactionModel transaction;
  final Function? onTap;

  const TransactionCard({
    required this.transaction,
    this.onTap,
    Key? key,
  }) : super(key: key);

  Future share(BuildContext context, Aim? aim) async {
    var message = shareMessage(transaction.type);
    if (aim != null) {
      final aimTitle = aim.title(languageCode: context.locale.languageCode);
      message =
          '$message ${aimTitle != null ? '${tr('home.for')} $aimTitle' : ''}';
    }
    Share.share(message);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageCode = context.locale.languageCode;
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

    return GestureDetector(
      onTap: () async {
        if (isValidPayment) {
          if (transaction.ackUrl != null) {
            context.push('/in-app-webview/${transaction.ackUrl}');
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => InAppWebViewScreen(
            //       url: transaction.ackUrl!,
            //     ),
            //   ),
            // );
          }
        } else if (isValidMigration) {
          if (transaction.pin == null ||
              transaction.importDeadline == null ||
              transaction.link == null) {
            return;
          }

          context.push('${context.sourceRoutePath}/migration', extra: MigrationData(
            code: transaction.pin!,
            importDeadline: transaction.importDeadline!,
            link: transaction.link!,
          ),);

          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (_) => MigrationExportScreen(
          //       backTo: false,
          //       data: ,
          //     ),
          //   ),
          // );
        } else if (isValidExchange) {
          final data = ExchangeReceiptData(
            link: transaction.link!,
            pin: transaction.pin!,
            womCount: transaction.size,
            fromHome: true,
          );

          context.push('${context.sourceRoutePath}/receipt', extra: data);
        }
      },
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
                    padding: const EdgeInsets.only(right: 16.0),
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
                ],
              ),
              Divider(
                height: 2,
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        if (transaction.importDeadline != null)
                          ItemRow(
                            t1: 'backupExpire'.tr(),
                            t2: MigrationExportScreen.format
                                .format(transaction.importDeadline!),
                          ),
                        if ((aim?.titles ?? const {})[languageCode] != null)
                          ItemRow(
                            t1: 'aim',
                            t2: transaction.aimCodes.length > 1
                                ? transaction.aimCode
                                : (aim?.titles ?? const {})[languageCode] ??
                                    '-',
                          ),
                        if (transaction.source.isNotEmpty)
                          ItemRow(
                            t1: transaction.type == TransactionType.VOUCHERS
                                ? 'instrument'
                                : transaction.type == TransactionType.PAYMENT
                                    ? 'pos'
                                    : 'device'.tr(),
                            t2: transaction.source,
                          ),
                      ],
                    ),
                  ),
                  /*PopupMenuButton<CardAction>(
                    // initialValue: selectedItem,
                    icon: const Icon(Icons.more_vert),
                    onSelected: (CardAction item) async {
                      switch (item) {
                        case CardAction.migration:
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
                          break;
                        case CardAction.payment:
                          final uri = Uri.parse(transaction.ackUrl!);
                          if (await canLaunchUrl(uri)) {
                            launchUrl(uri);
                          }
                          break;
                        case CardAction.exchange:
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
                          break;
                        case CardAction.share:
                          share(context, aim);
                          break;
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<CardAction>>[
                      if (isValidMigration)
                        const PopupMenuItem<CardAction>(
                          value: CardAction.migration,
                          child: ListTile(
                            leading: Icon(Icons.qr_code_2),
                            title: Text('Qr-Code'),
                          ),
                        )
                      else if (isValidPayment)
                        const PopupMenuItem<CardAction>(
                          value: CardAction.payment,
                          child: ListTile(
                            leading: Icon(Icons.web),
                            title: Text('Receipt'),
                          ),
                        )
                      else if (isValidExchange)
                        const PopupMenuItem<CardAction>(
                          value: CardAction.exchange,
                          child: ListTile(
                            leading: Icon(Icons.receipt),
                            title: Text('Share'),
                          ),
                        ),
                      const PopupMenuItem<CardAction>(
                        value: CardAction.share,
                        child: ListTile(
                          leading: Icon(Icons.share),
                          title: Text('Share'),
                        ),
                      ),
                    ],
                  ),*/
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String shareMessage(TransactionType type) {
    return switch (type) {
      TransactionType.VOUCHERS => tr(
          'home.vouchers_share_message',
          args: [transaction.size.toString(), transaction.source],
        ),
      TransactionType.PAYMENT => tr(
          'home.payment_share_message',
          args: [transaction.size.toString(), transaction.source],
        ),
      TransactionType.MIGRATION_IMPORT => tr(
          'home.migration_import_share_message',
          args: [transaction.size.toString(), transaction.source],
        ),
      TransactionType.MIGRATION_EXPORT => tr(
          'home.migration_export_share_message',
          args: [transaction.size.toString()],
        ),
      TransactionType.EXCHANGE_EXPORT => tr(
          'home.exchange_export_share_message',
          args: [
            transaction.size.toString(),
          ],
        ),
      TransactionType.EXCHANGE_IMPORT => tr(
          'home.exchange_import_share_message',
          args: [
            transaction.size.toString(),
          ],
        ),
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

enum CardAction {
  migration,
  payment,
  exchange,
  share,
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
