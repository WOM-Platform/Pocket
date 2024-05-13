import 'package:easy_localization/easy_localization.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:package_info/package_info.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:wom_pocket/src/application/aim_notifier.dart';
import 'package:wom_pocket/src/log_output.dart';
import 'package:wom_pocket/src/nfc/ui/nfc_session_dialog.dart';
import 'package:wom_pocket/src/screens/home/widgets/wom_stats_widget.dart';
import 'package:wom_pocket/src/screens/intro/intro.dart';
import 'package:wom_pocket/src/screens/table_page/db_page.dart';
import 'package:wom_pocket/src/utils/utils.dart';
import 'package:wom_pocket/src/widgets/my_appbar.dart';

import '../../../constants.dart';
import '../../migration/ui/migration_screen.dart';

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
    final titleStyle = TextStyle(fontWeight: FontWeight.bold);
//    final SettingsBloc bloc = BlocProvider.of<SettingsBloc>(context);
    print(flavor);
    print(isDev);
    return Scaffold(
      // backgroundColor: Colors.grey[100],
      appBar: PocketAppBar(),
      body: ListView(
        children: <Widget>[
          SettingsItem(
            title: 'settings_redeem_demo_title'.tr(),
            subtitle: 'settings_redeem_demo_desc'.tr(),
            icon: Icons.monetization_on,
            // contentPadding: EdgeInsets.only(left: 16.0, right: 24.0),
            onTap: () => Utils.launchUri('https://demo.wom.social/redeem'),
          ),
          SettingsItem(
            title: 'settings_pay_demo_title'.tr(),
            subtitle: 'settings_pay_demo_desc'.tr(),
            icon: Icons.credit_card,
            // contentPadding: EdgeInsets.only(left: 16.0, right: 24.0),
            onTap: () => Utils.launchUri('https://demo.wom.social/pay'),
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
                  title: 'Non hai nessun wom da poter migrare!',
                  buttons: [],
                ).show();
              }
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
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('genderInfoRemoved'.tr())));
                        },
                );
              }),
          if (isDev) ...[
            SettingsItem(
              title: 'Clear DB (only for debug)',
              subtitle: "Delete all data of local database",
              icon: Icons.delete,
              onTap: () async {
                // ref.read(getDatabaseProvider).de+
                // AppDatabase.get().deleteDb();
              },
            ),
            SettingsItem(
              title: 'Close DB and save locally',
              subtitle: "Close DB and save locally",
              icon: Icons.close,
              onTap: () async {
                await ref.read(getDatabaseProvider).close();
              },
            ),
            SettingsItem(
              title: 'Show logs',
              subtitle: "Delete all data of local database",
              icon: Icons.delete,
              onTap: () async {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => LogOutputScreen()));
              },
            ),
          ],
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
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => IntroScreen(
                        fromSettings: true,
                      )));
            },
          ),
          SettingsItem(
            title: 'languageSettingsTitle'.tr(),
            subtitle: 'languageSettingsDesc'.tr(),
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
            onTap: () => Utils.launchUri('https://wom.social'),
          ),
          SettingsItem(
            title: 'Privacy Policy',
            subtitle: '',
            icon: Icons.privacy_tip_outlined,
            // contentPadding: EdgeInsets.only(left: 16.0, right: 24.0),
            onTap: () => Utils.launchUri('https://wom.social/privacy/pocket'),
          ),
          VersionInfo(
            onTap: () {
              setState(() {
                tap++;
              });
            },
          ),
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

  const SettingsItem(
      {Key? key,
      required this.title,
      required this.subtitle,
      this.icon,
      this.onTap})
      : super(key: key);

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
            title: 'Versione dell\'app',
            subtitle: pkg.version,
            icon: Icons.perm_device_info,
            // contentPadding: EdgeInsets.only(left: 16.0, right: 24.0),
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
              )
          ],
        ),
      ),
    );
  }
}
