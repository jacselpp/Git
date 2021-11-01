import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:detooo_recargas/models/auth/municipios_model.dart';
import 'package:detooo_recargas/services/providers/municipios_provider.dart';

class MunicipiosSelect extends StatefulWidget {
  final String provincia;
  const MunicipiosSelect({
    Key? key,
    required this.provincia,
  }) : super(key: key);

  @override
  State<MunicipiosSelect> createState() => _MunicipiosSelectState();
}

class _MunicipiosSelectState extends State<MunicipiosSelect> {
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.read('municipalities')),
      ),
      body: _bodyBuilder(context),
    );
  }

  FutureBuilder<List<Municipios>> _bodyBuilder(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return FutureBuilder(
      future:
          context.read<MunicipiosProvider>().municipiosFrom(widget.provincia),
      initialData: const <Municipios>[],
      builder:
          (BuildContext context, AsyncSnapshot<List<Municipios>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Column(
            children: [
              Expanded(
                flex: 4,
                child: _buildItems(snapshot.data),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextButton(
                        color: primaryColor,
                        label: locale.read('select_municipalities'),
                        onPressed: () => _handleMunicipalities(context),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(strokeWidth: 4),
          );
        }
        return Container();
      },
    );
  }

  Widget _buildItems(List<Municipios>? data) {
    return ListView.builder(
      itemCount: data?.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildListItems(data![index], index);
      },
    );
  }

  Widget _buildListItems(Municipios data, int index) {
    return Builder(builder: (context) {
      return CheckboxListTile(
        value: context.watch<MunicipiosProvider>().selectedMunicipio(data),
        onChanged: (a) {
          context.read<MunicipiosProvider>().setMunicipiosSelected(data);
        },
        title: Text(data.nombre!),
        activeColor: primaryColor,
      );
    });
  }

  _handleMunicipalities(BuildContext context) {
    Navigator.of(context)
        .pop(context.read<MunicipiosProvider>().municipiosSelected);
  }
}
