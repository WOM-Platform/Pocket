import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket/src/blocs/pin/bloc.dart';
import 'package:pocket/src/screens/pin/widgets/code_panel.dart';
import 'package:pocket/src/screens/pin/widgets/keyboard.dart';
import 'package:pocket/src/blocs/transaction/bloc.dart';
import 'package:pocket/src/screens/transaction/transaction_screen.dart';
import 'package:pocket/src/services/transaction_repository.dart';

class PinScreen extends StatelessWidget {
  PinBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<PinBloc>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: BlocListener(
        bloc: bloc,
        listener: (BuildContext context, PinState state) {
          if (state is PinVerified) {
            goToAcceptCredits(context, state.pin);
          }
        },
        child: Column(
          children: <Widget>[
            Spacer(),
            Text(
              "Insert PIN",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            Spacer(),
            BlocBuilder(
              bloc: bloc,
              builder: (BuildContext context, PinState state) {
                return CodePanel(
                  codeLength: 4,
                  currentLength: state.pin.length,
                  borderColor: Colors.white,
                  foregroundColor: Colors.transparent,
                  status: state is PinVerified ? 1 : 2,
                );
              },
            ),
            Expanded(
              flex: Platform.isIOS ? 5 : 8,
              child: PinKeyboard(),
            ),
          ],
        ),
      ),
    );
  }

  goToAcceptCredits(BuildContext context, String pin) {
//    var blocProviderScan = BlocProvider(
//      bloc: TransactionSummaryBloc(
//        Repository(
//          bloc.getPin(),
//          deepLinkModel,
//        ),
//      ),
//      child: TransactionSummaryScreen(),
//    );

    final repository = TransactionRepository(
      pin,
      bloc.deepLinkModel,
    );

    final transactionBloc = TransactionBloc(
      repository,
      bloc.deepLinkModel.otc,
    );

    transactionBloc.dispatch(TransactionStarted(bloc.deepLinkModel.type));

    final blocProviderTransaction = BlocProvider<TransactionBloc>(
      builder: (context)=> transactionBloc,
      child: TransactionScreen(),
    );

    Navigator.push(
      context,
      MaterialPageRoute<bool>(builder: (context) => blocProviderTransaction),
    );
  }
}
