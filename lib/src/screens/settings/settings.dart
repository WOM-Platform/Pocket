import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info/package_info.dart';
import 'package:wom_pocket/localization/app_localizations.dart';
import 'package:wom_pocket/src/application/aim_notifier.dart';
import 'package:wom_pocket/src/database/extensions.dart';
import 'package:wom_pocket/src/db/app_db.dart';
import 'package:wom_pocket/src/screens/table_page/db_page.dart';
import 'package:wom_pocket/src/utils/config.dart';
import 'package:wom_pocket/src/utils/utils.dart';

import '../../../constants.dart';
import '../../my_logger.dart';
import '../../utils/my_extensions.dart';
import '../migration/migration_screen.dart';

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
//    final SettingsBloc bloc = BlocProvider.of<SettingsBloc>(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.translate('settings_title'),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: <Widget>[
          if (flavor == Flavor.RELEASE) ...[
            ListTile(
              title: Text(context.translate('settings_redeem_demo_title')!),
              subtitle: Text(context.translate('settings_redeem_demo_desc')!),
              trailing: Icon(Icons.arrow_forward_ios),
              contentPadding: EdgeInsets.only(left: 16.0, right: 24.0),
              onTap: () => Utils.launchUrl('https://demo.wom.social/redeem'),
            ),
            ListTile(
              title: Text(context.translate('settings_pay_demo_title')!),
              subtitle: Text(context.translate('settings_pay_demo_desc')!),
              trailing: Icon(Icons.arrow_forward_ios),
              contentPadding: EdgeInsets.only(left: 16.0, right: 24.0),
              onTap: () => Utils.launchUrl('https://demo.wom.social/pay'),
            ),
          ],
          ListTile(
            title: Text(context.translate('settings_info_title')!),
            subtitle: Text(context.translate('settings_info_desc')!),
            trailing: Icon(Icons.arrow_forward_ios),
            contentPadding: EdgeInsets.only(left: 16.0, right: 24.0),
            onTap: () => Utils.launchUrl('https://wom.social'),
          ),
          ListTile(
            title: Text(context.translate('settings_show_intro_title')!),
            subtitle: Text(context.translate('settings_show_intro_desc')!),
            trailing: StatefulBuilder(
              builder: (ctx, setState) {
                return FutureBuilder<bool>(
                  future: Utils.readIsFirstOpen(),
                  builder: (ctx, AsyncSnapshot<bool> value) {
                    if (!value.hasData) {
                      return SizedBox.shrink();
                    }
                    logger.i(value);
                    return Switch(
                      value: value.data!,
                      onChanged: (bool v) async {
                        await Utils.setIsFirstOpen(v);
                        setState(() {});
                      },
                    );
                  },
                );
              },
            ),
            contentPadding: EdgeInsets.only(left: 16.0, right: 24.0),
            onTap: () => Utils.launchUrl(
                'https://${flavor == Flavor.DEVELOPMENT ? 'dev.' : ''}wom.social'),
          ),
          VersionInfo(
            onTap: () {
              setState(() {
                tap++;
              });
            },
          ),
          if (showDBViewer)
            ListTile(
              title: Text('Visita WOM DB'),
              trailing: Icon(Icons.data_usage),
              contentPadding: EdgeInsets.only(left: 16.0, right: 24.0),
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
            title: 'Export woms',
            subtitle: "Migration flow",
            icon: Icons.close,
            onTap: () async {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (c) => MigrationScreen()));
            },
          ),
        ],
      ),
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
        style: TextStyle(fontSize: 18.0, color: Theme.of(context).primaryColor),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12.0, color: Colors.grey),
      ),
      trailing: Icon(
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
          return ListTile(
            title: Text('Versione dell\'app'),
            subtitle: Text(pkg.version),
            trailing: Icon(Icons.info),
            contentPadding: EdgeInsets.only(left: 16.0, right: 24.0),
            onTap: onTap,
          );
        }
        return Container();
      },
    );
  }
}
