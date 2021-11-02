import 'package:flutter/material.dart';

class CodeButton extends StatelessWidget {
  final int? code;
  final IconData? icon;
  final VoidCallback? onTap;
  final Color? iconColor;

  const CodeButton(
      {this.code, Key? key, this.onTap, this.icon, this.iconColor})
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