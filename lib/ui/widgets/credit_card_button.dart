import 'package:detooo_recargas/services/providers/user_cards_provider.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class CustomCreditCardButon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          color: primaryColor,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.0),
                ),
              ),
              builder: (context) => const CardDraggableScrollableSheet(),
            );
          },
          icon: const Icon(
            Icons.credit_card,
          ),
        ),
        if (context.read<UserCardsProvider>().selectedCard != null)
          IconButton(
            color: Colors.red,
            onPressed: () {
              context.read<UserCardsProvider>().clearSelectedCard();
            },
            icon: const Icon(
              Icons.close_rounded,
            ),
          ),
        // if (context.read<UserCardsProvider>().selectedCard != null)
        //   IconButton(
        //     color: Colors.red,
        //     onPressed: () async {
        //       bool accept = await showDialog(
        //         context: context,
        //         builder: (context) => dialogAcceptDeleteCard(context),
        //       );
        //       if (accept) {
        //         _handleDelete(
        //           context,
        //           context.read<UserCardsProvider>().selectedCard!,
        //         );

        //         context.read<UserCardsProvider>().clearSelectedCard();
        //       }
        //     },
        //     icon: const Icon(
        //       Icons.delete_forever,
        //     ),
        //   ),
      ],
    );
  }

  // void _handleDelete(BuildContext context, Data card) {
  //   List<String> listPaymentMethods = [];
  //   for (var item in context.read<UserCardsProvider>().cards!.data!) {
  //     if (card.card?.fingerprint == item.card?.fingerprint) {
  //       listPaymentMethods.add(item.id!);
  //     }
  //   }
  //   for (var item in listPaymentMethods) {
  //     context.read<UserCardsProvider>().deletCard(item);
  //   }
  //   context.read<UserCardsProvider>().fetchCards();
  // }
}
