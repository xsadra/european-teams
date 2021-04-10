import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../core/constants/texts.dart';
import '../l10n/messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations);

  // list of locales
  String get appTitle => Intl.message(
        APP_TITLE_VALUE,
        name: APP_TITLE,
      );

  String get club => Intl.message(
        CLUB,
        name: CLUB,
      );

  String get firstMessage => Intl.message(
        FIRST_MESSAGE_VALUE,
        name: FIRST_MESSAGE,
      );

  String get secondMessage => Intl.message(
        SECOND_MESSAGE_VALUE,
        name: SECOND_MESSAGE,
      );
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  final Locale overriddenLocale;

  const AppLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => [EN, DE, PL].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}
