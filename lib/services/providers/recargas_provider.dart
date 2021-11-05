import 'package:detooo_recargas/models/recargas/paginated_model.dart';
import 'package:detooo_recargas/models/recargas/promotions_model.dart';
import 'package:detooo_recargas/services/network/api_recargas.dart';
import 'package:detooo_recargas/services/shared_preference.dart';
import 'package:flutter/cupertino.dart';

class PackagesProvider extends ChangeNotifier {
  List<Promotions>? _packages;

  Future<List<Promotions>> get packages async {
    if (_packages == null) {
      await fetchPackages();
    }
    return _packages!;
  }

  List<Promotions> get pack {
    if (_packages == null) {
      fetchPackages();
    }
    return _packages!;
  }

  fetchPackages() async {
    List<Promotions>? promotions = SharedPreference.promotions;
    if (promotions == null) {
      APIRecargas.common().readPromotions().then((value) {
        setPackages(value);
      }).catchError((e) {});
    } else {
      setPackages(promotions);
      APIRecargas.common().readPromotions().then((value) {
        setPackages(value);
      }).catchError((e) {});
    }
  }

  void setPackages(List<Promotions> packages) {
    SharedPreference.setPackages(packages);
    _packages = packages;
    notifyListeners();
  }
}
