import 'package:detooo_recargas/models/recargas/cards_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_credit_card/credit_card_widget.dart';

class CustomCreditCard extends StatelessWidget {
  final Data card;
  const CustomCreditCard({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CreditCardWidget(
      height: 170.0,
      obscureCardNumber: true,
      cardNumber: '**** **** **** ${card.card?.last4}',
      labelCardHolder: '',
      cardType: _cardType(),
      expiryDate: _expiryDate(),
      cardHolderName: '',
      cvvCode: '123',
      showBackView: false,
      isHolderNameVisible: true,
      onCreditCardWidgetChange: (brand) {},
    );
  }

  String _expiryDate() =>
      '${card.card!.expMonth! <= 9 ? '0${card.card?.expMonth}' : card.card?.expMonth}/${card.card?.expYear.toString().substring(2, 4)}';

  CardType? _cardType() {
    switch (card.card?.brand!) {
      case 'visa':
        return CardType.visa;
      case 'discover':
        return CardType.discover;
      case 'mastercard':
        return CardType.mastercard;
      case 'americanExpress':
        return CardType.americanExpress;
    }
  }
}