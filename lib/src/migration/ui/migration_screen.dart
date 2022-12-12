import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wom_pocket/constants.dart';
import 'package:wom_pocket/src/migration/application/export_notifier.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:wom_pocket/src/migration/application/migration_notifier.dart';
import 'package:wom_pocket/src/migration/application/migration_state.dart';
import 'package:wom_pocket/src/migration/data/migration_data.dart';
import 'package:wom_pocket/src/widgets/my_error.dart';

import 'export_screen.dart';

final pageControllerProvider =
    Provider.autoDispose<PageController>((ref) => PageController());

final confirmExportProvider = StateProvider.autoDispose<bool>((_) => true);

class MyWidget extends ConsumerWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final confirm = ref.watch(confirmExportProvider);
    return Checkbox(
        value: confirm,
        onChanged: (value) {
          if (value == null || value == confirm) return;
          ref.read(confirmExportProvider.notifier).update((state) => !state);
          // OR
          // ref.read(confirmExportProvider.notifier).state = !confirm;
        });
  }
}

final pinControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
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
    ref.listen(migrationNotifierProvider, (previous, next) {});
    ref.listen(pinControllerProvider, (previous, next) {});
    return Scaffold(
        body: PageView(
      controller: ref.watch(pageControllerProvider),
      children: [
        PageOne(),
        PageThree(),
        SummaryPage(),
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

class PageThree extends ConsumerWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final confirm = ref.watch(confirmExportProvider);
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
                ref
                    .read(confirmExportProvider.notifier)
                    .update((state) => !state);
              },
              child: Row(
                children: [
                  /*Checkbox(
                      value: confirm,
                      onChanged: (value) {
                        if (value == null || value == confirm) return;
                        // ref.read(confirmExportProvider.notifier).update((state) => !state);
                      }),*/
                  MyWidget(),
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios),
        onPressed: () {
          if (pinController.text.trim().length != 4) return;
          ref.read(pageControllerProvider).jumpToPage(2);
          ref
              .read(migrationNotifierProvider.notifier)
              .addPin(pinController.text.trim());
        },
      ),
    );
  }
}

class SummaryPage extends ConsumerWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final migrationState = ref.watch(migrationNotifierProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: migrationState.when(
        data: (pin, woms) {
          return SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  'Info migrazione',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Wom da migrare:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      woms.length.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'PIN scelto: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      pin,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        initial: () {
          return Center(
            child: Text('Dati mancanti'),
          );
        },
        error: (ex, st) => MyErrorWidget(
          ex: ex,
        ),
        complete: (MigrationData data) {
          return MigrationExportScreen(
            data: data,
          );
        },
      ),
      floatingActionButton: migrationState is MigrationStateData
          ? FloatingActionButton.extended(
              label: Text('Concludi'),
              onPressed: () async {
                      final res = await Alert(
                        context: context,
                        style: AlertStyle(
                            descStyle:
                                TextStyle(fontSize: 14, color: Colors.grey)),
                        type: AlertType.warning,
                        title: 'Confermi di voler esportare i tuoi WOM?',
                        desc: 'Continuando perderai i tuoi WOM localmente',
                        buttons: [
                          DialogButton(
                            color: Colors.white,
                            child: Text('Annulla'),
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                          ),
                          DialogButton(
                            child: Text('Procedi'),
                            onPressed: () async {
                              Navigator.of(context).pop(true);
                            },
                          )
                        ],
                      ).show();

                      if (res ?? false) {
                        // Navigator.of(context).pushAndRemoveUntil(
                        //     MaterialPageRoute(
                        //       builder: (c) =>
                        //           MigrationExportScreen(data: migrationState.pin),
                        //     ),
                        //     (route) => false);

                        ref
                            .read(migrationNotifierProvider.notifier)
                            .exportWom();
                      }
                    },
            )
          : null,
    );
  }
}
