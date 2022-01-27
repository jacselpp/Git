import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:flutter/material.dart';

class RecargaSuccesfully extends StatelessWidget {
  final String target, dest;
  const RecargaSuccesfully({
    Key? key,
    required this.target,
    required this.dest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return AlternativeHomeLayout(
      child: SizedBox(
        height: ScreenHelper.screenHeight(context) - 160,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.check,
                        color: Colors.green,
                        size: Theme.of(context).textTheme.headline4?.fontSize,
                      ),
                    ),
                    Text(
                      locale.read('success'),
                      style: Theme.of(context).textTheme.headline4,
                    )
                  ],
                ),
              ),
              Text(
                '${locale.read('successfully_recharged')} ${locale.read(dest)} $target',
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
