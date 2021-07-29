import 'package:anithing/models/anime.dart';
import 'package:anithing/models/anime_search_result.dart';
import 'package:http/http.dart' as http;

import '../controllers/jikan_controller.dart';

// Fetch endpoints
String apiBasePath = "https://api.jikan.moe/v3";
// Zath ==============================
// 1. Anime Information: /anime/{int:id}
// Sample: https://api.jikan.moe/v3/anime/21/ - Gets One Piece Anime Info
Anime fetchAnime(int animeId) {
  return Anime();
}

// 2. Anime Episodes: /anime/{int:id}/episode
// Sample: https://api.jikan.moe/v3/anime/21/episodes
// - Gets One Piece Anime Episodes

// Ed ==============================
// 3. Manga Information: https://api.jikan.moe/v3/manga/%7Bint:id%7D
// Sample: https://api.jikan.moe/v3/manga/1 - Gets Monster Manga Info

// 4. Top Manga & Anime (with multiple pages): https://api.jikan.moe/v3/top/%7Bstring:anime%7C%7Cmanga%7D/%7Bint:page%7D
// Samples:
// https://api.jikan.moe/v3/top/anime/1/ - Gets top anime, page 1
// https://api.jikan.moe/v3/top/manga/2/ - Gets top manga, page 2

// Javin ==============================
// 5. Browse Anime/Manga By Genre https://api.jikan.moe/v3/genre/%7Bstring:anime%7C%7Cmanga%7D/%7Bint:page%7D
// Sample:
// https://api.jikan.moe/v3/genre/anime/1 - Gets anime with "Action" Genre, page 1
// https://api.jikan.moe/v3/genre/manga/2 - Gets anime with "Adventure" Genre, page 2

// 6. Search Anime and Manga (LISOD NI)
// Sample: https://api.jikan.moe/v3/search/anime?q=Fate/Zero&page=1
Future<List<AnimeSearchResult>> fetchSearchQuery(String searchQueryParameters) async {
  try {
    Uri uri = Uri.parse(apiBasePath + '/search/' + searchQueryParameters);
    print(uri.toString());
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String jsonString = response.body;
      List<AnimeSearchResult> result = listAnimeSearchResultFromJsonString(jsonString);
      return result;
    } else {
      return [];
    }
  } catch (e) {
    throw e;
  }
}
