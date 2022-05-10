import 'package:dart_wom_connector/dart_wom_connector.dart'
    show ServerException;
import 'package:flutter/widgets.dart';
import 'package:wom_pocket/localization/app_localizations.dart';

extension StringTranslateExtension on String {
  String? translate(BuildContext context) {
    return AppLocalizations.of(context)!.translate(this);
  }
}

extension AppLocalizationsExtension on BuildContext {
  String? translate(String key) {
    return AppLocalizations.of(this)!.translate(key);
  }
}


extension ServerExceptionX on ServerException{

  String? get translationKey {
    final e = type.replaceFirst(typeBase, '');
    if (serverExceptionError.contains(e)) {
      return e.replaceAll('-', '_');
    }
    return null;
  }
}

const typeBase = 'https://wom.social/api/problems/';
const serverExceptionError = [
  'wrong-parameter',
  'request-void',
  'source-not-found',
  'pos-not-found',
  'source-verification-failed',
  'payload-verification-failure',
  'password-unacceptable',
  'otc-not-valid',
  'operation-already-performed',
  'wrong-password',
  'wrong-number-of-vouchers',
  'insufficient-valid-vouchers',
  'unknown-error',
];