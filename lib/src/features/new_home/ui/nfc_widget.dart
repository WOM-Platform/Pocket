import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wom_pocket/src/features/nfc/application/nfc_notifier.dart';

class NfcWidget extends ConsumerWidget {
  const NfcWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(nFCProvider);
    return Padding(
      padding: EdgeInsets.all(8),
      child: Tooltip(
        message: getMessage(state),
        child: Icon(
          switch (state) {
            NFCStateUnavailable() => MdiIcons.nfcVariantOff,
            _ => MdiIcons.nfcVariant,
          },
          color: getColor(state),
          size: 16,
        ),
      ),
    );
  }

  getMessage(NFCState state) {
    return switch (state) {
      NFCStateUnavailable() => 'NFC non disponibile',
      _ => 'NFC attivo',
    };
  }

  getColor(NFCState state) {
    return switch (state) {
      NFCStateData() => Colors.green,
      NFCStateError() => Colors.red,
      NFCStateUnavailable() => Colors.grey,
      _ => Colors.grey,
    };
  }
}
