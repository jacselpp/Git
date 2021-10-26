import 'dart:html';

import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/models/recargas/promotions_model.dart';
import 'package:detooo_recargas/services/providers/recargas_provider.dart';
import 'package:detooo_recargas/services/shared_preference.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:detooo_recargas/ui/layouts/home_layout.dart';
import 'package:detooo_recargas/ui/views/recargas/recargas_cubacel_view.dart';
import 'package:detooo_recargas/ui/views/recargas/recargas_nauta_view.dart';
import 'package:detooo_recargas/ui/widgets/testimonials_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late bool _testimonials;

  _handleTestimonials() {
    SharedPreference.setTestimonials(!_testimonials);
    setState(() {
      _testimonials = !_testimonials;
    });
  }

  @override
  void initState() {
    super.initState();
    _testimonials = SharedPreference.testimonials;
  }

  @override
  Widget build(BuildContext context) {
    return HomeLayout(
      child: SingleChildScrollView(
        primary: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BuildSuggestions(),
            _buildBody(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return FutureBuilder(
      future: context.read<PackagesProvider>().packages,
      builder:
          (BuildContext context, AsyncSnapshot<List<Promotions>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: (_testimonials)
                ? (ScreenHelper.screenHeight(context) * .90) - 150
                : (ScreenHelper.screenHeight(context) * .90),
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
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: data!.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItem(data[index], context);
      },
    );
  }

  Widget _buildItem(Promotions data, BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: ScreenHelper.screenWidth(context) * .20,
      ),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (data.dest == 'cubacel')
                  SizedBox(
                    width: ScreenHelper.screenWidth(context) * .4,
                    height: ScreenHelper.screenWidth(context) * .4,
                    child: SvgPicture.asset('assets/images/oferta3.svg'),
                  ),
                if (data.dest == 'nauta')
                  SizedBox(
                    width: ScreenHelper.screenWidth(context) * .4,
                    height: ScreenHelper.screenWidth(context) * .4,
                    child: SvgPicture.asset('assets/images/oferta2.svg'),
                  ),
                if (data.dest != 'nauta' && data.dest != 'cubacel')
                  SizedBox(
                    width: ScreenHelper.screenWidth(context) * .4,
                    height: ScreenHelper.screenWidth(context) * .4,
                    child: SvgPicture.asset('assets/images/oferta2.svg'),
                  ),
                _buildSeparation(),
                Text(
                  data.titulo!,
                  style: Theme.of(context).textTheme.headline5,
                ),
                _buildSeparation(),
                _buildCaracteristicas(data.caracteristicas!, context),
                _buildSeparation(),
                Text(
                  data.amount!.toString(),
                  style: Theme.of(context).textTheme.headline2,
                ),
                _buildSeparation(),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      flex: 2,
                      child: CustomTextButton(
                        color: primaryColor,
                        label: locale.read('recharge'),
                        onPressed: () {
                          _handleRecarga(
                            context,
                            data,
                          );
                        },
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSeparation() => const SizedBox(height: 20.0);

  Widget _buildCaracteristicas(
      List<String> caracteristicas, BuildContext context) {
    String caracteristicasString = '';
    for (var caracteristica in caracteristicas) {
      caracteristicasString = '$caracteristicasString $caracteristica \n';
    }
    return Text(
      caracteristicasString,
      style: Theme.of(context).textTheme.bodyText2,
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
}
