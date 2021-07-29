import 'package:anithing/router/routes.dart';
import 'package:get/get.dart';

import '../models/anime.dart';
import '../models/manga.dart';
import '../services/jikan_service.dart';

class JikanController extends GetxController {
  static JikanController instance = Get.find();

  // Link to service
  RxList<Anime> animeList = <Anime>[].obs;
  RxList<Manga> mangaList = <Manga>[].obs;
  Anime retrievedAnime = Anime();
  RxString activeRoute = homeRoute.obs;

  void getAnime(int animeId) {
    Anime retrievedAnime = fetchAnime(animeId);
  }
}
