//import 'dart:io';
//import 'package:flutter/material.dart';
//import 'package:pocket/src/blocs/bloc_provider.dart' as myBloc;
//import 'package:pocket/src/models/deep_link_model.dart';
//import 'package:pocket/src/screens/pin/widgets/code_panel.dart';
//import 'package:pocket/src/screens/pin/widgets/keyboard.dart';
//import 'package:pocket/src/screens/transacation/transaction_bloc.dart';
//import 'package:pocket/src/screens/transacation/transaction_events.dart';
//import 'package:pocket/src/screens/transacation/transaction_screen.dart';
//import 'package:pocket/src/screens/pin/pin_bloc.dart';
//import 'package:pocket/src/services/transaction_repository.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//
//class PinScreen extends StatelessWidget {
//  final DeepLinkModel deepLinkModel;
//  PinBloc bloc;
//
//  PinScreen({Key key, @required this.deepLinkModel}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    print("PinScreen build");
//    bloc = myBloc.BlocProvider.of<PinBloc>(context);
//    bloc.pinIsVerified.listen((isVerified) {
//      if (isVerified) {
//        print("goToCredits");
//        goToAcceptCredits(context);
//        bloc.setPinIsVerifiedToFalse();
//      }
//    });
//
//    return Scaffold(
//      backgroundColor: Theme.of(context).backgroundColor,
//      body: Column(
//        children: <Widget>[
//          Expanded(child: Container()),
//          Text(
//            "Insert PIN",
//            style: TextStyle(color: Colors.white, fontSize: 20.0),
//          ),
//          Expanded(child: Container()),
//          StreamBuilder<CodeState>(
//              stream: bloc.passwordLenght,
//              initialData: CodeState(n: 0),
//              builder: (ctx, snapshot) {
//                return CodePanel(
//                  codeLength: 4,
//                  currentLength: snapshot.data.n,
//                  borderColor: Colors.white,
//                  foregroundColor: Colors.transparent,
//                  status: snapshot.data.status,
//                );
//              }),
//          Expanded(child: Container()),
//          Expanded(
//            flex: Platform.isIOS ? 5 : 8,
//            child: PinKeyboard(
//              bloc: bloc,
//              done: () {
//                goToAcceptCredits(context);
//              },
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//
//  goToAcceptCredits(BuildContext context) {
//    final pin = bloc.getPin();
////    var blocProviderScan = BlocProvider(
////      bloc: TransactionSummaryBloc(
////        Repository(
////          bloc.getPin(),
////          deepLinkModel,
////        ),
////      ),
////      child: TransactionSummaryScreen(),
////    );
//
//    final repository = TransactionRepository(
//      pin,
//      deepLinkModel,
//    );
//
//    final transactionBloc = TransactionBloc(
//      repository,
//      deepLinkModel.otc,
//    );
//
//    transactionBloc.dispatch(TransactionStarted(deepLinkModel.type));
//
//    final blocProviderTransaction = BlocProvider<TransactionBloc>(
//      bloc: transactionBloc,
//      child: TransactionScreen(),
//    );
//
//    Navigator.push(
//      context,
//      MaterialPageRoute<bool>(builder: (context) => blocProviderTransaction),
//    );
//  }
//}
