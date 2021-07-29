import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../constants/genres.dart';
import '../models/anime_search_result.dart';
import '../models/anime.dart';
import '../models/manga.dart';
import '../services/jikan_service.dart';

class JikanController extends GetxController {
  static JikanController instance = Get.find();

  // Link to service
  RxList<Anime> animeList = <Anime>[].obs;
  RxList<Manga> mangaList = <Manga>[].obs;
  Anime retrievedAnime = Anime();

  RxString mode = "Anime".obs;
  TextEditingController searchQueryTextController = TextEditingController(text: "Fate");
  RxList<bool> selectedAnimeGenres = List<bool>.filled(AnimeGenres.values.length, false).obs;
  RxList<bool> selectedMangaGenres = List<bool>.filled(MangaGenres.values.length, false).obs;
  RxList<AnimeSearchResult> animeSearchResults = <AnimeSearchResult>[].obs;

  void getAnime(int animeId) {
    Anime retrievedAnime = fetchAnime(animeId);
  }

  Future<void> searchQuery({int page = 1}) async {
    if (searchQueryTextController.text.length < 3) {
      Get.snackbar("Warning!", "Search query must contain at least 3 letters!");
      return;
    }
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
    animeSearchResults.value = await fetchSearchQuery(searchQuery);
    print(animeSearchResults);
  }
}
