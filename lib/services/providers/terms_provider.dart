import 'package:detooo_recargas/models/detooo/sections_model.dart';
import 'package:detooo_recargas/services/network/api_detooo.dart';
import 'package:detooo_recargas/utils/handle_errors.dart';
import 'package:flutter/material.dart';

import '../shared_preference.dart';

class TermsProvider extends ChangeNotifier {
  List<SectionsModel> _allSections = [];

  List<SectionsModel> get sections => _allSections;

  Future<void> get fetchSections async {
    final List<SectionsModel>? _listSections = SharedPreference.getTerms;
    if (_listSections != null) {
      setSections(_listSections);
    }
    await APIdetooo.common().readTerms().then((value) {
      setSections(value);
    }).catchError((e) => HandleError.logError(null, e));
  }

  void setSections(List<SectionsModel> allSections) {
    _allSections = allSections;
    SharedPreference.setTerms(allSections);
    notifyListeners();
  }
}
