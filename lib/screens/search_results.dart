import 'package:anithing/constants/controllers.dart';
import 'package:anithing/models/anime_search_result.dart';
import 'package:anithing/models/manga_search_result.dart';
import 'package:anithing/widgets/scaffold_appbar.dart';
import 'package:flutter/material.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScaffoldAppBar(
          appBar: AppBar(), actions: [], title: "\"${jikanController.searchQueryTextController.text}\" ${jikanController.mode} Search Results"),
      body: Container(
        child: ListView(
          children: jikanController.mode.value == "Anime"
              ? jikanController.animeSearchResults
                  .map(
                    (AnimeSearchResult animeResult) => Container(
                      child: Text(animeResult.title),
                      padding: EdgeInsets.symmetric(vertical: 4),
                    ),
                  )
                  .toList()
              : jikanController.mangaSearchResults
                  .map(
                    (MangaSearchResult mangaResult) => Container(
                      child: Text(mangaResult.title),
                      padding: EdgeInsets.symmetric(vertical: 4),
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }
}
