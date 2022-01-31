import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/models/recargas/cards_model.dart';
import 'package:detooo_recargas/services/providers/user_cards_provider.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:detooo_recargas/ui/widgets/custom_credit_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardDraggableScrollableSheet extends StatefulWidget {
  const CardDraggableScrollableSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<CardDraggableScrollableSheet> createState() =>
      _CardDraggableScrollableSheetState();
}

class _CardDraggableScrollableSheetState
    extends State<CardDraggableScrollableSheet> {
  UserCards? _cards;
  List<Data> userCards = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initCards();
  }

  @override
  Widget build(BuildContext context) {
    _cards = context.watch<UserCardsProvider>().cards;

    if (context.watch<UserCardsProvider>().cards != null) {
      for (var item in context.watch<UserCardsProvider>().cards!.data!) {
        if (!userCards.any(
          (element) => element.card?.fingerprint == item.card?.fingerprint,
        )) {
          userCards.add(item);
        }
      }
    }

    final locale = AppLocalizations.of(context)!;
    return DraggableScrollableSheet(
      initialChildSize: 0.89,
      maxChildSize: 0.89,
      builder: (context, controller) => Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(15.0),
            ),
            child: Container(
              color: Theme.of(context).cardColor,
              height: 40.0,
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      locale.read('cards'),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8.0,
                    right: 0.0,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Padding(
                        padding: EdgeInsets.only(right: 12.0),
                        child: Icon(Icons.close),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: _cards?.data != null && _cards!.data!.isNotEmpty
                  ? Container(
                      height: (ScreenHelper.screenHeight(context) * .89) - 40.0,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: userCards.length,
                        itemBuilder: _itemBuilder,
                      ),
                    )
                  : Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Center(
                        child: !context.watch<UserCardsProvider>().loading
                            ? Text(
                                locale.read('no_cards'),
                              )
                            : const CircularProgressIndicator(),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final card = userCards[index];
    return Row(
      children: [
        _buildCreditCard(context, card),
        IconButton(
          color: Colors.red,
          onPressed: () async {
            bool accept = await showDialog(
              context: context,
              builder: (context) => dialogAcceptDeleteCard(context),
            );
            if (accept) {
              _handleDelete(context, card);
            }
          },
          icon: const Icon(
            Icons.delete_forever,
          ),
        ),
      ],
    );
  }

  Widget _buildCreditCard(BuildContext context, Data card) {
    return SizedBox(
      width: ScreenHelper.screenWidth(context) - 50,
      child: InkWell(
        onTap: () {
          context.read<UserCardsProvider>().setSelectedCard(card);
          Navigator.of(context).pop();
        },
        child: Hero(
          tag: card.card!.fingerprint!,
          child: CustomCreditCard(card: card),
        ),
      ),
    );
  }

  void _handleDelete(BuildContext context, Data card) {
    List<String> listPaymentMethods = [];
    for (var item in context.read<UserCardsProvider>().cards!.data!) {
      if (card.card?.fingerprint == item.card?.fingerprint) {
        listPaymentMethods.add(item.id!);
      }
    }
    for (var item in listPaymentMethods) {
      context.read<UserCardsProvider>().deletCard(item);
    }
    context.read<UserCardsProvider>().fetchCards();
  }

  void _initCards() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<UserCardsProvider>().fetchCards();
    });
  }
}
