import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';

import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:wom_pocket/src/core/app/application/app_shell_notifier.dart';

import 'package:wom_pocket/src/core/app/ui/widgets/bottom_navigation_bar.dart';
import 'package:wom_pocket/src/core/models/deep_link_model.dart';
import 'package:wom_pocket/src/core/models/totem_data.dart';
import 'package:wom_pocket/src/core/my_logger.dart';
import 'package:wom_pocket/src/core/routing/route_extensions.dart';
import 'package:wom_pocket/src/core/utils/colors.dart';
import 'package:wom_pocket/src/core/utils/utils.dart';

import 'package:wom_pocket/src/features/nfc/utils.dart';
import 'package:wom_pocket/src/features/totem/utils.dart';

class AppShell extends ConsumerStatefulWidget {
  final Widget navigationShell;

  const AppShell({
    required this.navigationShell,
    super.key,
  });

  @override
  ConsumerState<AppShell> createState() => _AppShellState();
}

class _AppShellState extends ConsumerState<AppShell> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref
          .read(appShellNotifierProvider.notifier)
          .setNavigationShell(widget.navigationShell);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: widget.navigationShell,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: primaryColor,
        label: Text(
          'scan'.tr(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        icon: const Icon(
          Icons.camera_enhance,
          color: Colors.white,
        ),
        onPressed: () => _startScan(context),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }

  _startScan(BuildContext context) async {
    try {
      final link = (await context.push('/scan')) as String?;
      logger.w('_startScan: $link');
      if (link == null) return;
      final totemData = validateTotemQrCodeWithRegex(link);
      final connectionLink = validatePersonalConnection(link);
      final challenge = validateChallenge(link);
      logger.w('_startScan: $link');
      if (challenge != null) {
        final challengeId = getChallengeIdFromLink(link);
        if (challengeId != null) {
          context.push('/badge/challenge/$challengeId');
        }
      } else if (connectionLink != null) {
        launchConnectionDialog(context, link);
      } else if (totemData != null) {
        launchTotemDialog(context, totemData);
      } else {
        final deepLinkModel = DeepLinkModel.fromUri(Uri.parse(link));
        logger.i('wom_scan_done $link');
        logEvent('wom_scan_done');
        if (deepLinkModel.type == TransactionType.MIGRATION_IMPORT) {
          context.go('/import', extra: deepLinkModel);
        } else {
          logger.i('go to pin screen $deepLinkModel');
          context.go('/pin', extra: deepLinkModel);
        }
      }
    } on PlatformException {
      rethrow;
    } on FormatException {
      throw FormatException('scanError'.tr());
    } catch (ex, st) {
      logger.e(st);
      throw ex;
    }
  }
}
