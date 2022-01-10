import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/models/recargas/promotions_model.dart';
import 'package:detooo_recargas/services/providers/recargas_provider.dart';
import 'package:detooo_recargas/ui/views/recargas/recargas_cubacel_view.dart';
import 'package:detooo_recargas/ui/views/recargas/recargas_nauta_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  DateTime timeBackPressed = DateTime.now();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return WillPopScope(
      onWillPop: () => _onBackPressed(locale),
      child: HomeLayout(
        mainDrawer: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BuildSuggestions(),
            const Separation(),
            _buildBody(context),
            const Separation(),
            const BuildHelp(),
          ],
        ),
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
            mainAxisExtent: 450.0,
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
      padding: const EdgeInsets.all(20.0),
      child: CustomContainer(
        paddingV: 10.0,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildPackageImage(data.dest),
            const Separation(),
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  AutoSizeText(
                    data.titulo!,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    minFontSize: 12,
                    maxFontSize:
                        Theme.of(context).textTheme.headline5!.fontSize!,
                    overflow: TextOverflow.visible,
                  ),
                  const Separation(),
                  _buildCaracteristicas(data.caracteristicas!, context),
                  const Separation(),
                  AutoSizeText(
                    '${data.amount!.toString()} USD',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    minFontSize: 12,
                    maxFontSize:
                        Theme.of(context).textTheme.headline5!.fontSize!,
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
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
            const Separation(),
          ],
        ),
      ),
    );
  }

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

  // Widget _buildPromotions() {
  //   final locale = AppLocalizations.of(context)!;
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Column(
  //       children: [
  //         const Separation(),
  //         Text(
  //           locale.read('promotions'),
  //           style: Theme.of(context).textTheme.headline5,
  //           textAlign: TextAlign.center,
  //         ),
  //         Text(
  //           locale.read('promotions_subtitle'),
  //           style: Theme.of(context).textTheme.subtitle1,
  //           textAlign: TextAlign.center,
  //         ),
  //         const Separation(),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildPackageImage(String? dest) {
    Widget image = Container();

    switch (dest) {
      case 'cubacel':
        image = _buildImage('assets/images/09.svg');
        break;
      case 'nauta':
        image = _buildImage('assets/images/08.svg');
        break;
      default:
        image = _buildImage('assets/images/07.svg');
    }
    return image;
  }

  Widget _buildImage(String s) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: SizedBox(
        width: 125.0,
        height: 125.0,
        child: SvgPicture.asset(s),
      ),
    );
  }

  Future<bool> _onBackPressed(AppLocalizations locale) async {
    final difference = DateTime.now().difference(timeBackPressed);
    final isExitWarning = difference >= const Duration(seconds: 2);
    timeBackPressed = DateTime.now();

    if (isExitWarning) {
      showMessage(
        context,
        locale.read('press_back_again'),
        TypeMessage.INFO,
      );
      return false;
    } else {
      return true;
    }
  }
}
