import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pocket/src/blocs/bloc_provider.dart';
import 'package:pocket/src/models/deep_link_model.dart';
import 'package:pocket/src/screens/accept_credits/accept_credits.dart';
import 'package:pocket/src/screens/accept_credits/accept_credits_bloc.dart';
import 'package:pocket/src/screens/pin/pin_bloc.dart';

class PinScreen extends StatelessWidget {

  final DeepLinkModel deepLinkModel;
  PinBloc bloc;

  PinScreen({Key key, @required this.deepLinkModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    print("PinScreen build");
    bloc = BlocProvider.of(context);
    bloc.pinIsVerified.listen((isVerified){
      if(isVerified){
        print("goToCredits");
        goToAcceptCredits(context);
        bloc.setPinIsVerifiedToFalse();
      }
    });

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: <Widget>[
          Expanded(child: Container()),
          Text(
            "Insert PIN",
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          Expanded(child: Container()),
          StreamBuilder<CodeState>(
              stream: bloc.passwordLenght,
              initialData: CodeState(n: 0),
              builder: (ctx, snapshot) {
                return CodePanel(
                  codeLength: 4,
                  currentLength: snapshot.data.n,
                  borderColor: Colors.white,
                  foregroundColor: Colors.transparent,
                  status: snapshot.data.status,
                );
              }),
          Expanded(child: Container()),
          Expanded(
            flex: Platform.isIOS ? 5 : 8,
            child: PinKeyboard(
              bloc: bloc,
              done: (){
                goToAcceptCredits(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  goToAcceptCredits(BuildContext context) {
    var blocProviderScan = BlocProvider(
      bloc: AcceptCreditsBloc(deepLinkModel, bloc.getPin()),
      child: AcceptCredits(),
    );
    Navigator.push(
      context,
      MaterialPageRoute<bool>(builder: (context) => blocProviderScan),
    );
  }
}

const arr = [1, 2, 3, 4, 5, 6, 7, 8, 9];

class PinKeyboard extends StatelessWidget {
  final PinBloc bloc;
  final VoidCallback done;

  const PinKeyboard({Key key, this.bloc, this.done}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final keyboardButtons = arr.map((code) {
      return CodeButton(code: code, onTap: () => bloc.onCodeClick(code));
    }).toList();

    keyboardButtons.add(CodeButton(
      onTap: () => bloc.deleteAllCode(),
      icon: Icons.close,
      iconColor: Colors.red,
    ));
    keyboardButtons.add(CodeButton(code: 0, onTap: () => bloc.onCodeClick(0)));
    keyboardButtons.add(CodeButton(
      onTap: () => done,
      icon: Icons.check,
      iconColor: Colors.green,
    ));

    return Container(
      padding: EdgeInsets.only(left: 0, top: 0),
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
        },
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 1.6,
          mainAxisSpacing: 35,
          padding: EdgeInsets.all(8),
          children: keyboardButtons,
        ),
      ),
    );
  }
}

class CodeButton extends StatelessWidget {
  final int code;
  final PinBloc bloc;
  final IconData icon;
  final VoidCallback onTap;
  final Color iconColor;

  const CodeButton(
      {this.code, Key key, this.bloc, this.onTap, this.icon, this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      highlightColor: Colors.yellow,
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
//        decoration: BoxDecoration(
//            color: Colors.transparent,
//            shape: BoxShape.circle,
//            boxShadow: [
//              BoxShadow(
//                color: Colors.yellow,
//                blurRadius: 10,
//                spreadRadius: 0,
//              )
//            ],
//        ),
        child: Center(
          child: code != null
              ? Text(
                  code.toString(),
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                )
              : Icon(
                  icon,
                  size: 30,
                  color: iconColor,
                ),
        ),
      ),
    );
  }
}

class CodePanel extends StatelessWidget {
  final codeLength;
  final currentLength;
  final borderColor;
  final foregroundColor;
  final H = 30.0;
  final W = 30.0;
  final int status;

  CodePanel(
      {this.codeLength,
      this.currentLength,
      this.borderColor,
      this.foregroundColor,
      this.status = 0})
      : assert(codeLength > 0),
        assert(currentLength >= 0),
        assert(currentLength <= codeLength);

  @override
  Widget build(BuildContext context) {
    var circles = <Widget>[];
    var color = borderColor;

    if (status == 1) {
      color = Colors.green.shade500;
    }
    if (status == 2) {
      color = Colors.red.shade500;
    }

    for (int i = 1; i <= codeLength; i++) {
      if (i > currentLength) {
        circles.add(SizedBox(
            width: W,
            height: H,
            child: Container(
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  border: new Border.all(color: color, width: 2.0),
                  color: foregroundColor),
            )));
      } else {
        circles.add(new SizedBox(
            width: W,
            height: H,
            child: new Container(
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                border: new Border.all(color: color, width: 1.0),
                color: color,
              ),
            )));
      }
    }

    return new SizedBox.fromSize(
      size: new Size(MediaQuery.of(context).size.width, 30.0),
      child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox.fromSize(
                size: new Size(40.0 * codeLength, H),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: circles,
                )),
          ]),
    );
  }
}
