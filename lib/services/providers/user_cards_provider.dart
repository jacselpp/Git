import 'package:detooo_recargas/models/recargas/cards_model.dart';
import 'package:detooo_recargas/services/network/api_payments.dart';
import 'package:flutter/material.dart';

class UserCardsProvider extends ChangeNotifier {
  UserCards? _userCards;

  Future<UserCards?> get userCards async {
    if (_userCards == null) {
      fetchCards();
    }
    return _userCards;
  }

  void fetchCards() async {
    await ApiPayments.common().getStripeUsersCard().then((value) {
      if (_userCards == null) setuserCards(value);
    });
  }

  void setuserCards(UserCards value) {
    _userCards = value;
    notifyListeners();
  }
}
