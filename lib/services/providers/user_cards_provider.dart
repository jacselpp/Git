import 'package:detooo_recargas/models/recargas/cards_model.dart';
import 'package:detooo_recargas/services/network/api_payments.dart';
import 'package:flutter/material.dart';

class UserCardsProvider extends ChangeNotifier {
  UserCards? _userCards;
  bool _loading = false;
  Data? _selectedCard;

  bool get loading => _loading;

  UserCards? get cards {
    if (_userCards == null) {
      fetchCards();
    }
    return _userCards;
  }

  UserCards? get userCards => _userCards;

  void fetchCards() async {
    _userCards = null;
    notifyListeners();
    _setLoading(true);
    await ApiPayments.common().getStripeUsersCard().then((value) {
      setuserCards(value);
    });
    _setLoading(false);
  }

  Future<void> deletCard(String? paymentMethod) async {
    _setLoading(true);
    await ApiPayments.common()
        .deleteCard(paymentMethod: paymentMethod ?? selectedCard!.id);
    _setLoading(false);
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

  Data? get selectedCard => _selectedCard;

  void setSelectedCard(Data card) {
    _selectedCard = card;
    notifyListeners();
  }

  void clearSelectedCard() {
    _selectedCard = null;
    notifyListeners();
  }
}
