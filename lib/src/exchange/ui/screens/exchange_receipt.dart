import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:wom_pocket/localization/app_localizations.dart';
import 'package:wom_pocket/src/exchange/application/exchange_notifier.dart';
import 'package:wom_pocket/src/exchange/application/new_exchange_state.dart';
import 'package:wom_pocket/src/my_logger.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewExchangeScreen extends ConsumerWidget {
  final int womCount;

  const NewExchangeScreen({
    Key? key,
    required this.womCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(newExchangeNotifierProvider(womCount));

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: state.maybeWhen(
        data: (link, pin, womCount) {
          return ExchangeDataWidget(
            link: link,
            pin: pin,
            womCount: womCount,
          );
        },
        orElse: () => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)?.translate('donationInProgress') ??
                  '-',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Center(child: CircularProgressIndicator()),
          ],
        ),
        error: (ex, st) {
          logger.e(ex);
          return Text(
              AppLocalizations.of(context)?.translate('somethings_wrong') ??
                  '-');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: state is NewExchangeStateLoading
          ? null
          : FloatingActionButton.extended(
              onPressed: () async {
                if (state is NewExchangeStateData) {
                  Navigator.of(context).pop();
                } else if (state is NewExchangeStateError) {}
              },
              label: state is NewExchangeStateError
                  ? Text(AppLocalizations.of(context)?.translate('try_again') ??
                      '-')
                  : Text(
                      AppLocalizations.of(context)?.translate('done') ?? '-'),
            ),
    );
  }
}

class ExchangeReceiptScreen extends ConsumerWidget {
  final (String link, String pin, int womCount) data;

  const ExchangeReceiptScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ExchangeDataWidget(
        link: data.$1,
        pin: data.$2,
        womCount: data.$3,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Navigator.of(context).pop();
        },
        label: Text(AppLocalizations.of(context)?.translate('done') ?? '-'),
      ),
    );
  }
}

class ExchangeDataWidget extends StatelessWidget {
  final String link;
  final String pin;
  final int womCount;
  final bool backTo;

  const ExchangeDataWidget({
    super.key,
    required this.link,
    required this.pin,
    required this.womCount,
    this.backTo = false,
  });

  @override
  Widget build(BuildContext context) {
    print(link);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SizedBox(height: 32),
        Center(
          child: Text(
            '${AppLocalizations.of(context)?.translate('donation') ?? '-'}\n$womCount WOM',
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 32),
        Center(
          child: Text(
            AppLocalizations.of(context)
                    ?.translate('scanToReceiveWOMFromDonation') ??
                '-',
            style: TextStyle(fontSize: 20, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 32),
        Center(
          child: Container(
            color: Colors.white,
            child: QrImageView(
              data: link,
              version: QrVersions.auto,
              size: 200.0,
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
          pin,
          style: TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        if (kDebugMode) ...[
          Text(link),
        ]
      ],
    );
  }
}
