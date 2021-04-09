import 'package:flutter/material.dart';
import 'package:football/l10n/messages_all.dart';
import 'package:intl/intl.dart';

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
        'all about clubs',
        name: 'appTitle',
      );

  String get club => Intl.message(
        'club',
        name: 'club',
      );

  String get firstMessage => Intl.message(
        ' from xCountry is worth xValue million euros',
        name: 'firstMessage',
      );

  String get secondMessage => Intl.message(
        ' has so far achieved xVictorious victories at European level',
        name: 'secondMessage',
      );
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  final Locale overriddenLocale;

  const AppLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) =>
      ['en', 'de', 'pl'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}
