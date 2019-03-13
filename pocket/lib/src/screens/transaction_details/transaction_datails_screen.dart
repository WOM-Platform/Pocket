import 'package:flutter/material.dart';
import "package:flare_flutter/flare_actor.dart";

class TransactionDetailsScreen extends StatefulWidget {
  @override
  _TransactionDetailsScreenState createState() => _TransactionDetailsScreenState();
}

class _TransactionDetailsScreenState extends State<TransactionDetailsScreen> {

  String _animationName = "success";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(title: Text('flare')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: FlareActor(
                    "assets/flare/check.flr",
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    animation: _animationName,
                  ))
            ],
          ),
        ));
  }
}

