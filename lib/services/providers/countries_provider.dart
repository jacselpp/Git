import 'package:flutter/material.dart';

import 'package:detooo_recargas/models/auth/countries_model.dart';
import 'package:detooo_recargas/services/network/api_countries.dart';

import '../shared_preference.dart';

class CountriesProvider extends ChangeNotifier {
  List<Country> _allCountryList = [];

  Future<List<Country>> get allCountriesList async {
    if (_allCountryList.isEmpty) {
      await fetchAllCountries();
    }
    return _allCountryList;
  }

  List<Country> get allCountries {
    if (_allCountryList.isEmpty) {
      fetchAllCountries();
    }
    return _allCountryList;
  }

  void setAllCountries(List<Country> countries) {
    _allCountryList = countries;
    SharedPreference.saveCountries(countries);
    notifyListeners();
  }

  Future<void> fetchAllCountries() async {
    List<Country>? countriesFromBd = SharedPreference.countries;
    if (countriesFromBd == null) {
      APICountries.common().countriesRead().then((value) {
        setAllCountries(value);
      });
    } else {
      setAllCountries(countriesFromBd);
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
