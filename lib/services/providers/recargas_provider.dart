import 'package:detooo_recargas/models/recargas/package_model.dart';
import 'package:flutter/material.dart';

import 'package:detooo_recargas/services/shared_preference.dart';
import 'package:detooo_recargas/services/network/api_recargas.dart';
import 'package:detooo_recargas/models/recargas/promotions_model.dart';

class PackagesProvider extends ChangeNotifier {
  List<Promotions> _promotions = [];
  List<Item>? _packages;

  bool _loading = false;

  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<List<Promotions>> get promotions async {
    if (_promotions.isEmpty) {
      await fetchPromotions();
    }
    return _promotions;
  }

  Future<List<Item>> get packages async {
    if (_promotions.isEmpty) {
      await fetchPromotions();
    }
    return _packages!;
  }

  List<Promotions> get prom {
    return _promotions;
  }

  List<Item> get pack {
    if (_promotions.isEmpty) {
      fetchPackages();
    }
    return _packages!;
  }

  Future<void> fetchPromotions() async {
    setLoading(true);
    List<Promotions>? promotions = SharedPreference.promotions;
    if (promotions == null) {
      await APIRecargas.common().readPromotions().then((value) {
        setPromotions(value);
      }).catchError((e) {});
    } else {
      setPromotions(promotions);
      await APIRecargas.common().readPromotions().then((value) {
        setPromotions(value);
      }).catchError((e) {});
    }
    setLoading(false);
  }

  fetchPackages() async {
    List<Item>? package = SharedPreference.package;
    setLoading(true);
    if (package == null) {
      await APIRecargas.common().readOffers().then((value) {
        setPackages(value.items!);
      }).catchError((e) {});
    } else {
      setPackages(package);
      await APIRecargas.common().readOffers().then((value) {
        setPackages(value.items!);
      }).catchError((e) {});
    }
    setLoading(false);
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
