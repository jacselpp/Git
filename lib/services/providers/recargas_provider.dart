import 'package:detooo_recargas/models/recargas/paginated_model.dart';
import 'package:detooo_recargas/models/recargas/promotions_model.dart';
import 'package:detooo_recargas/services/network/api_recargas.dart';
import 'package:flutter/cupertino.dart';

class PackagesProvider extends ChangeNotifier {
  Paginated? _paginated;
  List<Promotions>? _packages;

  Future<List<Promotions>> get packages async {
    if (_packages == null && _paginated == null) {
      await fetchPackages();
    }
    return _packages!;
  }

  List<Promotions> get pack {
    if (_packages == null && _paginated == null) {
      fetchPackages();
    }
    return _packages!;
  }

  fetchPackages() async {
    await APIRecargas.common().readPromotions().then((value) {
      setPackages(value.items!);
    });
  }

  void setPackages(List<Promotions> packages) {
    _packages = packages;
    notifyListeners();
  }
}
