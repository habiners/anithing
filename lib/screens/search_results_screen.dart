import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/search_query_controller.dart';
import '../widgets/anime_search_tile.dart';
import '../widgets/custom_text.dart';
import '../widgets/manga_search_tile.dart';
import '../widgets/scaffold_appbar.dart';

class SearchResultsScreen extends StatelessWidget {
  SearchResultsScreen({Key? key}) : super(key: key);

  final SearchQueryController searchQueryController = Get.find();
  @override
  Widget build(BuildContext context) {
    searchQueryController.searchQuery();
    return Scaffold(
      appBar: createScaffoldAppBar(
        actions: [],
        title: "${searchQueryController.mode}: \"${searchQueryController.searchQueryTextController.text}\"",
      ),
      body: Obx(
        () => searchQueryController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: searchQueryController.mode.value == "Anime"
                    ? searchQueryController.animeSearchResults.isEmpty
                        ? [
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(top: 14),
                              child: CustomText(text: "No Results found!", size: 48, weight: FontWeight.bold),
                            ),
                          ]
                        : [
                            for (int i = 0; i < searchQueryController.animeSearchResults.length; i++)
                              AnimeSearchTile(anime: searchQueryController.animeSearchResults[i], odd: i % 2 == 0)
                          ]
                    : searchQueryController.mangaSearchResults.isEmpty
                        ? [
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(top: 14),
                              child: CustomText(text: "No Results found!", size: 48, weight: FontWeight.bold),
                            ),
                          ]
                        : [
                            for (int i = 0; i < searchQueryController.mangaSearchResults.length; i++)
                              MangaSearchTile(manga: searchQueryController.mangaSearchResults[i], odd: i % 2 == 0)
                          ],
              ),
      ),
    );
  }
}
