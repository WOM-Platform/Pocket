import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/constants.dart';
import 'package:wom_pocket/localization/app_localizations.dart';
import 'package:wom_pocket/src/application/pin_notifier.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:wom_pocket/src/migration/application/migration_notifier.dart';
import 'package:wom_pocket/src/migration/application/migration_state.dart';
import 'package:wom_pocket/src/migration/data/migration_data.dart';
import 'package:wom_pocket/src/screens/pin/widgets/keyboard.dart';
import 'package:wom_pocket/src/utils/colors.dart';
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

class MigrationScreen extends ConsumerWidget {
  const MigrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(migrationNotifierProvider, (previous, next) {});
    return Scaffold(
      body: PageView(
        controller: ref.watch(pageControllerProvider),
        children: [
          PageOne(),
          PageThree(),
          SummaryPage(),
        ],
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
            Text(AppLocalizations.of(context)!.translate('exportWizard'),
                style: TextStyle(fontSize: 30, color: Colors.white)),
            const SizedBox(
              height: 32,
            ),
            Text(
              AppLocalizations.of(context)!.translate('exportWizardDesc'),
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
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
    final pinState = ref.watch(pinNotifierProvider);
    final descStyle = TextStyle(color: Colors.white, fontSize: 18);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: darkUiOverlayStyle,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: Padding(
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
                  AppLocalizations.of(context)!.translate('createPin'),
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
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(width: 1.0, color: Colors.black),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              pinState.pin.length > i ? pinState.pin[i] : "  ",
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
            if (pinState.pin.length == 4)
              FloatingActionButton(
                child: Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  if (pinState.pin.length != 4) return;
                  ref.read(pageControllerProvider).jumpToPage(2);
                  ref
                      .read(migrationNotifierProvider.notifier)
                      .addPin(pinState.pin);
                },
              ),
          ],
        ),
      ),
    );
  }
}

class SummaryPage extends ConsumerWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final migrationState = ref.watch(migrationNotifierProvider);

    final titleStyle = TextStyle(color: Colors.white, fontSize: 18);
    final descStyle = TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: migrationState.when(
        data: (pin, woms) {
          return SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const SizedBox(height: 16),
                Row(
                  children: [
                    Icon(
                      Icons.cloud_upload,
                      color: Colors.white,
                      size: 50,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      AppLocalizations.of(context)!.translate('export'),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.translate('womToExport'),
                      style: titleStyle,
                    ),
                    const SizedBox(width: 8),
                    Text(woms.length.toString(), style: descStyle),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.translate('chosenPin'),
                      style: titleStyle,
                    ),
                    const SizedBox(width: 8),
                    Text(pin, style: descStyle)
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
            child: Text(
              AppLocalizations.of(context)!.translate('missingData'),
            ),
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
      floatingActionButton: Row(
        children: [
          if (migrationState is MigrationStateComplete)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextButton(
                  onPressed: () {
                    ref.read(pageControllerProvider).jumpToPage(1);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.translate('back'),
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          Spacer(),
          if (migrationState is MigrationStateData)
            FloatingActionButton.extended(
              label: Text(
                AppLocalizations.of(context)!.translate('conclude'),
              ),
              onPressed: () async {
                final res = await Alert(
                  context: context,
                  style: AlertStyle(
                      descStyle: TextStyle(fontSize: 14, color: Colors.grey)),
                  type: AlertType.warning,
                  title: AppLocalizations.of(context)!
                      .translate('confirmToExportWom'),
                  desc: AppLocalizations.of(context)!
                      .translate('confirmToExportWomDesc'),
                  buttons: [
                    DialogButton(
                      color: Colors.white,
                      child: Text(
                        AppLocalizations.of(context)!.translate('cancel'),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                    DialogButton(
                      child: Text(
                        AppLocalizations.of(context)!.translate('continue'),
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        Navigator.of(context).pop(true);
                      },
                    )
                  ],
                ).show();

                if (res ?? false) {
                  ref.read(migrationNotifierProvider.notifier).exportWom();
                }
              },
            ),
        ],
      ),
    );
  }
}
