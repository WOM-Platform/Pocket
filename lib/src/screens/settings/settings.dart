import 'package:flutter/material.dart';
import 'package:pocket/localization/app_localizations.dart';
import 'package:pocket/src/db/app_db.dart';
import 'package:pocket/src/db/wom_db.dart';
import 'package:pocket/src/screens/table_page/db_page.dart';
import 'package:pocket/src/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wom_package/wom_package.dart' show Config, Flavor;
import 'package:package_info/package_info.dart';

class SettingsScreen extends StatelessWidget {
  bool current = false;

  @override
  Widget build(BuildContext context) {
//    final SettingsBloc bloc = BlocProvider.of<SettingsBloc>(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context).translate('settings_title'),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        brightness: Brightness.dark,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Demo'),
            subtitle: Text('Impara ad utilizzare l\'app'),
            trailing: Icon(Icons.arrow_forward_ios),
            contentPadding: EdgeInsets.only(left: 16.0, right: 24.0),
            onTap: () => _launchUrl('https://wom.social/demo/pocket'),
          ),
          ListTile(
            title: Text('Info'),
            subtitle: Text('Visita il nostro sito'),
            trailing: Icon(Icons.arrow_forward_ios),
            contentPadding: EdgeInsets.only(left: 16.0, right: 24.0),
            onTap: () => _launchUrl('https://wom.social'),
          ),
          ListTile(
            title: Text('Mostra l\'intro'),
            subtitle:
                Text('Abilita per visualizzare l\'intro al prossimo avvio'),
            trailing: StatefulBuilder(
              builder: (ctx, setState) {
                return FutureBuilder<bool>(
                  future: Utils.readIsFirstOpen(),
                  builder: (ctx, AsyncSnapshot<bool> value) {
                    if (!value.hasData) {
                      return Container();
                    }
                    print(value);
                    return Switch(
                      value: value.data,
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
            onTap: () => _launchUrl('https://wom.social'),
          ),
          VersionInfo(),
          if (Config.appFlavor == Flavor.DEVELOPMENT) ...[
            ListTile(
              title: Text('Visita WOM DB'),
              trailing: Icon(Icons.data_usage),
              contentPadding: EdgeInsets.only(left: 16.0, right: 24.0),
              onTap: () async {
                final woms = await WomDB.get().getWoms(womStatus: null);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        WomDbTablePage(woms: woms)));
              },
            ),
            SettingsItem(
              title: 'Clear DB (only for debug)',
              subtitle: "Delete all data of local database",
              icon: Icons.delete,
              onTap: () async {
//              final result = await bloc.deleteDB();
//              print("delete: " + result.toString());
                AppDatabase.get().deleteDb();
              },
            ),
            SettingsItem(
              title: 'Close DB and save locally',
              subtitle: "Close DB and save locally",
              icon: Icons.close,
              onTap: () async {
                AppDatabase.get().closeDatabase();
//              final result = await bloc.closeDb();
              },
            ),
          ],

//          SettingsItem(
//            title: 'Reset suggestions',
//            subtitle: "Reset all suggestions in home screen",
//            icon: Icons.refresh,
//            onTap: () {
//              print("reset suggestion");
//            },
//          ),
//          SettingsItem(
//            title: AppLocalizations.of(context).translate('info_about_title'),
//            subtitle: AppLocalizations.of(context).translate('info_about_desc'),
//            icon: Icons.info_outline,
//            onTap: null,
//          ),
//          SettingsItem(
//            subtitle: "Enabled or disabled fake mode",
//            title: "Fake Mode",
//            onTap: null,
//            trailing: StreamBuilder<bool>(
//              stream: bloc.fakeMode,
//              builder: (ctx, snap) {
//                if (!snap.hasData) {
//                  return CircularProgressIndicator();
//                }
//
//                return Switch(
//                  value: snap.data,
//                  onChanged: (status) async {
//                    bloc.setFakeMode(status);
//                    if (fakeData == null) {
//                      fakeData = await DefaultAssetBundle.of(ctx)
//                          .loadString('assets/map_point.json');
//                    }
//                  },
//                );
//              },
//            ),
//          ),
        ],
      ),
    );
  }

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class SettingsItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const SettingsItem(
      {Key key,
      @required this.title,
      @required this.subtitle,
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
  const VersionInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final pkg = snapshot.data;
          return ListTile(
            title: Text('Versione dell\'app'),
            subtitle: Text(pkg.version),
            trailing: Icon(Icons.info),
            contentPadding: EdgeInsets.only(left: 16.0, right: 24.0),
            onTap: null,
          );
          return Row(
            children: <Widget>[
              Text('v. ${pkg.version}'),
            ],
          );
        }
        return Container();
      },
    );
  }
}
