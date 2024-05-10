import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wom_pocket/src/models/totem_data.dart';
import 'package:wom_pocket/src/screens/home/widgets/totem_dialog.dart';

Future<void> launchTotemDialog(
    BuildContext context, TotemData totemData) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => PopScope(
      canPop: false,
      child: TotemDialog(
        totemData: totemData,
      ),
    ),
  );
}
