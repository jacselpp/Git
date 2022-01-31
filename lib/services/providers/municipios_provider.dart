import 'package:detooo_recargas/models/auth/municipios_model.dart';
import 'package:detooo_recargas/services/network/api_users.dart';
import 'package:detooo_recargas/services/shared_preference.dart';
import 'package:detooo_recargas/utils/handle_errors.dart';
import 'package:flutter/material.dart';

class MunicipiosProvider extends ChangeNotifier {
  List<Municipios> _allMunicipiosList = [];
  List<Municipios> _allMunicipiosListProvince = [];
  List<Municipios> _municipiosSelected = [];

  List<Municipios> get municipiosSelected => _municipiosSelected;

  void setMunicipios(List<Municipios> municipios) {
    _municipiosSelected = municipios;
    SharedPreference.setMunicipios(municipios);
    notifyListeners();
  }

  void setUserMunicipiosSelected(List<String> municipios, String provincia) {
    for (var id in municipios) {
      for (var municipio in _allMunicipiosList) {
        if (id == municipio.id &&
            municipio.provincia == provincia &&
            !_municipiosSelected.any((element) => element == municipio)) {
          _municipiosSelected.add(municipio);
        }
      }
    }
    notifyListeners();
  }

  List<Municipios> allMunicipiosProvince(String provincia) {
    if (_allMunicipiosListProvince.isEmpty) {
      municipiosFrom(provincia);
    }
    return _allMunicipiosListProvince;
  }

  void setAllMunicipios(List<Municipios> municipios) {
    _allMunicipiosList = municipios;
    notifyListeners();
  }

  Future<List<Municipios>> municipiosFrom(String provincia) async {
    List<Municipios> municipios = [];
    if (_allMunicipiosList.isNotEmpty) {
      for (var municipio in _allMunicipiosList) {
        if (municipio.provincia == provincia) {
          municipios.add(municipio);
        }
      }
    } else {
      fetchAllMunicipios();
      municipiosFrom(provincia);
    }
    return municipios;
  }

  void setAllMunicipiosProvince(List<Municipios> municipios) {
    _allMunicipiosListProvince = municipios;
    notifyListeners();
  }

  void setMunicipiosSelected(Municipios municipio) {
    if (!_municipiosSelected.any((element) => element == municipio)) {
      _municipiosSelected.add(municipio);
    } else {
      _municipiosSelected.remove(municipio);
    }
    notifyListeners();
  }

  List<Municipios>? municipiosName(List<String>? municipios) {
    List<Municipios>? municipiosString = [];
    if (municipios != null && municipios.isNotEmpty) {}
    return municipiosString;
  }

  bool selectedMunicipio(Municipios s) =>
      municipiosSelected.any((element) => element == s);

  void fetchAllMunicipios() async {
    List<Municipios>? municipiosDb = SharedPreference.municipios;
    if (municipiosDb == null) {
      await APIUsers.common().fetchMunicipios().then((value) {
        setAllMunicipios(value);
        SharedPreference.setMunicipios(value);
      }).catchError((e) => HandleError.logError(null, e));
    } else {
      setAllMunicipios(municipiosDb);
    }
  }
}
