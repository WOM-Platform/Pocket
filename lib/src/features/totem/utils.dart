import 'package:flutter/material.dart';
import 'package:wom_pocket/src/core/models/totem_data.dart';
import 'package:wom_pocket/src/features/root/widgets/totem_dialog.dart';
import 'package:wom_pocket/src/features/totem/ui/my_totem_dialog.dart';

Future<void> launchConnectionDialog(
  BuildContext context,
  String link,
) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => PopScope(
      canPop: false,
      child: MyTotemDialog(
        link: link,
      ),
    ),
  );
}

Future<void> launchTotemDialog(
  BuildContext context,
  TotemData totemData,
) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => PopScope(
      canPop: false,
      child: TotemDialog(
        totemData: totemData,
        // source:source,
      ),
    ),
  );
}
