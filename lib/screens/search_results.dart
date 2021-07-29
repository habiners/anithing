import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/search_anime_controller.dart';
import '../models/anime_search_result.dart';
import '../models/manga_search_result.dart';
import '../widgets/anime_search_tile.dart';
import '../widgets/manga_search_tile.dart';
import '../widgets/scaffold_appbar.dart';

class SearchResultsScreen extends StatelessWidget {
  SearchResultsScreen({Key? key}) : super(key: key);

  final SearchAnimeController jikanController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScaffoldAppBar(
        appBar: AppBar(),
        actions: [],
        title: "${jikanController.mode}: \"${jikanController.searchQueryTextController.text}\"",
      ),
      body: Obx(
        () => jikanController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: jikanController.mode.value == "Anime"
                    ? jikanController.animeSearchResults
                        .map(
                          (AnimeSearchResult animeResult) => AnimeSearchTile(anime: animeResult),
                        )
                        .toList()
                    : jikanController.mangaSearchResults
                        .map(
                          (MangaSearchResult mangaResult) => MangaSearchTile(manga: mangaResult),
                        )
                        .toList(),
              ),
      ),
    );
  }
}
