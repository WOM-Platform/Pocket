import 'package:flutter/widgets.dart';
import 'package:pocket/localization/app_localizations.dart';

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
