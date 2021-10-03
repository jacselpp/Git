import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Implementation of localized strings for the internal use of this app
/// using the `json` files located in "assets/languages" folder.
///
/// ## Supported languages
///
///  * `es` - Spanish
///  * `en` - English
///
class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static AppLocalizations? of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations);

  late Map<String, String?> _localizedStrings;

  Future<bool> load() async {
    String jsonString = await rootBundle
        .loadString('assets/languages/${locale.languageCode}.json');

    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) => MapEntry(key, value));

    return true;
  }

  /// This method will be called from every widget which needs a localized text:
  ///
  /// ## Examples:
  /// ```dart
  /// AppLocalizations.of(context)!.read('key');
  ///
  /// or defined:
  /// final locale = AppLocalizations.of(context)!;
  /// locale.read('key');
  ///
  /// ```
  String read(String key) => _localizedStrings[key] ?? key;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['es', 'en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
