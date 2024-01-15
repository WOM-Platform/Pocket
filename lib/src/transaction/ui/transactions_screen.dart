import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          text: 'transactionInfoEarnTitle'.tr(),
          iconData: Icons.monetization_on,
          color: Colors.green,
          description: 'transactionInfoEarnDesc'.tr(),
        ),
        TransactionTypeInfo(
          text: 'transactionInfoSpendTitle'.tr(),
          iconData: Icons.credit_card,
          color: Colors.red,
          description: 'transactionInfoSpendDesc'.tr(),
        ),
        TransactionTypeInfo(
          text: 'transactionInfoImportTitle'.tr(),
          iconData: Icons.cloud_download,
          color: Colors.green,
          description: 'transactionInfoImportDesc'.tr(),
        ),
        TransactionTypeInfo(
          text: 'transactionInfoExportTitle'.tr(),
          iconData: Icons.cloud_upload,
          color: Colors.red,
          description: 'transactionInfoExportDesc'.tr(),
        ),
        TransactionTypeInfo(
          text: 'transactionInfoSwipeTitle'.tr(),
          iconData: Icons.swipe_rounded,
          color: Colors.grey,
          description: 'transactionInfoSwipeDesc'.tr(),
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
        title: Text('transactions'.tr()),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: primaryColor,
            statusBarIconBrightness: Brightness.light),
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
