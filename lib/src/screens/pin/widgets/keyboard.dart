import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/src/application/pin_notifier.dart';
import 'package:wom_pocket/src/blocs/pin/bloc.dart';

import 'code_button.dart';

const arr = [1, 2, 3, 4, 5, 6, 7, 8, 9];

class PinKeyboard extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final PinBloc bloc = BlocProvider.of<PinBloc>(context);
    final keyboardButtons = arr.map((code) {
      return CodeButton(code: code,
          onTap: () => ref.read(pinNotifierProvider.notifier).updateCode(code));
    }).toList();

    keyboardButtons.add(CodeButton(
      onTap: () => ref.read(pinNotifierProvider.notifier).deleteAllCode(),
      icon: Icons.close,
      iconColor: Colors.red,
    ));
    keyboardButtons
        .add(CodeButton(code: 0,
        onTap: () => ref.read(pinNotifierProvider.notifier).updateCode(0))
    );
    keyboardButtons.add(CodeButton(
    onTap: null,
    icon: Icons.check,
    iconColor: Colors.green,
    ));

    return Container(
    padding: EdgeInsets.only(left: 0, top: 0),
    child: NotificationListener<OverscrollIndicatorNotification>(
    onNotification: (overscroll) {
    overscroll.disallowGlow();
    return false;
    },
    child: GridView.count(
    crossAxisCount: 3,
    childAspectRatio: 1.6,
    mainAxisSpacing: 10,
    padding: EdgeInsets.all(8),
    children: keyboardButtons
    ,
    )
    ,
    )
    ,
    );
  }
}
