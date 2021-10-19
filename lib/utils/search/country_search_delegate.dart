import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/services/providers/countries_provider.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:detooo_recargas/models/auth/countries_model.dart';

class CountrySearch extends SearchDelegate<Country> {
  Country country = Country();
  bool _firsTime = true;
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
      onPressed: () => close(context, country),
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
    if (_firsTime) {
      FocusScope.of(context).requestFocus(FocusNode());
      _firsTime = false;
    }
    return query.isEmpty
        ? _listBuilder(context.read<CountriesProvider>().allCountries, context)
        : _showList(context);
  }

  Widget _showList(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return FutureBuilder(
      future:
          context.read<CountriesProvider>().filterListCountry(context, query),
      initialData: context.watch<CountriesProvider>().allCountries,
      builder: (BuildContext context, AsyncSnapshot<List<Country>> snapshot) {
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
                child: CircularProgressIndicator(strokeWidth: 4));
          }
        }
      },
    );
  }

  Widget _listBuilder(List<Country> list, BuildContext context) =>
      RefreshIndicator(
        onRefresh: context.read<CountriesProvider>().fetchAllCountries,
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, i) {
            final suggestion = list[i].name;
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
                          color: primaryColor,
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
                  trailing: Text(list[i].alpha3Code!),
                  onTap: () => {
                    country = list[i],
                    close(context, country),
                  },
                ),
                const Divider(),
              ],
            );
          },
        ),
      );
}
