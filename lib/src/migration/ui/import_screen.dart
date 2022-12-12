import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wom_pocket/app.dart';
import 'package:wom_pocket/src/migration/application/import_notifier.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:wom_pocket/src/migration/application/import_state.dart';
import 'package:wom_pocket/src/widgets/my_error.dart';

final pageControllerProvider =
    Provider.autoDispose<PageController>((ref) => PageController());

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
    final pinController = ref.watch(pinControllerProvider);
    final importState = ref.watch(importNotifierProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: importState.when(
            initial: () {
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Text(
                      'Inserisci il pin utilizzato per eseguire l\'esportazione.'),
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
                              ref.read(confirmImportProvider.notifier).state =
                                  value;
                            }),
                        Flexible(
                          child:
                              Text('Confermo di voler importare i tuoi wom.'),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            loading: () => Center(
                  child: CircularProgressIndicator(),
                ),
            error: (ex, st) => MyErrorWidget(
                  ex: ex,
                ),
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
            }),
      ),
      floatingActionButton: importState is ImportLoading
          ? null
          : FloatingActionButton.extended(
              label: Text(importState is ImportCompleted ||importState is ImportError
                  ? 'Torna alla home'
                  // : importState is ImportError
                  //     ? 'Riprova'
                      : 'Concludi'),
              onPressed: confirm
                  ? () {
                      if (importState is ImportCompleted ||importState is ImportError ) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (c) => GateWidget(),
                            ),
                            (route) => false);
                      } else if (importState is ImportError) {
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
                                ref
                                    .read(importNotifierProvider.notifier)
                                    .importWom(pinController.text.trim());
                              },
                            )
                          ],
                        ).show();
                      }
                    }
                  : null,
            ),
    );
  }
}
