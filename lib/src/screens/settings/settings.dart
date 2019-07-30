import 'package:flutter/material.dart';
import 'package:pocket/src/db/app_db.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final SettingsBloc bloc = BlocProvider.of<SettingsBloc>(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
      ),
      body: ListView(
        children: <Widget>[
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
          SettingsItem(
            title: 'Reset suggestions',
            subtitle: "Reset all suggestions in home screen",
            icon: Icons.refresh,
            onTap: () {
              print("reset suggestion");
            },
          ),
          SettingsItem(
            title: 'Info',
            subtitle: "Get info about this App",
            icon: Icons.info_outline,
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
      trailing: Icon(icon,color: Theme.of(context).primaryColor,),
    );
  }
}
