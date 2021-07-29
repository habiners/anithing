import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/genres.dart';
import '../models/anime_search_result.dart';
import '../models/manga_search_result.dart';
import '../services/jikan_service.dart';

class SearchQueryController extends GetxController {
  RxString mode = "Anime".obs;
  RxBool isLoading = true.obs;
  TextEditingController searchQueryTextController = TextEditingController();

  RxInt selectedGenre = 0.obs;
  RxList<bool> selectedAnimeGenres = List<bool>.filled(AnimeGenres.values.length, false).obs;
  RxList<bool> selectedMangaGenres = List<bool>.filled(MangaGenres.values.length, false).obs;
  RxList<AnimeSearchResult> animeSearchResults = <AnimeSearchResult>[].obs;
  RxList<MangaSearchResult> mangaSearchResults = <MangaSearchResult>[].obs;

  Future<void> searchQuery({int page = 1}) async {
    isLoading.value = true;
    try {
      print("=====Creation of Search Query=====");
      String searchQuery = "${mode.value == "Anime" ? "anime" : "manga"}?q=${searchQueryTextController.text}&page=$page";
      String genresQuery = "";
      if (mode.value == "Anime") {
        if (selectedAnimeGenres.contains(true)) {
          genresQuery = "&genre=";
          for (var i = 0; i < AnimeGenres.values.length; i++) {
            if (selectedAnimeGenres[i]) genresQuery += (AnimeGenres.values[i + 1].index.toString() + ',');
          }
          genresQuery = genresQuery.replaceFirst(",", "", genresQuery.length - 1);
        }
      } else {
        if (selectedMangaGenres.contains(true)) {
          genresQuery = "&genre=";
          for (var i = 0; i < MangaGenres.values.length; i++) {
            if (selectedMangaGenres[i]) genresQuery += (MangaGenres.values[i + 1].index.toString() + ',');
          }
          genresQuery = genresQuery.replaceFirst(",", "", genresQuery.length - 1);
        }
      }
      searchQuery += genresQuery;
      print(searchQuery);

      if (mode.value == "Anime")
        animeSearchResults.value = await fetchSearchQuery(searchQuery, "Anime") as List<AnimeSearchResult>;
      else
        mangaSearchResults.value = await fetchSearchQuery(searchQuery, "Manga") as List<MangaSearchResult>;
    } on Exception catch (e) {
      print(e.toString());
      Get.snackbar("Error!", e.toString());
    }
    isLoading.value = false;
  }
}
