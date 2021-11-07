import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/ui/layouts/home_layout.dart';
import 'package:detooo_recargas/ui/views/auth/profile_view.dart';
import 'package:detooo_recargas/services/network/api_users.dart';
import 'package:detooo_recargas/models/recargas/promotions_model.dart';
import 'package:detooo_recargas/services/providers/recargas_provider.dart';
import 'package:detooo_recargas/services/providers/subscriptions_provider.dart';
import 'package:detooo_recargas/ui/views/recargas/recargas_cubacel_view.dart';
import 'package:detooo_recargas/ui/views/recargas/recargas_nauta_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeLayout(
      mainDrawer: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BuildSuggestions(),
          _buildPromotions(),
          _buildBody(context),
          _buildSeparation(),
          _buildMap(),
          _buildSeparation(),
          _buildSponsors(),
          _buildSeparation(),
          Stack(
            children: [
              Column(
                children: [
                  _buildTestimonials(),
                  if (!context.read<SubscriptionsProvider>().subscribed)
                    Container(
                      height: ScreenHelper.isPortrait(context) ? 150.0 : 75.0,
                    ),
                ],
              ),
              _buildSubscribe(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 500),
          () => context.read<PackagesProvider>().packages),
      builder:
          (BuildContext context, AsyncSnapshot<List<Promotions>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: (ScreenHelper.screenHeight(context) * .90),
            width: ScreenHelper.screenWidth(context),
            child: const Center(
              child: CircularProgressIndicator(
                strokeWidth: 4.0,
              ),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.active) {
          return SizedBox(
            height: (ScreenHelper.screenHeight(context) * .90),
            width: ScreenHelper.screenWidth(context),
            child: const Center(
              child: CircularProgressIndicator(
                strokeWidth: 4.0,
              ),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return _buildList(context, snapshot.data);
        }

        return Container();
      },
    );
  }

  Widget _buildList(BuildContext context, List<Promotions>? data) {
    return Column(
      children: [
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1,
            crossAxisSpacing: 0,
            mainAxisExtent: 400,
            crossAxisCount: ScreenHelper.isPortrait(context) ? 1 : 2,
          ),
          primary: false,
          shrinkWrap: true,
          itemCount: data!.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildItem(data[index], context);
          },
        ),
      ],
    );
  }

  Widget _buildItem(Promotions data, BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: ScreenHelper.isPortrait(context)
            ? ScreenHelper.screenWidth(context) * .2
            : ScreenHelper.screenHeight(context) * .1,
      ),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Card(
          elevation: 10.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildPackageImage(data.dest),
                _buildSeparation(),
                AutoSizeText(
                  data.titulo!,
                  style: Theme.of(context).textTheme.headline6!,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  minFontSize: 12,
                  maxFontSize: Theme.of(context).textTheme.headline6!.fontSize!,
                  overflow: TextOverflow.visible,
                ),
                _buildCaracteristicas(data.caracteristicas!, context),
                Expanded(child: Container()),
                Text(
                  data.amount!.toString(),
                  style: Theme.of(context).textTheme.headline5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextButton(
                      color: primaryColor,
                      label: locale.read('recharge'),
                      onPressed: () {
                        _handleRecarga(
                          context,
                          data,
                        );
                      },
                    ),
                  ],
                ),
                _buildSeparation(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSeparation() => const SizedBox(height: 20.0);

  Widget _buildCaracteristicas(
    List<String> caracteristicas,
    BuildContext context,
  ) {
    String caracteristicasString = '';
    for (var caracteristica in caracteristicas) {
      caracteristicasString = '$caracteristicasString $caracteristica \n';
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Icon(
              Icons.check_circle,
              // size: 16.0,
              color: primaryColor,
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: AutoSizeText(
            caracteristicasString.trim(),
            style: Theme.of(context).textTheme.subtitle1,
            maxLines: caracteristicasString.split('\n').length - 1,
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }

  void _handleRecarga(BuildContext context, Promotions data) {
    if (data.dest == 'cubacel') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const RecargasCubacelView(),
        ),
      );
    }
    if (data.dest == 'nauta') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const RecargasNautaView(),
        ),
      );
    }
  }

  Widget _buildPromotions() {
    final locale = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _buildSeparation(),
          Text(
            locale.read('promotions'),
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.center,
          ),
          Text(
            locale.read('promotions_subtitle'),
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
          _buildSeparation(),
        ],
      ),
    );
  }

  Widget _buildMap() {
    final locale = AppLocalizations.of(context)!;
    return Container(
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildSeparation(),
            Text(
              locale.read('somewhere_recharge'),
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
            SizedBox(
              height: ScreenHelper.screenWidth(context) * .05,
              width: ScreenHelper.screenWidth(context) * .1,
              child: SvgPicture.asset(
                'assets/images/Deto_Identidad_H.svg',
                fit: BoxFit.contain,
              ),
            ),
            _buildSeparation(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenHelper.isPortrait(context)
                    ? ScreenHelper.screenWidth(context) * .1
                    : ScreenHelper.screenHeight(context) * .2,
              ),
              child: SizedBox(
                height: ScreenHelper.screenWidth(context) * .5,
                width: ScreenHelper.screenWidth(context),
                child: SvgPicture.asset(
                  'assets/images/mapa.svg',
                  fit: BoxFit.contain,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTestimonials() {
    final locale = AppLocalizations.of(context)!;
    return Container(
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                locale.read('with_the_trust'),
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              locale.read('with_the_trust_subtitle'),
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
            _buildSeparation(),
            CustomTextButton(
                color: primaryColor,
                label: locale.read('write_testimonial'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ProfileView(
                      initialIndex: 1,
                    ),
                  ));
                }),
            _buildSeparation(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0),
              child: Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: TestimonialsWidget(),
              ),
            ),
            _buildSeparation(),
          ],
        ),
      ),
    );
  }

  Widget _buildSponsors() {
    final List<String> _items = [
      'marca1.svg',
      'marca2.svg',
      'marca3.svg',
      'marca4.svg',
      'marca5.svg',
    ];
    return SizedBox(
      width: ScreenHelper.screenWidth(context),
      height: 150.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        primary: false,
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildSponsorItem(_items[index]);
        },
      ),
    );
  }

  Widget _buildSponsorItem(String s) {
    return SizedBox(
      width: 150.0,
      height: 150.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          'assets/images/$s',
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildSubscribe() {
    bool subscribed = context.watch<SubscriptionsProvider>().subscribed;

    final locale = AppLocalizations.of(context)!;
    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          locale.read('last_promotions'),
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
        ),
        Text(
          locale.read('last_promotions_subtitle'),
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
        ),
      ],
    );
    var buttom = Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomTextButton(
        color: Theme.of(context).scaffoldBackgroundColor,
        label: locale.read('subscribe_now'),
        textColor: Theme.of(context).textTheme.bodyText1!.color,
        onPressed: () {
          APIUsers.common().userSubscribe(
            {"subscription": "promo_recargas"},
          ).then((_) {
            showMessage(
                context, locale.read('subscribed_message'), TypeMessage.INFO);
            context.read<SubscriptionsProvider>().setSubscribed(true);
          });
          context
              .read<SubscriptionsProvider>()
              .setSubscribed(context.read<SubscriptionsProvider>().subscribed);
        },
      ),
    );
    return !subscribed
        ? Positioned(
            bottom: 20.0,
            child: Padding(
              padding: EdgeInsets.all(ScreenHelper.screenWidth(context) * .02),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: primaryColor,
                ),
                width: ScreenHelper.screenWidth(context) * .96,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ScreenHelper.isPortrait(context)
                      ? Column(
                          children: [
                            column,
                            buttom,
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(flex: 3, child: column),
                            Expanded(child: buttom),
                          ],
                        ),
                ),
              ),
            ),
          )
        : Container();
  }

  Widget _buildPackageImage(String? dest) {
    Widget image = Container();

    switch (dest) {
      case 'cubacel':
        image = _buildImage('assets/images/oferta3.svg');
        break;
      case 'nauta':
        image = _buildImage('assets/images/oferta2.svg');
        break;
      default:
        image = _buildImage('assets/images/oferta1.svg');
    }
    return image;
  }

  Widget _buildImage(String s) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: SizedBox(
        width: 100,
        height: 100,
        child: SvgPicture.asset(s),
      ),
    );
  }
}
