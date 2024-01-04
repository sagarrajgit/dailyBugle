import 'package:flutter/material.dart';
import 'package:news/data/suggestions.dart';

import '../pages/search_result.dart';

class CustomSearchDelegate extends SearchDelegate<String> {

  // search bar decoration
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.red.shade400,
        foregroundColor: Colors.white,
        toolbarHeight: 65,
      ),
      inputDecorationTheme: InputDecorationTheme(
        // size of search field
        constraints: BoxConstraints.loose(
          const Size.fromWidth(double.maxFinite)
        ),

        // hint inside search field
        hintStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal),
        
        contentPadding: const EdgeInsets.all(10),
        fillColor: Colors.white,
        filled: true,

        // border
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
              color: Color.fromRGBO(239, 83, 80, 1),
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
              color: Color.fromRGBO(109, 109, 109, 1),
            )),
      ),
    );
  }

  // leading button
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      splashColor: Colors.white,
      splashRadius: 25,
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  // actions button
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        splashColor: Colors.white,
        splashRadius: 25,
        onPressed: () {
          if (query.isEmpty) {
            close(context, '');
          }
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  // search suggestions
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];

    for (final item in suggestions.reversed) {
      // Storing an string with double quote eg.('"Apple"')
      // Now removing first and last character
      String modifiedString = item.substring(1, item.length - 1);
      if (modifiedString.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(modifiedString);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            query = matchQuery[index];
            showResults(context);
          },
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  matchQuery[index],
                  style: const TextStyle(fontSize: 18),
                  softWrap: true,
                  maxLines: 5,
                ),
              ),
               IconButton(
                onPressed: () {
                  query=matchQuery[index];
                },
                icon: const Icon(Icons.arrow_outward_rounded),
              )
            ],
          ),
        );
      },
    );
  }

  // search results
  @override
  Widget buildResults(BuildContext context) {
    query.trim(); // remove all white spaces from start and end
    if (query.isNotEmpty) {

      // add past searches into the list with double quote
      if(suggestions.contains('"$query"')){
        suggestions.remove('"$query"');
      }
      suggestions.add('"$query"');

      // Search with double quote
      return SearchResult(searchTerm: '"$query"');
    } else {
      return const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.search), Text('No Results.')],
        ),
      );
    }
  }
  
}
