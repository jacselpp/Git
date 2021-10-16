// import 'package:detooo_recargas/models/auth/municipios_model.dart';
// import 'package:detooo_recargas/services/network/api_users.dart';
// import 'package:detooo_recargas/services/shared_preference.dart';
// import 'package:flutter/material.dart';

// class MunicipiosProvider extends ChangeNotifier {
//   List<Municipios> _allMunicipiosList = [];
//   List<Municipios> _allMunicipiosListProvince = [];
//   List<Municipios> _municipiosSelected = [];

//   List<Municipios> get municipiosSelected => _municipiosSelected;

//   void setMunicipios(List<Municipios> municipios) {
//     _municipiosSelected = municipios;
//     SharedPreference.setMunicipios(municipios);
//     notifyListeners();
//   }

//   Future<List<Municipios>> get allMunicipiosList async {
//     if (_allMunicipiosList.isEmpty) {
//       await fetchAllMunicipios();
//     }
//     return _allMunicipiosList;
//   }

//   List<Municipios> get allMunicipios {
//     if (_allMunicipiosList.isEmpty) {
//       fetchAllMunicipios();
//     }
//     return _allMunicipiosList;
//   }

//   List<Municipios> allMunicipiosProvince(String provincia) {
//     if (_allMunicipiosListProvince.isEmpty) {
//       municipiosFrom(provincia);
//     }
//     return _allMunicipiosListProvince;
//   }

//   void setAllMunicipios(List<Municipios> municipios) {
//     _allMunicipiosList = municipios;
//     notifyListeners();
//   }

//   Future<void> fetchAllMunicipios() async {
//     List<Municipios>? municipios = SharedPreference.municipios;

//     if (municipios == null && municipios!.isEmpty) {
//       APIUsers.common().fetchMunicipios().then((value) {
//         setAllMunicipios(value);
//       });
//     } else {
//       setAllMunicipios(municipios);
//     }
//   }

//   Future<List<Municipios>> filterListMunicipios(
//     BuildContext context,
//     String query,
//   ) async {
//     return allMunicipios
//         .where(
//           (value) =>
//               value.nombre!.toLowerCase().startsWith(query.toLowerCase()),
//         )
//         .toList();
//   }

//   Future<List<Municipios>> municipiosFrom(String provincia) async {
//     List<Municipios> municipios =
//         await APIUsers.common().fetchMunicipiosProvincia(provincia);
//     setAllMunicipiosProvince(municipios);
//     return municipios;
//   }

//   void setAllMunicipiosProvince(List<Municipios> municipios) {
//     _allMunicipiosListProvince = municipios;
//     notifyListeners();
//   }

//   bool selectedMunicipios(String id) =>
//       _municipiosSelected.any((element) => element.id == id);

//   void setMunicipiosSelected(Municipios municipio) {
//     if (!_municipiosSelected.any((element) => element.id == municipio.id)) {
//       _municipiosSelected.add(municipio);
//     } else {
//       _municipiosSelected.remove(municipio);
//     }
//     notifyListeners();
//   }

//   List<Municipios>? municipiosName(List<String>? municipios) {
//     List<Municipios>? municipiosString = [];
//     if (municipios != null && municipios.isNotEmpty) {}
//     return municipiosString;
//   }
// }
