import 'package:detooo_recargas/models/auth/municipios_model.dart';
import 'package:detooo_recargas/services/network/api_users.dart';
import 'package:flutter/material.dart';

class MunicipiosProvider extends ChangeNotifier {
  List<Municipios> _allMunicipiosList = [];
  List<Municipios> _allMunicipiosListProvince = [];
  List<Municipios> _municipiosSelected = [];

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

  void setAllMunicipios(List<Municipios> municipios) {
    _allMunicipiosList = municipios;
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

  Future<List<Municipios>> municipiosFrom(String provincia) async {
    if (_allMunicipiosListProvince.isEmpty) {
      List<Municipios> municipios =
          await APIUsers.common().fetchMunicipiosProvincia(provincia);
      setAllMunicipiosProvince(municipios);
      return municipios;
    } else {
      return _allMunicipiosListProvince;
    }
  }

  void setAllMunicipiosProvince(List<Municipios> municipios) {
    _allMunicipiosListProvince = municipios;
    notifyListeners();
  }

  bool selectedMunicipios(String id) =>
      _municipiosSelected.any((element) => element.id == id);

  void setMunicipiosSelected(Municipios municipio) {
    if (!_municipiosSelected.any((element) => element.id == municipio.id)) {
      _municipiosSelected.add(municipio);
    } else {
      _municipiosSelected.remove(municipio);
    }
    notifyListeners();
  }
}
