import 'package:flutter/material.dart';
import 'package:wom_pocket/src/core/models/totem_data.dart';
import 'package:wom_pocket/src/features/root/widgets/totem_dialog.dart';

enum TotemSource { nfc, qrCode }

Future<void> launchTotemDialog(
  BuildContext context,
  TotemData totemData,
  // TotemSource source,
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
