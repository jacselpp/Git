import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:detooo_recargas/models/auth/municipios_model.dart';
import 'package:detooo_recargas/models/auth/provincias_model.dart';
import 'package:detooo_recargas/models/auth/user_model.dart';
import 'package:detooo_recargas/app/app_theme.dart';
import 'package:detooo_recargas/models/auth/countries_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static late SharedPreferences _preference;
  static final SharedPreference _instance = SharedPreference._internal();

  static Future initialize() async =>
      _preference = await SharedPreferences.getInstance();

  factory SharedPreference() => _instance;
  SharedPreference._internal();

  static const _appToken = 'APP_TOKEN';
  static const _userKey = 'USER_KEY';
  static const _darkMode = 'DARK_MODE';
  static const _countries = 'COUNTRIES';
  static const _provincias = 'PROVINCIAS';

// Token: ------------------------------------------------------
  static String? get readUserKey => _preference.getString(_userKey);
  static Future saveUserKey(String key) async =>
      await _preference.setString(_userKey, key);
  static get deleteUserKey => _preference.remove(_userKey);

// AppToken: ------------------------------------------------------
  static String? get readAppToken => _preference.getString(_appToken);
  static Future saveAppToken(String token) async =>
      await _preference.setString(_appToken, token);
  static get deleteAppToken => _preference.remove(_appToken);

// Theme: ------------------------------------------------------
  static ThemeData get getDarkMode {
    if (_preference.getBool(_darkMode) != null &&
        _preference.getBool(_darkMode) == true) {
      return AppTheme().darkTheme;
    }
    return AppTheme().lightTheme;
  }

  static Future setDarkMode(bool value) async =>
      await _preference.setBool(_darkMode, value);

//!Countries---------------------------------------------

  static void saveCountries(List<Country> countries) {
    List<String> countriesString = [];
    for (var country in countries) {
      countriesString.add(jsonEncode(country.toJson()));
    }
    _preference.setStringList(_countries, countriesString);
  }

  static List<Country>? get countries {
    List<String>? countriesString = _preference.getStringList(_countries);
    List<Country>? countryList = [];

    if (countriesString != null) {
      for (var country in countriesString) {
        countryList.add(Country.fromJson(jsonDecode(country)));
      }
    }
    return countryList;
  }

//!Provincias---------------------------------------------

  static void saveProvincias(List<Provincias> provincias) {
    List<String> countriesString = [];
    for (var provincia in provincias) {
      countriesString.add(jsonEncode(provincia.toJson()));
    }
    _preference.setStringList(_provincias, countriesString);
  }

  static List<Provincias>? get provincias {
    List<String>? provinciasString = _preference.getStringList(_provincias);
    List<Provincias>? provinciasList = [];

    if (provinciasString != null) {
      for (var provincia in provinciasString) {
        provinciasList.add(Provincias.fromJson(jsonDecode(provincia)));
      }
    }
    return provinciasList;
  }

//!Profile---------------------------------------------
  static void setProfile(Profile value) {
    _preference.setString('PROFILE', jsonEncode(value.toJson()));
  }

  static void get deleteProfile {
    _preference.remove('PROFILE');
  }

  static Profile? get profile {
    String? userString = _preference.getString('PROFILE');
    if (userString != null) {
      return Profile.fromJson(jsonDecode(userString));
    }
  }

//!Municipios---------------------------------------------
  static void setMunicipios(List<Municipios> municipios) {
    List<String> municipiosListString = [];
    for (var municipio in municipios) {
      municipiosListString.add(jsonEncode(municipio.toJson()));
    }
    _preference.setStringList('MUNICIPIOS', municipiosListString);
  }

  static List<Municipios>? get municipios {
    List<String>? municipiosString = _preference.getStringList('MUNICIPIOS');
    List<Municipios>? municipiosList = [];

    if (municipiosString != null) {
      for (var provincia in municipiosString) {
        municipiosList.add(Municipios.fromJson(jsonDecode(provincia)));
      }
    }
    return municipiosList;
  }
}
