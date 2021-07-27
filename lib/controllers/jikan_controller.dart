import 'package:get/get.dart';
import '../services/jikan_service.dart';

import '../models/anime.dart';
import '../models/manga.dart';

class JikanController extends GetxController {
  static JikanController instance = Get.find();

  // Link to service
  RxList<Anime> animeList = <Anime>[].obs;
  RxList<Manga> mangaList = <Manga>[].obs;
  Anime retrievedAnime = Anime();
  void getAnime(int animeId) {
    Anime retrievedAnime = fetchAnime(animeId);
  }
}
