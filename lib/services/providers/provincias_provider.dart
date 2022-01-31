import 'package:detooo_recargas/services/network/api_users.dart';
import 'package:detooo_recargas/utils/handle_errors.dart';
import 'package:flutter/material.dart';

import 'package:detooo_recargas/models/auth/provincias_model.dart';

import '../shared_preference.dart';

class ProvinciasProvider extends ChangeNotifier {
  List<Provincias> _allProvinciasList = [];
  Provincias? _provinciaSelected;

  Future<List<Provincias>> get allProvinciasList async {
    if (_allProvinciasList.isEmpty) {
      await fetchAllProvincias();
    }
    return _allProvinciasList;
  }

  List<Provincias> get allProvincias {
    if (_allProvinciasList.isEmpty) {
      fetchAllProvincias();
    }
    return _allProvinciasList;
  }

  get provinciaSelected => _provinciaSelected;

  void setAllProvincias(List<Provincias> provincias) {
    _allProvinciasList = provincias;
    SharedPreference.saveProvincias(provincias);
    notifyListeners();
  }

  Future<void> fetchAllProvincias() async {
    List<Provincias>? provinciasFromBd = SharedPreference.provincias;
    if (provinciasFromBd!.isEmpty) {
      APIUsers.common().fetchProvincias().then((value) {
        setAllProvincias(value);
      }).catchError((e) => HandleError.logError(null, e));
    } else {
      setAllProvincias(provinciasFromBd);
    }
  }

  Future<List<Provincias>> filterListProvincias(
    BuildContext context,
    String query,
  ) async {
    if (_allProvinciasList.isEmpty) await fetchAllProvincias();
    return allProvincias
        .where((value) =>
            value.nombre!.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
  }

  setProvincia(Provincias provincia) {
    _provinciaSelected = provincia;
    notifyListeners();
  }

  Provincias? fetchProvincia(String? provincia) {
    if (provincia != null && provincia.isNotEmpty) {
      for (var province in allProvincias) {
        if (province.id == provincia) {
          return province;
        }
      }
    }
  }
}
