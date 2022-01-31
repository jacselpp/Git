import 'package:detooo_recargas/models/auth/dashboard_model.dart';
import 'package:detooo_recargas/services/network/api_orders.dart';
import 'package:detooo_recargas/utils/handle_errors.dart';
import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  Dashboard? _dashboard;

  Dashboard? get dashboard => _dashboard;

  void fetchDashboard() {
    ApiOrders.common().userDashboard().then((value) {
      setDashboard(value);
    }).catchError((e) => HandleError.logError(null, e));
  }

  void setDashboard(Dashboard value) {
    _dashboard = value;
    notifyListeners();
  }
}
