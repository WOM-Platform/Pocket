import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/app.dart';
import 'package:wom_pocket/localization/app_localizations.dart';
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
            Text(
              AppLocalizations.of(context)!.translate('womMigration'),
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Text(
              AppLocalizations.of(context)!.translate('importWizard'),
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              AppLocalizations.of(context)!.translate('importWizardDesc'),
              style: TextStyle(color: Colors.white),
            ),
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
                children: [
                  const SizedBox(height: 16),
                  Icon(
                    Icons.security,
                    color: Colors.white,
                    size: 50,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppLocalizations.of(context)!
                        .translate('insertPinToExport'),
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
                    '${AppLocalizations.of(context)!.translate('importedWOM')} $womCount WOM.',
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
                AppLocalizations.of(context)!
                    .translate('backupAlreadyImported'),
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
                AppLocalizations.of(context)!.translate('cancel'),
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
                    ? AppLocalizations.of(context)!.translate('backToHome')
                    : AppLocalizations.of(context)!.translate('conclude'),
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
                          title: AppLocalizations.of(context)!
                              .translate('confirmToImportWom'),
                          desc: '',
                          buttons: [
                            DialogButton(
                              color: Colors.white,
                              child: Text(
                                AppLocalizations.of(context)!
                                    .translate('cancel'),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            DialogButton(
                              child: Text(AppLocalizations.of(context)!
                                  .translate('continue')),
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
