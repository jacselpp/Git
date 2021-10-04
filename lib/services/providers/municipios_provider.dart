import 'package:detooo_recargas/models/auth/municipios_model.dart';
import 'package:detooo_recargas/services/network/api_users.dart';
import 'package:flutter/material.dart';

class MunicipiosProvider extends ChangeNotifier {
  List<Municipios> _allMunicipiosList = const [];
  List<Municipios> _municipiosSelected = const [];

  List<Municipios> get municipiosSelected => _municipiosSelected;

  void setMunicipios(List<Municipios> municipios) {
    _municipiosSelected = municipios;
    notifyListeners();
  }

  Future<List<Municipios>> get allMunicipiosList async {
    if (_allMunicipiosList.isEmpty) {
      await fetchAllMunicipios();
    }
    return _allMunicipiosList;
  }

  List<Municipios> get allMunicipios => _allMunicipiosList;

  void setAllMunicipios(List<Municipios> countries) {
    _allMunicipiosList = countries;
    notifyListeners();
  }

  Future<void> fetchAllMunicipios() async {
    if (_allMunicipiosList.isEmpty) {
      APIUsers.common().fetchMunicipios().then((value) {
        setAllMunicipios(value);
      });
    }
  }

  Future<List<Municipios>> filterListMunicipios(
    BuildContext context,
    String query,
  ) async {
    return allMunicipios
        .where(
          (value) =>
              value.nombre!.toLowerCase().startsWith(query.toLowerCase()),
        )
        .toList();
  }
}
