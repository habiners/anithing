import 'package:anithing/router/routes.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import '../models/anime.dart';
import '../models/manga.dart';
import '../services/jikan_service.dart';

class JikanController extends GetxController {
  static JikanController instance = Get.find();
  RxBool isLoading = true.obs;
  int? id;
  // Link to service
  RxList<Anime> animeList = <Anime>[].obs;
  RxList<Manga> mangaList = <Manga>[].obs;
  Anime retrievedAnime = Anime();
  // TopMangaModel? topManga;
  RxList<TopMangaModel> topManga = <TopMangaModel>[].obs;
  RxList<TopAnimeModel> topAnime = <TopAnimeModel>[].obs;
  Manga? manga;

  RxString activeRoute = homeRoute.obs;
  void getAnime(int animeId) {
    Anime retrievedAnime = fetchAnime(animeId);
  }

  void getManga() async {
    isLoading.value = true;
    manga = await MangaService.manga(id!);
    isLoading.value = false;
  }

  Future<void> topMangaController() async {
    isLoading.value = true;
    try {
      topManga.value = await getTopMangaList() as List<TopMangaModel>;
    } on Exception catch (e) {
      print(e.toString());
      Get.snackbar("Error!", e.toString());
    }
    isLoading.value = false;
  }

  //top anime controller
  Future<void> topAnimeController() async {
    isLoading.value = true;
    try {
      topAnime.value = await getTopAnimeList() as List<TopAnimeModel>;
    } on Exception catch (e) {
      print(e.toString());
      Get.snackbar("Error!", e.toString());
    }
    isLoading.value = false;
  }
}
