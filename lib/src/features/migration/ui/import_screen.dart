import 'dart:io';

import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:go_router/go_router.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:wom_pocket/src/core/models/deep_link_model.dart';
import 'package:wom_pocket/src/core/routing/route_extensions.dart';
import 'package:wom_pocket/src/core/ui/widgets/my_error.dart';
import 'package:wom_pocket/src/core/utils/colors.dart';
import 'package:wom_pocket/src/features/migration/application/import_notifier.dart';
import 'package:wom_pocket/src/features/migration/application/import_state.dart';
import 'package:wom_pocket/src/features/pin/application/pin_notifier.dart';
import 'package:wom_pocket/src/features/pin/widgets/keyboard.dart';

final pageControllerProvider = Provider.autoDispose<PageController>((ref) {
  final p = PageController();
  ref.onDispose(() {
    p.dispose();
  });
  return p;
});

final confirmImportProvider = StateProvider.autoDispose<bool>((_) => true);

final pinControllerProvider = Provider.autoDispose<TextEditingController>((
  ref,
) {
  final t = TextEditingController();
  ref.onDispose(() {
    t.dispose();
  });
  return t;
});

class ImportScreen extends ConsumerWidget {
  final DeepLinkModel deepLinkModel;

  const ImportScreen({required this.deepLinkModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: ref.watch(pageControllerProvider),
          children: [
            PageOne(deepLinkModel: deepLinkModel),
            PageThree(deepLinkModel: deepLinkModel),
          ],
        ),
      ),
    );
  }
}

class PageOne extends ConsumerWidget {
  final DeepLinkModel deepLinkModel;

  const PageOne({Key? key, required this.deepLinkModel}) : super(key: key);

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
                Image.asset('assets/images/migration.png', height: 150),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'womMigration'.tr(),
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Text(
              'importWizard'.tr(),
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'importWizardDesc'.tr(),
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

class ImportSummaryWidget extends ConsumerWidget {
  final List<Aim> aims;
  final String device;
  final int womsCount;
  final int totemsCount;
  final int badgesCount;
  final int challengesCount;

  const ImportSummaryWidget({
    required this.aims,
    required this.device,
    required this.womsCount,
    required this.totemsCount,
    required this.badgesCount,
    required this.challengesCount,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageCode = context.locale.languageCode;
    final titleStyle = TextStyle(color: Colors.white, fontSize: 18);
    final descStyle = TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                Image.asset('assets/images/migration.png', height: 150),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'womMigration'.tr(),
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('source_device'.tr(), style: titleStyle),
                const SizedBox(width: 8),
                Text(device.toString(), style: descStyle),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('wom_to_import'.tr(), style: titleStyle),
                const SizedBox(width: 8),
                Text(womsCount.toString(), style: descStyle),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('scans_to_import'.tr(), style: titleStyle),
                const SizedBox(width: 8),
                Text(totemsCount.toString(), style: descStyle),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('aim_label'.tr(), style: titleStyle),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    aims.map((a) => a.titles[languageCode] ?? '-').join(','),
                    style: descStyle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PageThree extends ConsumerWidget {
  final DeepLinkModel deepLinkModel;

  const PageThree({Key? key, required this.deepLinkModel}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final confirm = ref.watch(confirmImportProvider);
    final importState = ref.watch(importProvider(deepLinkModel));
    final pinState = ref.watch(pinProvider);
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
                  Icon(Icons.security, color: Colors.white, size: 50),
                  const SizedBox(height: 16),
                  Text('insertPinToExport'.tr(), style: descStyle),
                  const SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: lightBackground,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 80,
                    child: Row(
                      children: [
                        for (int i = 0; i < 4; i++)
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                pinState.pin.length > i
                                    ? pinState.pin[i]
                                    : '  ',
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Flexible(flex: Platform.isIOS ? 5 : 8, child: PinKeyboard()),
                ],
              ),
            );
          },
          loading: () => Center(child: CircularProgressIndicator()),
          error: (ex, st) => MyErrorWidget(ex: ex),
          importSummary:
              (totems, woms, aims, _, device, __, badges, challenges) =>
                  ImportSummaryWidget(
                    aims: aims,
                    womsCount: woms.length,

                    totemsCount: totems.length,
                    device: device,
                    badgesCount: badges.length,
                    challengesCount: challenges.length,
                  ),
          completed:
              (
                womCount,
                badgesCount,
                challengesCount,
                totemsCount,
                error,
                stackTrace,
              ) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle, color: Colors.green, size: 80),
                      const SizedBox(height: 16),
                      Text(
                        '${'importedWOM'.tr()} $womCount WOM.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Totem importati $totemsCount.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Badge importati $badgesCount',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        'Challenge importate $challengesCount.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (error != null) ...[
                        Text(
                          'Durante l\'importazione dei totem si è verificato un errore!',
                        ),
                        if (kDebugMode)
                          Text(error.toString() + '\n' + stackTrace.toString()),
                      ],
                    ],
                  ),
                );
              },
          justImported: () {
            return Center(
              child: Text(
                'backupAlreadyImported'.tr(),
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        children: [
          if (importState is! ImportCompleted)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextButton(
                onPressed: () {
                  if (importState is ImportSummary) {
                    ref.read(importProvider(deepLinkModel).notifier).goToPin();
                  } else {
                    context.maybePop();
                  }
                },
                child: Text(
                  importState is ImportSummary ? 'back'.tr() : 'cancel'.tr(),
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
                    ? 'backToHome'.tr()
                    : importState is ImportSummary
                    ? 'conclude'.tr()
                    : 'continue'.tr(),
              ),
              onPressed: confirm
                  ? () {
                      if (importState is ImportCompleted ||
                          importState is ImportError ||
                          importState is JustImported) {
                        context.go('/');
                        // Navigator.of(context).pushAndRemoveUntil(
                        //   MaterialPageRoute(
                        //     builder: (c) => GateWidget(),
                        //   ),
                        //   (route) => false,
                        // );
                      } else if (importState is ImportSummary) {
                        Alert(
                          context: context,
                          style: AlertStyle(
                            descStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          type: AlertType.warning,
                          title: 'confirmToImportWom'.tr(),
                          desc: '',
                          buttons: [
                            DialogButton(
                              color: Colors.white,
                              child: Text('cancel'.tr()),
                              onPressed: () {
                                context.maybePop();
                              },
                            ),
                            DialogButton(
                              child: Text('continue'.tr()),
                              onPressed: () {
                                context.maybePop();
                                ref
                                    .read(
                                      importProvider(deepLinkModel).notifier,
                                    )
                                    .importWom();
                              },
                            ),
                          ],
                        ).show();
                      } else {
                        ref
                            .read(importProvider(deepLinkModel).notifier)
                            .checkImport(pinState.pin);
                      }
                    }
                  : null,
            ),
        ],
      ),
    );
  }
}
