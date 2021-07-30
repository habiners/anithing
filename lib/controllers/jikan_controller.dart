import 'package:get/get.dart';

import '../models/anime.dart';
import '../models/manga.dart';
import '../services/jikan_service.dart';

class JikanController extends GetxController {
  static JikanController instance = Get.find();

  JikanController({this.id});
  RxBool isLoading = true.obs;
  int? id;
  // Link to service
  RxList<Anime> animeList = <Anime>[].obs;
  RxList<Manga> mangaList = <Manga>[].obs;
  Anime retrievedAnime = Anime();
  Manga? manga;
  void getAnime(int animeId) {
    Anime retrievedAnime = fetchAnime(animeId);
  }

  void getManga(int mangaId) async {
    manga = await MangaService.manga(mangaId);
    isLoading = false.obs;
    print('--------------------------------------------');
    print(manga!.malId.toString());
    print(manga!.title);
    print(mangaId);
  }
}
