import 'package:flutter/material.dart';

import 'package:detooo_recargas/models/auth/countries_model.dart';
import 'package:detooo_recargas/services/network/api_countries.dart';

class CountriesProvider extends ChangeNotifier {
  List<Country> _allCountryList = const [];

  Future<List<Country>> get allCountriesList async {
    if (_allCountryList.isEmpty) {
      await fetchAllCountries();
    }
    return _allCountryList;
  }

  List<Country> get allCountries => _allCountryList;

  void setAllCountries(List<Country> countries) {
    _allCountryList = countries;
    notifyListeners();
  }

  Future<void> fetchAllCountries() async {
    if (_allCountryList.isEmpty) {
      APICountries.common().countriesRead().then((value) {
        setAllCountries(value);
      });
    }
  }

  Future<List<Country>> filterListCountry(
    BuildContext context,
    String query,
  ) async {
    return allCountries
        .where((value) =>
            value.name!.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
  }
}
