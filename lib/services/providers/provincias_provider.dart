import 'package:detooo_recargas/models/auth/provincias_model.dart';
import 'package:detooo_recargas/services/network/api_users.dart';
import 'package:flutter/material.dart';

class ProvinciasProvider extends ChangeNotifier {
  List<Provincias> _allProvinciasList = const [];
  Provincias? _provinciaSelected;

  Provincias? get provinciaSelected => _provinciaSelected;

  void setProvincia(Provincias provincia) {
    _provinciaSelected = provincia;
    notifyListeners();
  }

  Future<List<Provincias>> get allCountriesList async {
    if (_allProvinciasList.isEmpty) {
      await fetchAllProvincias();
    }
    return _allProvinciasList;
  }

  List<Provincias> get allProvincias => _allProvinciasList;

  void setAllProvincias(List<Provincias> countries) {
    _allProvinciasList = countries;
    notifyListeners();
  }

  Future<void> fetchAllProvincias() async {
    if (_allProvinciasList.isEmpty) {
      APIUsers.common().fetchProvincias().then((value) {
        setAllProvincias(value);
      });
    }
  }

  Future<List<Provincias>> filterListProvincias(
    BuildContext context,
    String query,
  ) async {
    return allProvincias
        .where(
          (value) =>
              value.nombre!.toLowerCase().startsWith(query.toLowerCase()),
        )
        .toList();
  }
}
