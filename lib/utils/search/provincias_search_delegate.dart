import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/models/auth/provincias_model.dart';
import 'package:detooo_recargas/services/providers/provincias_provider.dart';

class ProvinciasSearch extends SearchDelegate<Provincias> {
  Provincias provincia = Provincias();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => close(context, provincia),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return (query.isNotEmpty)
        ? _showList(context)
        : Center(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 6.00),
                  child: const Icon(Icons.error, color: Colors.white),
                ),
                Text(locale.read('query_empty'))
              ],
            ),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildList(
      context,
      context.read<ProvinciasProvider>().allProvincias,
    );
  }

  Widget _showList(BuildContext context) {
    return FutureBuilder(
      future: context
          .read<ProvinciasProvider>()
          .filterListProvincias(context, query),
      initialData: const <Provincias>[],
      builder:
          (BuildContext context, AsyncSnapshot<List<Provincias>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 4.0,
            ),
          );
        }
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return _buildList(context, snapshot.data);
        }
        return Container();
      },
    );
  }

  Widget _buildList(BuildContext context, List<Provincias>? data) {
    return ListView.builder(
      itemCount: data!.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItem(context, data[index]);
      },
    );
  }

  Widget _buildItem(BuildContext context, Provincias data) {
    return ListTile(
      title: Text(data.nombre!),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: () {
        close(context, data);
      },
    );
  }
}
