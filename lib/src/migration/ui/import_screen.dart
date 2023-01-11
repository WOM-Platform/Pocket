import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wom_pocket/app.dart';
import 'package:wom_pocket/src/application/pin_notifier.dart';
import 'package:wom_pocket/src/migration/application/import_notifier.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:wom_pocket/src/migration/application/import_state.dart';
import 'package:wom_pocket/src/screens/pin/widgets/keyboard.dart';
import 'package:wom_pocket/src/widgets/my_error.dart';

import '../../utils/colors.dart';

final pageControllerProvider = Provider.autoDispose<PageController>((ref) {
  final p = PageController();
  ref.onDispose(() {
    p.dispose();
  });
  return p;
});

final confirmImportProvider = StateProvider.autoDispose<bool>((_) => true);

final pinControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
  final t = TextEditingController();
  ref.onDispose(() {
    t.dispose();
  });
  return t;
});

class ImportScreen extends ConsumerWidget {
  const ImportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: PageView(
          controller: ref.watch(pageControllerProvider),
          children: [
            PageOne(),
            PageThree(),
          ],
        ),
      ),
    );
  }
}

class PageOne extends ConsumerWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                Image.asset(
                  'assets/images/migration.png',
                  height: 150,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text('Migrazione WOM',
                style: TextStyle(fontSize: 18, color: Colors.white)),
            Text('Importazione guidata',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w600)),
            const SizedBox(
              height: 32,
            ),
            Text(
                'Questa procedura ti consentirà di importare i WOM che hai esportato da un altro borsellino.\n\n'
                'Tieni a portata di mano il PIN inserito per effettuare l\'esportazione. Senza di esso non potrai completare l\'operazione.',
                style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios),
        onPressed: () {
          ref.read(pageControllerProvider).jumpToPage(1);
        },
      ),
    );
  }
}

class PageThree extends ConsumerWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final confirm = ref.watch(confirmImportProvider);
    final importState = ref.watch(importNotifierProvider);
    final pinState = ref.watch(pinNotifierProvider);
    final descStyle = TextStyle(color: Colors.white, fontSize: 18);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: importState.when(
          initial: () {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                // paddin_/**/g: const EdgeInsets.all(16),
                children: [
                  const SizedBox(height: 16),
                  Icon(
                    Icons.security,
                    color: Colors.white,
                    size: 50,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Inserisci il pin utilizzato per eseguire l\'esportazione.',
                    style: descStyle,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: lightBackground,
                        borderRadius: BorderRadius.circular(10)),
                    height: 80,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (int i = 0; i < 4; i++)
                          Expanded(
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1.0, color: Colors.black),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                pinState.pin.length > i
                                    ? pinState.pin[i]
                                    : "  ",
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: Platform.isIOS ? 5 : 8,
                    child: PinKeyboard(),
                  ),
                ],
              ),
            );
          },
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
          error: (ex, st) => MyErrorWidget(ex: ex),
          completed: (womCount) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 80,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Sono stati importati $womCount wom.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
          justImported: () {
            return Center(
              child: Text(
                'Questo backup è stato già importato!',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Annulla',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Spacer(),
          if (importState is! ImportLoading && pinState.pin.length == 4)
            FloatingActionButton.extended(
              label: Text(
                importState is ImportCompleted ||
                        importState is ImportError ||
                        importState is JustImported
                    ? 'Torna alla home'
                    // : importState is ImportError
                    //     ? 'Riprova'
                    : 'Concludi',
              ),
              onPressed: confirm
                  ? () {
                      if (importState is ImportCompleted ||
                          importState is ImportError ||
                          importState is JustImported) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (c) => GateWidget(),
                            ),
                            (route) => false);
                      } else {
                        Alert(
                          context: context,
                          style: AlertStyle(
                              descStyle:
                                  TextStyle(fontSize: 14, color: Colors.grey)),
                          type: AlertType.warning,
                          title:
                              'Confermi di voler importare i WOM di questo backup?',
                          desc: '',
                          buttons: [
                            DialogButton(
                              color: Colors.white,
                              child: Text('Annulla'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            DialogButton(
                              child: Text('Procedi'),
                              onPressed: () {
                                Navigator.pop(context);

                                if (pinState.pin.length != 4) return;
                                ref
                                    .read(importNotifierProvider.notifier)
                                    .importWom(pinState.pin);
                              },
                            )
                          ],
                        ).show();
                      }
                    }
                  : null,
            ),
        ],
      ),
    );
  }
}
