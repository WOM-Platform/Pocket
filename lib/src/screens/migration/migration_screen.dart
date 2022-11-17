import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wom_pocket/src/blocs/migration/export_notifier.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'export_screen.dart';

final pageControllerProvider =
    Provider<PageController>((ref) => PageController());

final confirmExportProvider = StateProvider<bool>((_) => false);

final pinControllerProvider = Provider<TextEditingController>((ref) {
  final t = TextEditingController();

  ref.onDispose(() {
    t.dispose();
  });
  return t;
});

class MigrationScreen extends ConsumerWidget {
  const MigrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: PageView(
      controller: ref.watch(pageControllerProvider),
      children: [
        PageOne(),
        PageTwo(),
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
            Text('Migrazione guidata del tuo Pocket',
                style: TextStyle(fontSize: 30, color: Colors.white)),
            const SizedBox(
              height: 32,
            ),
            Text(
                'Eseguendo la procedura guidata potrai trasferire i tuoi wom in '
                'un altro borsellino, questa processo eliminerà tutti i wom '
                'presenti su questo disopsitivo.',
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
    final confirm = ref.watch(confirmExportProvider);
    final pinController = ref.watch(pinControllerProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
                'Inserisci il pin utile a importare i tuoi wom nel nuovo borsellino'),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Tieni memoria del tuo PIN altrimenti non potrai recuperare i tuoi WOM'),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                ref.read(confirmExportProvider.notifier).state = !confirm;
              },
              child: Row(
                children: [
                  Checkbox(
                      value: confirm,
                      onChanged: (value) {
                        if (value == null || value == confirm) return;
                        ref.read(confirmExportProvider.notifier).state = value;
                      }),
                  Flexible(
                    child: Text(
                        'Confermo di voler esportare tutti i tuoi wom ed elimnarli da questo dispositivo'),
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
                  title: 'Confermi di voler esportare i tuoi WOM?',
                  desc: 'Continuando perderai i tuoi WOM localmente',
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
                      onPressed: () async{
                        Navigator.pop(context);
                       try{
                         await ref
                             .read(exportNotifierProvider.notifier)
                             .exportWom(pinController.text.trim());
                         Navigator.of(context).pushAndRemoveUntil(
                             MaterialPageRoute(
                                 builder: (c) => MigrationExportScreen()),
                                 (route) => false);
                       }catch(ex){

                       }
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
