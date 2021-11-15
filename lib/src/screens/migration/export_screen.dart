import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pocket/src/blocs/migration/export_notifier.dart';
import 'package:pocket/src/blocs/migration/import_notifier.dart';
import 'package:pocket/src/blocs/migration/migration_data.dart';
import 'package:pocket/src/models/deep_link_model.dart';
import 'package:pocket/src/screens/migration/import_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../constants.dart';

final deepModelProvider =
    Provider<DeepLinkModel>((_) => throw UnimplementedError());

class MigrationExportScreen extends ConsumerWidget {
  const MigrationExportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exportStateAsync = ref.watch(exportNotifierProvider);
    return Scaffold(
      backgroundColor: Colors.green,
      body: exportStateAsync.when(loading: () {
        return Center(
          child: Column(
            children: [
              Text('Processig'),
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
      }, completed: (data) {
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 32),
            Center(
              child: Text(
                'Esportazione borsellino',
                style: TextStyle(fontSize: 30, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: Text(
                'Scasione il QrCode con il nuovo Pocket',
                style: TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: GestureDetector(
                onTap: () {
                  if (kDebugMode) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) => ProviderScope(overrides: [
                              deepModelProvider.overrideWithValue(
                                DeepLinkModel.fromUri(Uri.parse(data.link)),
                              ),
                              importNotifierProvider,
                            ], child: ImportScreen())));
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
      }, error: (ex) {
        return Center(child: Text(ex.toString()));
      }),
    );
  }
}
