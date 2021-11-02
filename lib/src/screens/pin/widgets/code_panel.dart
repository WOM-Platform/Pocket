import 'package:flutter/material.dart';

class CodePanel extends StatelessWidget {
  final codeLength;
  final currentLength;
  final borderColor;
  final foregroundColor;
  final H = 30.0;
  final W = 30.0;
  final int status;

  CodePanel(
      {required this.codeLength,
        required this.currentLength,
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