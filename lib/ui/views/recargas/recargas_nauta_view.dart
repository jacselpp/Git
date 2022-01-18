import 'package:auto_size_text/auto_size_text.dart';
import 'package:detooo_recargas/models/recargas/cards_model.dart';
import 'package:detooo_recargas/models/recargas/package_model.dart';
import 'package:detooo_recargas/services/network/dio_instances.dart';
import 'package:detooo_recargas/services/providers/user_cards_provider.dart';
import 'package:detooo_recargas/ui/widgets/credit_card_button.dart';
import 'package:detooo_recargas/ui/widgets/custom_credit_card.dart';
import 'package:detooo_recargas/utils/constant.dart';
import 'package:detooo_recargas/utils/log_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:detooo_recargas/utils/validators.dart';
import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/services/providers/recargas_provider.dart';

class RecargasNautaView extends StatefulWidget {
  const RecargasNautaView({Key? key}) : super(key: key);

  @override
  _RecargasCubacelViewState createState() => _RecargasCubacelViewState();
}

class _RecargasCubacelViewState extends State<RecargasNautaView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nautaAccountController = TextEditingController();

  String? _dropDownValue;
  Item _selectedPackage = Item();
  bool _accept = false;
  bool _saveUserCard = false;
  UserCards? _userCards;
  CardS? _selectedUserCards;
  CardFieldInputDetails? _card;
  EmailContact? _emailContact;

  void _handleAccept() {
    setState(() {
      _accept = !_accept;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (context.watch<PackagesProvider>().prom.isNotEmpty) {
      if (_selectedPackage.price == null) {
        _handlePromotion(context.watch<PackagesProvider>().pack, '');
      }
    } else {
      return const CircularProgressIndicator();
    }
    return AlternativeHomeLayout(
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    if (_emailContact != null) {
      _nautaAccountController.value =
          TextEditingValue(text: _emailContact?.email?.email ?? '');
    }

    _selectedUserCards = context.watch<UserCardsProvider>().selectedCard;
    _setUserCards(context);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SvgPicture.asset('assets/images/11.svg'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      locale.read('nauta_recharge'),
                      style: Theme.of(context).textTheme.headline5!,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      minFontSize: 12,
                      maxFontSize:
                          Theme.of(context).textTheme.headline4!.fontSize!,
                      overflow: TextOverflow.visible,
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildCaracteristicas(
            _selectedPackage.description?.description,
            context,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Expanded(
                child: _selectedUserCards != null
                    ? Hero(
                        tag: _selectedUserCards?.fingerprint ?? '',
                        child: CustomCreditCard(
                          card: _selectedUserCards!,
                        ),
                      )
                    : CardField(
                        onCardChanged: (card) {
                          setState(() {
                            _card = card;
                          });
                        },
                      ),
              ),
              CustomCreditCardButon(),
            ],
          ),
          const Divider(),
          const SizedBox(
            height: 20.0,
          ),
          CustomTextFormField(
            controller: _nautaAccountController,
            label: locale.read('nauta_account'),
            validator: (value) => validateEmailNauta(
              context: context,
              value: value,
            ),
            suffixIcon: IconButton(
              onPressed: () async {
                final bool granted = !kIsWeb
                    ? await FlutterContactPicker.requestPermission()
                    : false;
                if (granted) {
                  final EmailContact? contact =
                      await FlutterContactPicker.pickEmailContact();
                  if (contact != null) {
                    setState(() {
                      _emailContact = contact;
                    });
                  }
                }
              },
              icon: const Icon(
                Icons.contact_mail_rounded,
                color: primaryColor,
              ),
            ),
            onChanged: (v) {
              setState(() {
                _emailContact = null;
              });
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          SizedBox(
            height: 45.0,
            child: CustomDropdown(
              items: _handleResults(context.watch<PackagesProvider>().pack),
              label: locale.read('package'),
              onChanged: (String? value) {
                _handlePromotion(
                  context.read<PackagesProvider>().pack,
                  value!,
                );
                setState(() {
                  _dropDownValue = value;
                });
              },
              value: _dropDownValue,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Expanded(
                child: Switch(
                  activeColor: primaryColor,
                  value: _saveUserCard,
                  onChanged: (e) => setState(() {
                    _saveUserCard = e;
                  }),
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  locale.read('save_card'),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Expanded(
                child: Switch(
                  activeColor: primaryColor,
                  value: _accept,
                  onChanged: (e) => _handleAccept(),
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  locale.read('accept_therms_recharge'),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Expanded(
                child: LoadingButton(
                    onPressed: () => _handlePayPress(context),
                    text: locale.read('recharge')),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<String> _handleResults(List<Item> pack) {
    List<String> packages = [];
    for (var promotion in pack) {
      if (promotion.type == 'nauta') {
        packages.add(promotion.price!.toString());
      }
    }
    _dropDownValue ??= packages[0];
    if (_selectedPackage.price == null) {
      _handlePromotion(
        pack,
        packages[0],
      );
    }
    return packages;
  }

  void _handlePromotion(List<Item> pack, String value) {
    for (var package in pack) {
      if (package.price.toString() == value) {
        _selectedPackage = package;
        setState(() {});
      }
    }
  }

  Widget _buildCaracteristicas(
    String? caracteristicas,
    BuildContext context,
  ) {
    String caracteristicasString = '                         ';
    if (caracteristicas != null) {
      caracteristicasString = caracteristicas;
    }
    return Text(
      caracteristicasString
          .replaceRange(caracteristicasString.length - 4,
              caracteristicasString.length, '')
          .replaceRange(0, 3, '')
          .trim(),
      style: Theme.of(context).textTheme.bodyText2,
      textAlign: TextAlign.justify,
      overflow: TextOverflow.ellipsis,
    );
  }

  void _setUserCards(BuildContext context) async {
    _userCards ??= await Future.delayed(const Duration(milliseconds: 100),
        () => context.read<UserCardsProvider>().userCards);
  }

  Future<void> _handlePayPress(BuildContext context) async {
    if (_card == null) {
      return;
    }

    final locale = AppLocalizations.of(context)!;
    if (!_formKey.currentState!.validate()) return;
    if (!_accept) {
      showMessage(context, locale.read('should_accept'), TypeMessage.ERROR);
      return;
    }

    final paymentIntent = await Stripe.instance
        .createPaymentMethod(const PaymentMethodParams.card());

    await makeApiRequest(
      context,
      paymentId: paymentIntent.id,
    );
  }

  Future<void> makeApiRequest(BuildContext context,
      {required String paymentId}) async {
    try {
      // ignore: unused_local_variable
      final response = await dioCommon().post(
        '${API_RECARGAS}recargas/nauta',
        data: {
          "nauta": _nautaAccountController.text,
          "package": _selectedPackage.id,
          "paymentMethodId": paymentId,
          "saveCard": _saveUserCard,
          "off_session": false
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Success!: The payment was confirmed successfully!')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
      LogUtils().logger.wtf(e.toString());
    }
  }
}
