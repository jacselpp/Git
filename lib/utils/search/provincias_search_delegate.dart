import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/models/auth/provincias_model.dart';
import 'package:detooo_recargas/services/providers/provincias_provider.dart';

class ProvinciasSearch extends SearchDelegate<Provincias> {
  Provincias provincias = Provincias();
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
      onPressed: () => close(context, provincias),
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
    return _showList(context);
  }

  Widget _showList(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return FutureBuilder(
      future: context
          .read<ProvinciasProvider>()
          .filterListProvincias(context, query),
      initialData: context.watch<ProvinciasProvider>().allProvincias,
      builder:
          (BuildContext context, AsyncSnapshot<List<Provincias>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting &&
            query.isEmpty) {
          return const Center(child: CircularProgressIndicator(strokeWidth: 4));
        }
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          _listBuilder(snapshot.data!, context);
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(
              locale.read('query_load_error'),
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          );
        }
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return _listBuilder(snapshot.data!, context);
        } else {
          if (query.isNotEmpty) {
            return Center(
              child: Text(
                locale.read('query_not_match'),
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 4),
            );
          }
        }
      },
    );
  }

  Widget _listBuilder(List<Provincias> list, BuildContext context) =>
      RefreshIndicator(
        onRefresh: context.read<ProvinciasProvider>().fetchAllProvincias,
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, i) {
            final suggestion = list[i].nombre;
            final queryText = suggestion!.substring(0, query.length);
            final remainingText = suggestion.substring(query.length);
            return Column(
              children: [
                ListTile(
                  title: RichText(
                    text: TextSpan(
                      text: queryText,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 16.0),
                      children: [
                        TextSpan(
                          text: remainingText,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                  onTap: () => {
                    provincias = list[i],
                    context.read<ProvinciasProvider>().setProvincia(list[i]),
                    close(context, provincias),
                  },
                ),
                const Divider(),
              ],
            );
          },
        ),
      );
}
