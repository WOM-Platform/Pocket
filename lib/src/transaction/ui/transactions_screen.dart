import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/localization/app_localizations.dart';
import 'package:wom_pocket/src/screens/home/widgets/transaction_list.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:wom_pocket/src/utils/colors.dart';

import 'transaction_card_info_dialog.dart';

class TransactionInfo extends StatelessWidget {
  const TransactionInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TransactionTypeInfo(
          text: AppLocalizations.of(context)!.translate('transactionInfoEarnTitle'),
          iconData: Icons.monetization_on,
          color: Colors.green,
          description: AppLocalizations.of(context)!.translate('transactionInfoEarnDesc'),
        ),
        TransactionTypeInfo(
          text: AppLocalizations.of(context)!.translate('transactionInfoSpendTitle'),
          iconData: Icons.credit_card,
          color: Colors.red,
          description:
          AppLocalizations.of(context)!.translate('transactionInfoSpendDesc'),
        ),
        TransactionTypeInfo(
          text:  AppLocalizations.of(context)!.translate('transactionInfoImportTitle'),
          iconData: Icons.cloud_download,
          color: Colors.green,
          description:AppLocalizations.of(context)!.translate('transactionInfoImportDesc'),
        ),
        TransactionTypeInfo(
          text:AppLocalizations.of(context)!.translate('transactionInfoExportTitle'),
          iconData: Icons.cloud_upload,
          color: Colors.red,
          description:AppLocalizations.of(context)!.translate('transactionInfoExportDesc'),
        ),
        TransactionTypeInfo(
          text: AppLocalizations.of(context)!.translate('transactionInfoSwipeTitle'),
          iconData: Icons.swipe_rounded,
          color: Colors.grey,
          description:
          AppLocalizations.of(context)!.translate('transactionInfoSwipeDesc'),
        )
      ],
    );
  }
}

class TransactionsScreen extends ConsumerWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transazioni'),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: primaryColor,
          statusBarIconBrightness: Brightness.light
        ),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
              icon: Icon(Icons.info),
              color: Colors.white,
              onPressed: () {
                Alert(context: context, content: TransactionInfo(), buttons: [])
                    .show();
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TransactionsList(
            limit: 10000,
          ),
        ),
      ),
    );
  }
}
