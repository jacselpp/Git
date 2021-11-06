import 'package:flutter/material.dart';

import 'package:detooo_recargas/services/network/api_orders.dart';
import 'package:detooo_recargas/models/recargas/orders_model.dart';
import 'package:detooo_recargas/models/recargas/paginated_model.dart';

class HistoryProvider extends ChangeNotifier {
  Paginated<Orders>? _ordersPaginated;

  List<Orders> _orders = [];

  List<Orders?> get orders {
    if (_orders.isEmpty) {
      fetchOrdersPage();
    }
    return _orders;
  }

  Future<List<Orders>> get ordersFuture async {
    if (_orders.isEmpty) {
      await fetchOrdersPage();
    }
    return _orders;
  }

  Future<List<Orders>>? fetchOrdersPage() async {
    if (_ordersPaginated != null &&
        _ordersPaginated!.currentPage! != _ordersPaginated!.totalPages!) {
      await fetchOrders(page: _ordersPaginated!.currentPage! + 1);
    } else if (_ordersPaginated == null) {
      await fetchOrders();
    }
    return _orders;
  }

  Future<void> fetchOrders({int page = 1}) async {
    await ApiOrders.common().userOrders(page).then((value) {
      setOrdersPaginated(value);
    });
  }

  void setOrdersPaginated(Paginated<Orders> value) {
    _ordersPaginated = value;

    _setOrders(value.items!);

    notifyListeners();
  }

  void _setOrders(List<Orders> list) {
    int l = _orders.length;
    if (list.isNotEmpty && _orders.isNotEmpty) {
      for (var order in list) {
        if (!_orders
            .any((element) => element.id.toString() == order.id.toString())) {
          _orders.add(order);
        }
      }
      if (l < _orders.length) {
        notifyListeners();
      }
    } else {
      _orders = list;
      notifyListeners();
    }
  }
}
