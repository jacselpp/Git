import 'dart:convert';
import 'package:detooo_recargas/models/detooo/sections_model.dart';
import 'package:detooo_recargas/models/recargas/package_model.dart';
import 'package:detooo_recargas/models/recargas/promotions_model.dart';
import 'package:detooo_recargas/models/recargas/testimonials_model.dart';
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
    return municipiosList.isEmpty ? null : municipiosList;
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

  //! user Id for register
  static void setUserId(String s) {
    _preference.setString('USERID', s);
  }

  static String? get userId => _preference.getString('USERID');
  static void get removeUserId => _preference.remove('USERID');

  //! list promotions
  static void setPromotions(List<Promotions> promotions) {
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

  //! list packages
  static void setPackages(List<Item> packages) {
    List<String> packageString = [];
    for (var package in packages) {
      packageString.add(jsonEncode(package.toJson()));
    }
    _preference.setStringList('PACKAGE', packageString);
  }

  static List<Item>? get package {
    List<String>? packageString = _preference.getStringList('PACKAGE');
    List<Item>? packageList = [];

    if (packageString != null) {
      for (var promotion in packageString) {
        packageList.add(Item.fromJson(jsonDecode(promotion)));
      }
    }
    return packageList;
  }

  static void get removePackages => _preference.remove('PACKAGE');

  //! list testimonials
  static void setTestimonials(List<Testimonials> testimonials) {
    List<String> testimonialsListString = [];
    for (var testimonial in testimonials) {
      testimonialsListString.add(jsonEncode(testimonial.toJson()));
    }
    _preference.setStringList('TESTIMONIALS', testimonialsListString);
  }

  static List<Testimonials>? get testimonials {
    List<String>? testimonialsString =
        _preference.getStringList('TESTIMONIALS');
    List<Testimonials>? testimonialsList = [];

    if (testimonialsString != null) {
      for (var testimonial in testimonialsString) {
        testimonialsList.add(Testimonials.fromJson(jsonDecode(testimonial)));
      }
    }
    return testimonialsList;
  }

  //! list Users
  static void setUsers(List<Profile> users) {
    List<String> usersListString = [];
    for (var user in users) {
      usersListString.add(jsonEncode(user.toJson()));
    }
    _preference.setStringList('USERS', usersListString);
  }

  static List<Profile>? get users {
    List<String>? usersString = _preference.getStringList('USERS');
    List<Profile>? usersList = [];

    if (usersString != null) {
      for (var user in usersString) {
        usersList.add(Profile.fromJson(jsonDecode(user)));
      }
    }
    return usersList;
  }

  //! list Terms
  static void setTerms(List<SectionsModel> sections) {
    List<String> termsListString = [];
    for (var user in sections) {
      termsListString.add(jsonEncode(user.toJson()));
    }
    _preference.setStringList('USERS', termsListString);
  }

  static List<SectionsModel>? get getTerms {
    List<String>? sectionsString = _preference.getStringList('USERS');
    List<SectionsModel>? sectionList = [];

    if (sectionsString != null) {
      for (var section in sectionsString) {
        sectionList.add(SectionsModel.fromJson(jsonDecode(section)));
      }
    }

    return sectionList;
  }
}
