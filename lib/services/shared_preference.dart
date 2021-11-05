import 'dart:convert';
import 'package:detooo_recargas/models/recargas/promotions_model.dart';
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

  static Profile? get profile {
    String? userString = _preference.getString('PROFILE');
    if (userString != null) {
      return Profile.fromJson(jsonDecode(userString));
    }
  }

  static void get deleteProfile {
    _preference.remove('PROFILE');
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

  //!Language ----------------------------------------------------
  static Locale? get language {
    String? lang = _preference.getString('LANGUAGE');
    Locale? locale;
    if (lang != null) {
      locale = Locale(lang);
    }

    return locale;
  }

  static void saveLanguage(Locale language) {
    _preference.setString('LANGUAGE', language.toString());
  }

  //! Testimonials ----------------------------------------------------
  static bool get testimonials => _preference.getBool("TESTIMONIALS") ?? true;

  static void deleteTestimonials() => _preference.remove("TESTIMONIALS");

  static void setTestimonials(bool testimonial) =>
      _preference.setBool('TESTIMONIALS', testimonial);

  //! user Id for register
  static void setUserId(String s) {
    _preference.setString('USERID', s);
  }

  static String? get userId => _preference.getString('USERID');
  static void get removeUserId => _preference.remove('USERID');

  //! list promotions
  static void setPackages(List<Promotions> promotions) {
    List<String> municipiosListString = [];
    for (var promotion in promotions) {
      municipiosListString.add(jsonEncode(promotion.toJson()));
    }
    _preference.setStringList('PROMOTIONS', municipiosListString);
  }

  static List<Promotions>? get promotions {
    List<String>? promotionsString = _preference.getStringList('PROMOTIONS');
    List<Promotions>? municipiosList = [];

    if (promotionsString != null) {
      for (var promotion in promotionsString) {
        municipiosList.add(Promotions.fromJson(jsonDecode(promotion)));
      }
    }
    return municipiosList;
  }

  static void get removePromotions => _preference.remove('PROMOTIONS');
}
