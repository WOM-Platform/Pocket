import 'package:easy_localization/easy_localization.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:package_info/package_info.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:wom_pocket/src/core/application/aim_notifier.dart';
import 'package:wom_pocket/src/core/ui/widgets/my_appbar.dart';
import 'package:wom_pocket/src/features/settings/table_page/db_page.dart';
import 'package:wom_pocket/src/features/totem/ui/totem_scans_screen.dart';
import 'package:wom_pocket/src/core/log_output.dart';
import 'package:wom_pocket/src/features/root/widgets/wom_stats_widget.dart';
import 'package:wom_pocket/src/features/intro/intro.dart';
import 'package:wom_pocket/src/core/utils/utils.dart';

import 'package:wom_pocket/src/core/constants.dart';
import 'package:wom_pocket/src/features/migration/ui/migration_screen.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool current = false;

  bool get showDBViewer => tap > 6;

  int tap = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PocketAppBar(),
      body: ListView(
        children: <Widget>[
          SettingSectionTitle(
            text: 'WOM'.tr(),
            desc: 'settings.cmi.desc'.tr(),
          ),
          SettingsItem(
            title: 'settings_redeem_demo_title'.tr(),
            subtitle: 'settings_redeem_demo_desc'.tr(),
            icon: Icons.monetization_on,
            // contentPadding: EdgeInsets.only(left: 16.0, right: 24.0),
            onTap: () => Utils.launchURL('https://demo.wom.social/redeem'),
          ),
          SettingsItem(
            title: 'settings_pay_demo_title'.tr(),
            subtitle: 'settings_pay_demo_desc'.tr(),
            icon: Icons.credit_card,
            // contentPadding: EdgeInsets.only(left: 16.0, right: 24.0),
            onTap: () => Utils.launchURL('https://demo.wom.social/pay'),
          ),
          if (showDBViewer)
            SettingsItem(
              title: 'Visita WOM DB',
              subtitle: '',
              icon: Icons.data_usage,
              // contentPadding: EdgeInsets.only(left: 16.0, right: 24.0),
              onTap: () async {
                final woms =
                    await ref.read(getDatabaseProvider).womsDao.getAllWoms;
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        WomDbTablePage(woms: woms),
                  ),
                );
              },
            ),
          SettingsItem(
            title: 'exportYourWomTitle'.tr(),
            subtitle: 'exportYourWomDesc'.tr(),
            icon: Icons.backup,
            onTap: () async {
              final count = await ref.read(
                totalWomCountProvider.future,
              );
              if (count > 0) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => MigrationScreen()));
              } else {
                Alert(
                  context: context,
                  type: AlertType.warning,
                  title: 'settings.wom.migration.no_wom'.tr(),
                  buttons: [],
                ).show();
              }
            },
          ),
          SettingSectionTitle(
            text: 'settings.cmi.title'.tr(),
            desc: 'settings.cmi.desc'.tr(),
          ),
          SettingsItem(
            title: 'settings.cmi.totem_title'.tr(),
            subtitle: 'settings.cmi.totem_desc'.tr(),
            icon: Icons.list,
            onTap: () async {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TotemScansScreen(),
                ),
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: Hive.box('settings').listenable(),
            builder: (context, box, _) {
              final gender = box.get('gender');
              String title = 'removeGenderInfoTitle'.tr();
              String desc = 'removeGenderInfoDescription'.tr();
              if (gender == null) {
                title = 'genderNotSetTitle'.tr();
                desc = 'genderNotSetDescription'.tr();
              }
              return SettingsItem(
                title: title,
                subtitle: desc,
                icon: MdiIcons.genderMaleFemale,
                onTap: gender == null
                    ? null
                    : () async {
                        Hive.box('settings').delete('gender');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('genderInfoRemoved'.tr()),
                          ),
                        );
                      },
              );
            },
          ),
          SettingSectionTitle(
            text: 'App',
            desc: 'settings.app.desc'.tr(),
          ),
          SettingsItem(
            title: 'settings_show_intro_title'.tr(),
            subtitle: 'settings_show_intro_desc'.tr(),
            icon: Icons.question_mark,
            // trailing: StatefulBuilder(
            //   builder: (ctx, setState) {
            //     return FutureBuilder<bool>(
            //       future: Utils.readIsFirstOpen(),
            //       builder: (ctx, AsyncSnapshot<bool> value) {
            //         if (!value.hasData) {
            //           return SizedBox.shrink();
            //         }
            //         logger.i(value);
            //         return Switch(
            //           value: value.data!,
            //           onChanged: (bool v) async {
            //             await Utils.setIsFirstOpen(v);
            //             setState(() {});
            //           },
            //         );
            //       },
            //     );
            //   },
            // ),
            // contentPadding: EdgeInsets.only(left: 16.0, right: 24.0),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => IntroScreen(
                    fromSettings: true,
                  ),
                ),
              );
            },
          ),
          SettingsItem(
            title: 'settings.app.language_title'.tr(),
            subtitle: 'settings.app.language_desc'.tr(),
            icon: Icons.language,
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => LanguageSelectorDialog(),
              );
            },
          ),
          SettingsItem(
            title: 'settings_info_title'.tr(),
            subtitle: 'settings_info_desc'.tr(),
            icon: Icons.info,
            // contentPadding: EdgeInsets.only(left: 16.0, right: 24.0),
            onTap: () => Utils.launchURL('https://wom.social'),
          ),
          SettingsItem(
            title: 'Privacy Policy',
            subtitle: '',
            icon: Icons.privacy_tip_outlined,
            // contentPadding: EdgeInsets.only(left: 16.0, right: 24.0),
            onTap: () => Utils.launchURL('https://wom.social/privacy/pocket'),
          ),
          VersionInfo(
            onTap: () {
              setState(() {
                tap++;
              });
            },
          ),
          if (isDev || kDebugMode) ...[
            SettingSectionTitle(text: 'Developer options'),
            SettingsItem(
              title: 'Clear DB (only for debug)',
              subtitle: 'Delete all data of local database',
              icon: Icons.delete,
              onTap: () async {
                ref.read(getDatabaseProvider).deleteEverything();
              },
            ),
            SettingsItem(
              title: 'Show logs',
              subtitle: 'Go to logs screen',
              icon: Icons.bug_report,
              onTap: () async {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => LogOutputScreen()));
              },
            ),
          ],
          const SizedBox(height: 48),
        ],
      ),
    );
  }

  Future<void> _clearTutorial(context) async {
    await FeatureDiscovery.clearPreferences(
      context,
      const <String>{
        t_scan,
        t_home,
        t_offers,
        t_settings,
      },
    );
  }
}

class SettingsItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? icon;
  final VoidCallback? onTap;

  const SettingsItem({
    required this.title,
    required this.subtitle,
    Key? key,
    this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    TextStyle whiteText = const TextStyle(color: Colors.white);

    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18.0,
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12.0, color: Colors.grey),
      ),
      leading: Icon(
        icon,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

class SettingSectionTitle extends StatelessWidget {
  final String text;
  final String? desc;

  const SettingSectionTitle({required this.text, super.key, this.desc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Text(
            text,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          if (desc != null && desc!.isNotEmpty) Text(desc!),
          Divider(),
        ],
      ),
    );
  }
}

class VersionInfo extends StatelessWidget {
  final Function()? onTap;

  const VersionInfo({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final pkg = snapshot.data!;
          return SettingsItem(
            title: 'settings.app.version'.tr(),
            subtitle: pkg.version,
            icon: Icons.perm_device_info,
            onTap: onTap,
          );
        }
        return Container();
      },
    );
  }
}

class LanguageSelectorDialog extends StatelessWidget {
  const LanguageSelectorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'selectLanguage'.tr(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            for (final l in context.supportedLocales)
              Row(
                children: [
                  RadioMenuButton(
                    value: l,
                    groupValue: context.locale,
                    onChanged: (val) {
                      if (val == null) return;
                      context.setLocale(val);
                      Navigator.of(context).pop();
                    },
                    child: Text(l.languageCode.tr()),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
