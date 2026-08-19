import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wom_pocket/src/core/my_logger.dart';
import 'package:wom_pocket/src/core/routing/route_extensions.dart';
import 'package:wom_pocket/src/features/exchange/application/exchange_notifier.dart';
import 'package:wom_pocket/src/features/exchange/application/new_exchange_state.dart';

class NewExchangeScreen extends ConsumerWidget {
  final int womCount;

  const NewExchangeScreen({required this.womCount, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(newExchangeProvider(womCount));

    if (state case final NewExchangeStateData state) {
      return ExchangeReceiptScreen(
        data: ExchangeReceiptData(
          link: state.link,
          pin: state.pin,
          womCount: state.womCount,
          fromHome: false,
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: state.when(
        data: (link, pin, womCount) {
          return ExchangeDataWidget(link: link, pin: pin, womCount: womCount);
        },
        loading: () => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'donationInProgress'.tr(),
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
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.error, size: 50, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'somethings_wrong'.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ],
              ),
            ),
          );
        },
        insufficientVouchers: () {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.warning, size: 50, color: Colors.orange),
                  const SizedBox(height: 16),
                  Text(
                    'insufficient_vouchers'.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: state is NewExchangeStateLoading
          ? null
          : FloatingActionButton.extended(
              onPressed: () async {
                context.maybePop();
              },
              label:
                  state is NewExchangeStateError ||
                      state is NewExchangeStateinsufficientVouchers
                  ? Text('back'.tr())
                  : Text('done'.tr()),
            ),
    );
  }
}

class ExchangeReceiptData {
  final String link;
  final String pin;
  final int womCount;
  final bool fromHome;

  ExchangeReceiptData({
    required this.link,
    required this.pin,
    required this.womCount,
    required this.fromHome,
  });
}

class ExchangeReceiptScreen extends ConsumerWidget {
  final ExchangeReceiptData data;

  const ExchangeReceiptScreen({required this.data, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.ios_share),
            color: Colors.white,
            onPressed: () {
              final message = tr(
                'send_exchange_data',
                args: [data.womCount.toString(), data.link, data.pin],
              );
              SharePlus.instance.share(ShareParams(text: message));
            },
          ),
        ],
      ),
      body: ExchangeDataWidget(
        link: data.link,
        pin: data.pin,
        womCount: data.womCount,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: data.fromHome
          ? null
          : FloatingActionButton.extended(
              onPressed: () async {
                context.maybePop();
              },
              label: Text('closeApp'.tr()),
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
    required this.link,
    required this.pin,
    required this.womCount,
    super.key,
    this.backTo = false,
  });

  @override
  Widget build(BuildContext context) {
    logger.i(link);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SizedBox(height: 32),
        Center(
          child: Text(
            '${'donation'.tr()}\n$womCount WOM',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 32),
        Center(
          child: Text(
            'scanToReceiveWOMFromDonation'.tr(),
            style: TextStyle(fontSize: 20, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 32),
        Center(
          child: ColoredBox(
            color: Colors.white,
            child: QrImageView(
              data: link,
              version: QrVersions.auto,
              size: 200.0,
            ),
          ),
        ),
        const SizedBox(height: 32),
        Text(
          'Pin:',
          style: TextStyle(fontSize: 20, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          pin,
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        if (kDebugMode) ...[Text(link)],
      ],
    );
  }
}
