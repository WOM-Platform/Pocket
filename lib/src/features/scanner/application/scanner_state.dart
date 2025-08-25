import 'package:dart_wom_connector/dart_wom_connector.dart'
    show TransactionType;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:wom_pocket/src/core/models/deep_link_model.dart';
import 'package:wom_pocket/src/core/models/totem_data.dart';
import 'package:wom_pocket/src/core/my_logger.dart';

part 'scanner_state.freezed.dart';

part 'scanner_state.g.dart';

enum ScanAction {
  redeem,
  pay,
  openChallenge,
  importMigration,
  importExchange,
}

/*  //     TransactionType.VOUCHERS => 'scanGetWom'.tr(),
  //     TransactionType.PAYMENT => 'scanPay'.tr(),
  //     TransactionType.MIGRATION_IMPORT => 'scanImportMigration'.tr(),
  //     TransactionType.EXCHANGE_IMPORT => 'scanExchangeImport'.tr(),
  //     _ => 'scanGetWom'.tr()*/

_scanActionFromTransactionType(TransactionType type) {
  return switch (type) {
    TransactionType.VOUCHERS ||
    TransactionType.MIGRATION_EXPORT ||
    TransactionType.EXCHANGE_EXPORT =>
      ScanAction.redeem,
    TransactionType.PAYMENT => ScanAction.pay,
    TransactionType.MIGRATION_IMPORT => ScanAction.redeem,
    TransactionType.EXCHANGE_IMPORT => ScanAction.redeem,
  };
}

@freezed
class ScannerState with _$ScannerState {
  const factory ScannerState.single({
    required String url,
    required int total,
    required ScanAction scanAction,
    TotemData? totemData,
  }) = ScannerStateSingle;

  const factory ScannerState.multiple({required int total}) =
      ScannerStateMultiple;

  const factory ScannerState.processing() = ScannerStateProcessing;

  const factory ScannerState.empty({required int total}) = ScannerStateEmpty;
}

@riverpod
class ScannerNotifier extends _$ScannerNotifier {
  @override
  ScannerState build() {
    return ScannerStateProcessing();
  }

  bool onProcessing(List<Barcode> barcodes) {
    final validQr = <(String, ScanAction)>[];
    for (final qr in barcodes) {
      final rawValue = qr.rawValue;
      if (rawValue != null) {
        final totemData = validateTotemQrCodeWithRegex(rawValue);
        final encryptedTotemData = validatePersonalConnection(rawValue);
        final challenge = validateChallenge(rawValue);
        if (totemData != null || encryptedTotemData != null) {
          validQr.add(
            (rawValue, ScanAction.redeem),
          );
        } else if (challenge != null) {
          validQr.add(
            (challenge, ScanAction.openChallenge),
          );
        } else {
          try {
            final deep = DeepLinkModel.fromUri(Uri.parse(rawValue));
            validQr.add((rawValue, _scanActionFromTransactionType(deep.type)));
          } catch (ex) {}
        }
      }
    }
    logger.i('valid qr ${validQr.length}/${barcodes.length}');
    if (validQr.isEmpty) {
      // Non ci sono qr code validi
      state = ScannerStateEmpty(total: barcodes.length);
      return false;
    } else if (validQr.length > 1) {
      // Troppi qr code validi inquadra meglio
      state = ScannerStateMultiple(total: barcodes.length);
      return true;
    } else {
      // Riscatta wom mostra pulsante
      state = ScannerStateSingle(
        url: validQr.first.$1,
        scanAction: validQr.first.$2,
        total: barcodes.length,
        totemData: validateTotemQrCodeWithRegex(validQr.first.$1),
      );
      return true;
    }
  }

  void reset() {
    state = ScannerStateProcessing();
  }
}
