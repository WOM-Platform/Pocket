import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pocket/l10n/messages_all.dart';


/*
Comand for generate intl file
flutter packages pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/localization/localizations.dart
flutter packages pub run intl_translation:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/localization/localizations.dart lib/l10n/intl_*.arb
*/

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get msg {
    return Intl.message(
      'Hello World',
      name: 'msg',
      desc: 'Title for the Demo application',
    );
  }

  String get title {
    return Intl.message(
      'WOM Pocket',
      name: 'title',
      desc: 'Title for application',
    );
  }

  String get last_movements {
    return Intl.message(
      'Last movements',
      name: 'last_movements',
      desc: 'last movements with wom (earn, expense)',
    );
  }

  String get no_transactions {
    return Intl.message(
      'There aren\'t transactions',
      name: 'no_transactions',
      desc: 'no transactions',
    );
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'it'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}