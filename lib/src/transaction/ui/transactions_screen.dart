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
          text: 'Acquisizione',
          iconData: Icons.monetization_on,
          color: Colors.green,
          description: 'L\'operazione con cui aggiungi WOM al tuo borsellino',
        ),
        TransactionTypeInfo(
          text: 'Pagamento',
          iconData: Icons.credit_card,
          color: Colors.red,
          description:
              'L\'operazione con cui bruci i tuoi wom a favore di un bene o servizio offerto da un merchant',
        ),
        TransactionTypeInfo(
          text: 'Importazione',
          iconData: Icons.cloud_download,
          color: Colors.green,
          description:
              'Con questa operazione importi una migrazione precedentemente effettuata',
        ),
        TransactionTypeInfo(
          text: 'Esportazione',
          iconData: Icons.cloud_upload,
          color: Colors.red,
          description:
              'L\'esportazione ti consente di migrare i wom da un dispositivo ad un altro',
        ),
        TransactionTypeInfo(
          text: 'Swipe destro e sinistro',
          iconData: Icons.swipe_rounded,
          color: Colors.grey,
          description:
              'Lo swipe a destra o sinistra su una card permette di accedere a funzionalità extra',
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
