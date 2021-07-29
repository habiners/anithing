import 'package:anithing/constants/controllers.dart';
import 'package:anithing/widgets/scaffold_appbar.dart';
import 'package:flutter/material.dart';

class AnimeSearch extends StatelessWidget {
  const AnimeSearch({Key? key, this.queried = ""}) : super(key: key);

  final String queried;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScaffoldAppBar(appBar: AppBar(), actions: [], title: "\"${jikanController.searchQueryTextController.text}\" Search Results"),
      body: Container(
        child: ListView(
          children: jikanController.animeSearchResults
              .map(
                (animeResult) => Container(
                  child: Text(animeResult.title),
                  padding: EdgeInsets.symmetric(vertical: 4),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
