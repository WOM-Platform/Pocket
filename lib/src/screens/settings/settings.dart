import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info/package_info.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:wom_pocket/localization/app_localizations.dart';
import 'package:wom_pocket/src/application/aim_notifier.dart';
import 'package:wom_pocket/src/database/extensions.dart';
import 'package:wom_pocket/src/db/app_db.dart';
import 'package:wom_pocket/src/screens/home/widgets/wom_stats_widget.dart';
import 'package:wom_pocket/src/screens/intro/intro.dart';
import 'package:wom_pocket/src/screens/table_page/db_page.dart';
import 'package:wom_pocket/src/utils/config.dart';
import 'package:wom_pocket/src/utils/utils.dart';
import 'package:wom_pocket/src/widgets/my_appbar.dart';

import '../../../constants.dart';
import '../../migration/ui/migration_screen.dart';
import '../../my_logger.dart';
import '../../utils/my_extensions.dart';

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
    return Scaffold(
      // backgroundColor: Colors.grey[100],
      appBar: PocketAppBar(),
      body: ListView(
        children: <Widget>[
          SettingsItem(
            title: context.translate('settings_redeem_demo_title')!,
            subtitle: context.translate('settings_redeem_demo_desc')!,
            icon: Icons.monetization_on,
            // contentPadding: EdgeInsets.only(left: 16.0, right: 24.0),
            onTap: () => Utils.launchUri('https://demo.wom.social/redeem'),
          ),
          SettingsItem(
            title: context.translate('settings_pay_demo_title')!,
            subtitle: context.translate('settings_pay_demo_desc')!,
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
                    await ref.read(databaseProvider).womsDao.getAllWoms;
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        WomDbTablePage(woms: woms),
                  ),
                );
              },
            ),
          SettingsItem(
            title: 'Esporta i tuoi wom',
            subtitle:
                "Crea un backup dei tuoi wom e importalo in un altro dispositivo",
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
          if (flavor == Flavor.DEVELOPMENT) ...[
            SettingsItem(
              title: 'Clear DB (only for debug)',
              subtitle: "Delete all data of local database",
              icon: Icons.delete,
              onTap: () async {
                // ref.read(databaseProvider).de+
                // AppDatabase.get().deleteDb();
              },
            ),
            SettingsItem(
              title: 'Close DB and save locally',
              subtitle: "Close DB and save locally",
              icon: Icons.close,
              onTap: () async {
                await ref.read(databaseProvider).close();
              },
            ),
          ],
          SettingsItem(
            title: context.translate('settings_show_intro_title')!,
            subtitle: 'Ripercorri le schermate introduttive',
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
            title: 'Abilita il tutorial nella home',
            subtitle: 'Ripercorri il tutorial inziale nella pagina principale',
            icon: Icons.cast_for_education,
            onTap: () {
              _clearTutorial(context);
            },
          ),
          SettingsItem(
            title: context.translate('settings_info_title')!,
            subtitle: context.translate('settings_info_desc')!,
            icon: Icons.info,
            // contentPadding: EdgeInsets.only(left: 16.0, right: 24.0),
            onTap: () => Utils.launchUri('https://wom.social'),
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
