import 'package:detooo_recargas/models/recargas/package_model.dart';
import 'package:flutter/material.dart';

import 'package:detooo_recargas/services/shared_preference.dart';
import 'package:detooo_recargas/services/network/api_recargas.dart';
import 'package:detooo_recargas/models/recargas/promotions_model.dart';

class PackagesProvider extends ChangeNotifier {
  List<Promotions>? _promotions;
  List<Item>? _packages;

  Future<List<Promotions>> get promotions async {
    if (_promotions == null) {
      await fetchPromotions();
    }
    return _promotions!;
  }

  Future<List<Item>> get packages async {
    if (_promotions == null) {
      await fetchPromotions();
    }
    return _packages!;
  }

  List<Promotions> get prom {
    if (_promotions == null) {
      fetchPromotions();
    }
    return _promotions!;
  }

  List<Item> get pack {
    if (_promotions == null) {
      fetchPackages();
    }
    return _packages!;
  }

  fetchPromotions() async {
    List<Promotions>? promotions = SharedPreference.promotions;
    if (promotions == null) {
      APIRecargas.common().readPromotions().then((value) {
        setPromotions(value);
      }).catchError((e) {});
    } else {
      setPromotions(promotions);
      APIRecargas.common().readPromotions().then((value) {
        setPromotions(value);
      }).catchError((e) {});
    }
  }

  fetchPackages() async {
    List<Item>? package = SharedPreference.package;
    if (package == null) {
      APIRecargas.common().readOffers().then((value) {
        setPackages(value.items!);
      }).catchError((e) {});
    } else {
      setPackages(package);
      APIRecargas.common().readOffers().then((value) {
        setPackages(value.items!);
      }).catchError((e) {});
    }
  }

  void setPromotions(List<Promotions> packages) {
    SharedPreference.setPromotions(packages);
    _promotions = packages;
    notifyListeners();
  }

  void setPackages(List<Item> packages) {
    SharedPreference.setPackages(packages);
    _packages = packages;
    notifyListeners();
  }
}
