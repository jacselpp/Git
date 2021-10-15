import 'package:detooo_recargas/services/shared_preference.dart';
import 'package:flutter/cupertino.dart';

class LanguageProvider extends ChangeNotifier {
  Locale? _language;
  bool _notLoaded = true;

  Locale? get language {
    if (_notLoaded) {
      _language = SharedPreference.language;
      _notLoaded = false;
    }

    return _language;
  }

  void setLanguage(Locale language) {
    _language = language;
    SharedPreference.saveLanguage(language);
    notifyListeners();
  }
}
