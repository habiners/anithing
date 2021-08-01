import 'package:get/get.dart';

import '../models/anime_search_result.dart';
import '../models/manga_search_result.dart';
import '../services/jikan_service.dart';

class BrowseGenreController extends GetxController {
  RxString mode = "Anime".obs;
  RxInt selectedGenre = 0.obs;
  RxBool isLoading = true.obs;
  RxList<AnimeSearchResult> animeGenreResults = <AnimeSearchResult>[].obs;
  RxList<MangaSearchResult> mangaGenreResults = <MangaSearchResult>[].obs;

  Future<void> genreQuery({int page = 1}) async {
    isLoading.value = true;
    try {
      if (mode.value == "Anime") {
        animeGenreResults.value = await fetchGenreQuery((selectedGenre.value + 1).toString(), "anime") as List<AnimeSearchResult>;
      } else
        mangaGenreResults.value = await fetchGenreQuery((selectedGenre.value + 1).toString(), "manga") as List<MangaSearchResult>;
    } on Exception catch (e) {
      print(e.toString());
      Get.snackbar("Error!", e.toString());
    }
    isLoading.value = false;
  }
}
