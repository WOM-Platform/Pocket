import 'package:pocket/app.dart';
import 'package:pocket/src/blocs/bloc_provider.dart';
import 'package:pocket/src/screens/settings/settings_bloc.dart';
import 'package:flutter/material.dart';


class SettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final SettingsBloc bloc = BlocProvider.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          SettingsItem(
            title: 'Clear DB (only for debug)',
            subtitle: "Delete all data of local database",
            trailing: Icon(
              Icons.delete,
              color: Colors.white,
            ),
            onTap: () async {
              final result = await bloc.deleteDB();
              print("delete: " + result.toString());
            },
          ),
          SettingsItem(
            title: 'Reset suggestions',
            subtitle: "Reset all suggestions in home screen",
            trailing: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onTap: () {
              print("reset suggestion");
            },
          ),
          SettingsItem(
            title: 'Info',
            subtitle: "Get info about this App",
            trailing: Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
            onTap: null,
          ),
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
}

class SettingsItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget trailing;
  final VoidCallback onTap;

  const SettingsItem(
      {Key key,
      @required this.title,
      @required this.subtitle,
      this.trailing,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
//    TextStyle whiteText = const TextStyle(color: Colors.white);

    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12.0, color: Colors.grey),
      ),
      trailing: trailing,
    );
  }
}