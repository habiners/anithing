import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/search_query_controller.dart';
import '../widgets/anime_search_tile.dart';
import '../widgets/custom_text.dart';
import '../widgets/manga_search_tile.dart';
import '../widgets/scaffold_appbar.dart';

class SearchResultsScreen extends StatelessWidget {
  SearchResultsScreen({Key? key}) : super(key: key);

  final SearchAnimeController jikanController = Get.find();
  @override
  Widget build(BuildContext context) {
    jikanController.searchQuery();
    return Scaffold(
      appBar: createScaffoldAppBar(
        actions: [],
        title: "${jikanController.mode}: \"${jikanController.searchQueryTextController.text}\"",
      ),
      body: Obx(
        () => jikanController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: jikanController.mode.value == "Anime"
                    ? jikanController.animeSearchResults.isEmpty
                        ? [
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(top: 14),
                              child: CustomText(text: "No Results found!", size: 48, weight: FontWeight.bold),
                            ),
                          ]
                        : [
                            for (int i = 0; i < jikanController.animeSearchResults.length; i++)
                              AnimeSearchTile(anime: jikanController.animeSearchResults[i], odd: i % 2 == 0)
                          ]
                    : jikanController.mangaSearchResults.isEmpty
                        ? [
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(top: 14),
                              child: CustomText(text: "No Results found!", size: 48, weight: FontWeight.bold),
                            ),
                          ]
                        : [
                            for (int i = 0; i < jikanController.mangaSearchResults.length; i++)
                              MangaSearchTile(manga: jikanController.mangaSearchResults[i], odd: i % 2 == 0)
                          ],
              ),
      ),
    );
  }
}
