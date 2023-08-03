import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:wom_pocket/app.dart';
import 'package:wom_pocket/localization/app_localizations.dart';
import 'package:wom_pocket/src/migration/application/import_notifier.dart';
import 'package:wom_pocket/src/migration/data/migration_data.dart';
import 'package:wom_pocket/src/migration/ui/import_screen.dart';
import 'package:wom_pocket/src/models/deep_link_model.dart';
import 'package:wom_pocket/src/screens/pin/pin_screen.dart';

class MigrationExportScreen extends ConsumerWidget {
  final MigrationData data;
  final bool backTo;

  const MigrationExportScreen({
    Key? key,
    this.backTo = true,
    required this.data,
  }) : super(key: key);

  static final format = DateFormat('dd MMMM yyyy');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: backTo
          ? null
          : AppBar(
              elevation: 0,
              backgroundColor: Theme.of(context).primaryColor,
            ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (backTo) const SizedBox(height: 32),
          Center(
            child: Text(
              AppLocalizations.of(context)!.translate('exportPocket'),
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
              AppLocalizations.of(context)!.translate('exportScan'),
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
                child: QrImageView(
                  data: data.link,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Pin:',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            data.code,
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.translate('recoverBefore'),
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            format.format(data.importDeadline),
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          if (kDebugMode) ...[
            Text(data.link),
          ]
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: backTo
          ? FloatingActionButton.extended(
              onPressed: () async {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (c) => GateWidget(),
                    ),
                    (route) => false);
              },
              label: Text(AppLocalizations.of(context)!.translate('backToHome'),),
            )
          : null,
    );
  }
}
