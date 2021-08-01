import 'package:anithing/models/anime_episodes.dart';
import 'package:anithing/router/routes.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import '../models/anime.dart';
import '../models/manga.dart';
import '../services/jikan_service.dart';

class JikanController extends GetxController {
  static JikanController instance = Get.find();
  RxString activeRoute = homeRoute.obs;
  RxBool isLoading = true.obs;
  RxBool isLoadingManga = true.obs;
  RxBool isLoadingAnime = true.obs;

  int? id;
  // Link to service
  RxList<Anime> animeList = <Anime>[].obs;
  RxList<Manga> mangaList = <Manga>[].obs;
  Anime? anime;
  List<AnimeEpisodes>? animeep;

  void getAnime() async {
    isLoading.value = true;
    anime = await AnimeService.fetchAnime(id!);
    animeep = await fetchAnimeEpisodes(id!) as List<AnimeEpisodes>;
    isLoading.value = false;
    print('-----Printing Retrieved Data----');
    print(anime!.malId.toString());
    print(animeep);
    for (var i = 0; i < animeep!.length; i++) {
      print(animeep![i].toCustomString());
    }

  Anime retrievedAnime = Anime();
  // TopMangaModel? topManga;
  RxList<TopMangaModel> topManga = <TopMangaModel>[].obs;
  RxList<TopAnimeModel> topAnime = <TopAnimeModel>[].obs;
  Manga? manga;

  }

  void getManga() async {
    isLoading.value = true;
    manga = await MangaService.manga(id!);
    isLoading.value = false;
  }

  Future<void> topMangaController() async {
    try {
      isLoadingManga.value = true;
      topManga.value = await getTopMangaList() as List<TopMangaModel>;
    } on Exception catch (e) {
      print(e.toString());
      Get.snackbar("Error!", e.toString());
    }
    isLoading.value = false;
  }

  //top anime controller
  Future<void> topAnimeController() async {
    try {
      isLoadingAnime.value = true;
      topAnime.value = await getTopAnimeList() as List<TopAnimeModel>;
    } on Exception catch (e) {
      print(e.toString());
      Get.snackbar("Error!", e.toString());
    }
    isLoading.value = false;
  }
}
