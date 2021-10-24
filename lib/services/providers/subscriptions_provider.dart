import 'package:detooo_recargas/services/network/api_users.dart';
import 'package:flutter/foundation.dart';

class SubscriptionsProvider extends ChangeNotifier {
  bool _subsbribed = false;

  bool get subscribed => _subsbribed;

  Future<void> fetchSubscribed() async {
    APIUsers.common().userSubscriptionsRecarga().then((value) {
      setSubscribed(value);
    });
  }

  void setSubscribed(bool value) {
    _subsbribed = value;
    notifyListeners();
  }
}
