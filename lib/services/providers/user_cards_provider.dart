import 'package:detooo_recargas/models/recargas/cards_model.dart';
import 'package:detooo_recargas/services/network/api_payments.dart';
import 'package:flutter/material.dart';

class UserCardsProvider extends ChangeNotifier {
  UserCards? _userCards;
  bool _loading = false;
  CardS? _selectedCard;

  bool get loading => _loading;

  UserCards? get cards {
    if (_userCards == null) {
      fetchCards();
    }
    return _userCards;
  }

  Future<UserCards?> get userCards async {
    if (_userCards == null) {
      fetchCards();
    }
    return _userCards;
  }

  void fetchCards() async {
    _setLoading(true);
    await ApiPayments.common().getStripeUsersCard().then((value) {
      if (_userCards == null) setuserCards(value);
    });
  }

  void setuserCards(UserCards value) {
    _userCards = value;
    _setLoading(false);
    notifyListeners();
  }

  void _setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  CardS? get selectedCard => _selectedCard;

  void setSelectedCard(CardS card) {
    _selectedCard = card;
    notifyListeners();
  }

  void clearSelectedCard() {
    _selectedCard = null;
    notifyListeners();
  }
}
