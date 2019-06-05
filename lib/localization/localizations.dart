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

  String get lastMovements {
    return Intl.message(
      'Last movements',
      name: 'lastMovements',
      desc: 'last movements with wom (earn, expense)',
    );
  }

  String get noTransactions {
    return Intl.message(
      'There aren\'t transactions',
      name: 'noTransactions',
      desc: 'no transactions',
    );
  }

  String get introTitle1 {
    return Intl.message(
      'Merita i WOM',
      name: 'introTitle1',
      desc: 'title of first intro screen',
    );
  }

  String get introTitle2 {
    return Intl.message(
      'Raccogli i WOM',
      name: 'introTitle2',
      desc: 'title of secondo intro screen',
    );
  }

  String get introTitle3 {
    return Intl.message(
      'Usa i WOM',
      name: 'introTitle3',
      desc: 'title of third intro screen',
    );
  }

  String get introDesc1 {
    return Intl.message(
      'Genera valore sociale con il tuo impegno volontario',
      name: 'introDesc1',
      desc: 'description of first intro screen',
    );
  }

  String get introDesc2 {
    return Intl.message(
      'Guadagna 1 voucher per ogni minuto di impegno',
      name: 'introDesc2',
      desc: 'description of secondo intro screen',
    );
  }

  String get introDesc3 {
    return Intl.message(
      'Ottieni sconti su beni e servizi in cambio dei voucher',
      name: 'introDesc3',
      desc: 'description of third intro screen',
    );
  }

  String get introDoneText {
    return Intl.message(
      'OK',
      name: 'introDoneText',
      desc: 'done text of intro screen',
    );
  }

  String get introSkipText {
    return Intl.message(
      'Salta',
      name: 'introSkipText',
      desc: 'skip text of intro screen',
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