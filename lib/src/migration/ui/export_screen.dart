import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:wom_pocket/app.dart';
import 'package:wom_pocket/src/migration/application/export_notifier.dart';
import 'package:wom_pocket/src/migration/application/import_notifier.dart';
import 'package:wom_pocket/src/migration/data/migration_data.dart';
import 'package:wom_pocket/src/migration/ui/import_screen.dart';
import 'package:wom_pocket/src/models/deep_link_model.dart';
import 'package:wom_pocket/src/screens/home/home_screen.dart';
import 'package:wom_pocket/src/screens/pin/pin_screen.dart';

import '../../../constants.dart';

// final deepModelProvider =
//     Provider<DeepLinkModel>((_) => throw UnimplementedError());

class MigrationExportScreen extends ConsumerWidget {
  final MigrationData data;

  const MigrationExportScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final exportStateAsync = ref.watch(exportNotifierProvider(pin));/**/
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 32),
            Center(
              child: Text(
                'Esportazione borsellino',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: Text(
                'Scansione il QrCode con il nuovo Pocket',
                style: TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: GestureDetector(
                onTap: () {
                  if (kDebugMode) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (c) => ProviderScope(
                          overrides: [
                            deeplinkProvider.overrideWithValue(
                              DeepLinkModel.fromUri(Uri.parse(data.link)),
                            ),
                            importNotifierProvider,
                          ],
                          child: ImportScreen(),
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  color: Colors.white,
                  child: QrImage(
                    data: data.link,
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (kDebugMode) ...[
              Text(data.code),
              Text(data.link),
              ElevatedButton(
                onPressed: () {
                  Hive.box<MigrationData>(boxMigrationKey)
                      .delete(exportedMigrationDataKey);
                },
                child: Text('Clear cache'),
              ),
            ]
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await Hive.box<MigrationData>(boxMigrationKey)
                .delete(exportedMigrationDataKey);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (c) => GateWidget(),
                ),
                (route) => false);
          },
          label: Text('Torna alla home'),
        ),
      ),
    );
    /* return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: exportStateAsync.when(
        loading: () {
          return Center(
            child: Column(
              children: [
                Text('Processing...'),

                if (kDebugMode)
                  ElevatedButton(
                    onPressed: () {
                      Hive.box<MigrationData>(boxMigrationKey)
                          .delete(exportedMigrationDataKey);
                    },
                    child: Text('Clear cache'),
                  ),
              ],
            ),
          );
        },
        data: (data) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const SizedBox(height: 32),
              Center(
                child: Text(
                  'Esportazione borsellino',
                  style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: Text(
                  'Scansione il QrCode con il nuovo Pocket',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: GestureDetector(
                  onTap: () {
                    if (kDebugMode) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (c) => ProviderScope(
                            overrides: [
                              deepModelProvider.overrideWithValue(
                                DeepLinkModel.fromUri(Uri.parse(data.link)),
                              ),
                              importNotifierProvider,
                            ],
                            child: ImportScreen(),
                          ),
                        ),
                      );
                    }
                  },
                  child: Container(
                    color: Colors.white,
                    child: QrImage(
                      data: data.link,
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              if (kDebugMode) ...[
                Text(data.code),
                Text(data.link),
                ElevatedButton(
                  onPressed: () {
                    Hive.box<MigrationData>(boxMigrationKey)
                        .delete(exportedMigrationDataKey);
                  },
                  child: Text('Clear cache'),
                ),
              ]
            ],
          );
        },
        error: (ex, st) {
          return Center(child: Text(ex.toString()));
        },
      ),
    );*/
  }
}
