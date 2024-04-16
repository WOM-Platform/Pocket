import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wom_pocket/src/models/totem_data.dart';
import 'package:wom_pocket/src/nfc/application/nfc_notifier.dart';
import 'package:wom_pocket/src/screens/home/widgets/totem_dialog.dart';

class NFCSessionDialog extends ConsumerWidget {
  const NFCSessionDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(nFCNotifierProvider, (previous, next) {
      if (previous is NFCStateListening && next is NFCStateData) {
        Navigator.of(context).pop();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => PopScope(
            canPop: false,
            child: TotemDialog(
              totemData: next.totemData,
            ),
          ),
        );
      }
    });
    final state = ref.watch(nFCNotifierProvider);
    return Dialog(
      child: Container(
        height: 300,
        // constraints: BoxConstraints(maxHeight: 300, minHeight: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (state is NFCStateLoading)
              CircularProgressIndicator()
            else if (state is NFCStateListening)
              Text('Avvicinati al TAG NFC')
            else if (state is NFCStateUnavailable)
              Text('Lettore NFC non disponibile')
            else if (state is NFCStateError) ...[
              Text('Si è verificato un errore'),
              ElevatedButton(
                onPressed: () {
                  ref.read(nFCNotifierProvider.notifier).resume();
                },
                child: Text('Riprova'),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
