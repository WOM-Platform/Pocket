import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pocket/src/blocs/migration/import_notifier.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

final pageControllerProvider =
    Provider<PageController>((ref) => PageController());

final confirmImportProvider = StateProvider<bool>((_) => false);

final pinControllerProvider = Provider<TextEditingController>((ref) {
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
    return Scaffold(
        body: PageView(
      controller: ref.watch(pageControllerProvider),
      children: [
        PageOne(),
        PageThree(),
      ],
    ));
  }
}

class PageOne extends ConsumerWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.green,
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
            Text('Migrazione guidata di importazione',
                style: TextStyle(fontSize: 30, color: Colors.white)),
            const SizedBox(
              height: 32,
            ),
            Text(
                'Questa procedura ti consentirà di importare i WOM che hai esportato da un altro borsellino.',
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

class PageTwo extends ConsumerWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.orange,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios),
        onPressed: () {
          ref.read(pageControllerProvider).jumpToPage(2);
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
    final pinController = ref.watch(pinControllerProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Inserisci il pin utilizzato per eseguire l\'esportazione.'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PinCodeTextField(
                keyboardType: TextInputType.number,
                appContext: context,
                length: 4,
                textStyle: TextStyle(color: Colors.grey),
                obscureText: false,
                // animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                  // borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  // activeColor: Colors.green,
                  // activeFillColor: Colors.pink,
                ),
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: false,
                // errorAnimationController: errorController,
                controller: pinController,
                onCompleted: (v) {
                  print("Completed");
                },
                onChanged: (value) {
                  print(value);
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                ref.read(confirmImportProvider.notifier).state = !confirm;
              },
              child: Row(
                children: [
                  Checkbox(
                      value: confirm,
                      onChanged: (value) {
                        if (value == null || value == confirm) return;
                        ref.read(confirmImportProvider.notifier).state = value;
                      }),
                  Flexible(
                    child: Text('Confermo di voler importare i tuoi wom.'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Concludi'),
        onPressed: confirm
            ? () {
                Alert(
                  context: context,
                  style: AlertStyle(
                      descStyle: TextStyle(fontSize: 14, color: Colors.grey)),
                  type: AlertType.warning,
                  title: 'Confermi di voler importare i WOM di questo backup?',
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
                        ref
                            .read(importNotifierProvider.notifier)
                            .importWom(pinController.text.trim());
                      },
                    )
                  ],
                ).show();
              }
            : null,
      ),
    );
  }
}
