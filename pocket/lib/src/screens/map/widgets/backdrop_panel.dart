/*
// One BackdropPanel is visible at a time. It's stacked on top of the
// the BackdropDemo.
import 'package:flutter/material.dart';

class BackdropPanel extends StatelessWidget {
  const BackdropPanel({
    Key key,
    this.onTap,
    this.onVerticalDragUpdate,
    this.onVerticalDragEnd,
    this.title,
    this.child,
  }) : super(key: key);

  final VoidCallback onTap;
  final GestureDragUpdateCallback onVerticalDragUpdate;
  final GestureDragEndCallback onVerticalDragEnd;
  final Widget title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
//    color: Colors.transparent,
//    elevation: 2.0,
//    borderRadius: const BorderRadius.only(
//    topLeft: Radius.circular(16.0),
//    topRight: Radius.circular(16.0),
//    ),

//    BackdropFilter(
//        filter: new ui.ImageFilter.blur(
//          sigmaX: 6.0,
//          sigmaY: 6.0,
//        ),
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onVerticalDragUpdate: onVerticalDragUpdate,
          onVerticalDragEnd: onVerticalDragEnd,
          onTap: onTap,
          child: Container(

            height: 48.0,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
//                border: Border.all(color: Colors.white, width: 3.5),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                )),
            padding: const EdgeInsetsDirectional.only(start: 16.0, end: 16.0),
            alignment: AlignmentDirectional.centerStart,
            child: DefaultTextStyle(
              style: theme.textTheme.subhead,
              child: Tooltip(
                message: 'Tap to dismiss',
                child: title,
              ),
            ),
          ),
        ),
//        const Divider(height: 1.0),
        Expanded(child: child),
      ],
    );
  }
}*/
