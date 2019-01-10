import 'dart:io';

import 'package:pocket/src/db/app_db.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Impostazioni'),
      ),
      body: ListView(
        children: <Widget>[
          SettingsItem(
            title: 'Clear DB (only for debug)',
            subtitle: "Delete all data of local database",
            icon: Icons.delete,
            onTap: () async {
              final result = await deleteDB();
              print("delete: " + result.toString());
            },
          ),
          SettingsItem(
            title: 'Reset suggestions',
            subtitle: "Reset all suggestions in home screen",
            icon: Icons.refresh,
            onTap: (){
              print("reset suggestion");
            },
          ),
          SettingsItem(
            title: 'Info',
            subtitle: "Get info about this App",
            icon: Icons.info_outline,
            onTap: null,
          ),
        ],
      ),
    );
  }

  Future<bool> deleteDB() async {
    final dir = await getApplicationDocumentsDirectory();
//    final cacheDirPath = p.join(directory.path, );
    print(dir.path);
    if (await dir.exists()) {
      File dbFile = File(dir.path + "/borsellino.db");
      if (await dbFile.exists()) {
        print(dbFile.path);
        await AppDatabase.get().closeDatabase();
        final delDb = await dbFile.delete();
        if (delDb != null) return true;
      }
      return false;
    }
    return true;
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
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12.0, color: Colors.grey),
      ),
      trailing: icon != null
          ? Icon(
              icon,
              color: Colors.white,
            )
          : null,
    );
  }
}
