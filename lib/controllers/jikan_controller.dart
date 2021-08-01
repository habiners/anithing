import 'package:anithing/models/anime_episodes.dart';
import 'package:anithing/router/routes.dart';
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
  RxString activeRoute = homeRoute.obs;
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
  }
}
