import 'package:anithing/models/anime_episodes.dart';
import 'dart:convert';

import 'package:anithing/models/manga.dart';
import 'package:http/http.dart' as http;

import '../models/anime.dart';
import '../models/anime_search_result.dart';
import '../models/manga_search_result.dart';

// Fetch endpoints
String apiBasePath = "https://api.jikan.moe/v3";
// Zath ==============================
// 1. Anime Information: /anime/{int:id}
// Sample: https://api.jikan.moe/v3/anime/21/ - Gets One Piece Anime Info
// Anime fetchAnime(int animeId) {
//   return Anime();
// }
String aniPath = "https://api.jikan.moe/v3/anime/";

class AnimeService {
  static Future<Anime> fetchAnime(int? id) async {
    try {
      Uri uri = Uri.parse(aniPath + id.toString());
      print(uri.toString());
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        return detailsFromJson(response.body);
      } else {
        throw Exception('Failed to load!');
      }
    } catch (e) {
      throw e;
    }
  }
}

// 2. Anime Episodes: /anime/{int:id}/episode
// Sample: https://api.jikan.moe/v3/anime/21/episodes
// - Gets One Piece Anime Episodes
// String animeEp = "https://api.jikan.moe/v3/anime/id/episodes";

Future<List<dynamic>> fetchAnimeEpisodes(int id) async {
  try {
    Uri uri =
        // Uri.parse("https://api.jikan.moe/v3/anime/${id.toString()}/episodes");
        Uri.parse(aniPath + id.toString() + "/episodes");
    print(uri.toString());
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String jsonString = response.body;
      return listAnimeEpisodesFromJsonString(jsonString);
    } else {
      return [];
    }
  } catch (e) {
    throw (e);
  }
}
// Ed ==============================
// 3. Manga Information: https://api.jikan.moe/v3/manga/%7Bint:id%7D
// Sample: https://api.jikan.moe/v3/manga/1 - Gets Monster Manga Info
class MangaService {
  static Future<Manga> manga(int id) async {
    final response = await http
        .get(Uri.parse('https://api.jikan.moe/v3/manga/' + id.toString()));
    // Manga? a;
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return Manga.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Manga');
    }
  }
}

// 4. Top Manga & Anime (with multiple pages): https://api.jikan.moe/v3/top/%7Bstring:anime%7C%7Cmanga%7D/%7Bint:page%7D
// Samples:
// https://api.jikan.moe/v3/top/anime/1/ - Gets top anime, page 1
// https://api.jikan.moe/v3/top/manga/2/ - Gets top manga, page 2
Future<List<dynamic>> getTopMangaList() async {
  try {
    Uri uri = Uri.parse('https://api.jikan.moe/v3/top/manga/1');
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String jsonString = response.body;

      return topMangaListConverter(jsonString, 'top');
    } else {
      return [];
    }
  } catch (e) {
    throw e;
  }
}

Future<List<dynamic>> getTopAnimeList() async {
  try {
    Uri uri = Uri.parse('https://api.jikan.moe/v3/top/anime/1');
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String jsonString = response.body;

      return topAnimeListConverter(jsonString, 'top');
    } else {
      return [];
    }
  } catch (e) {
    throw e;
  }
}

// Javin ==============================
// 5. Browse Anime/Manga By Genre https://api.jikan.moe/v3/genre/%7Bstring:anime%7C%7Cmanga%7D/%7Bint:page%7D
// Sample:
// https://api.jikan.moe/v3/genre/anime/1 - Gets anime with "Action" Genre, page 1
// https://api.jikan.moe/v3/genre/manga/2 - Gets anime with "Adventure" Genre, page 2
Future<List<dynamic>> fetchGenreQuery(String genreId, String mode) async {
  try {
    Uri uri = Uri.parse('$apiBasePath/genre/$mode/$genreId');
    print(uri.toString());
    print(mode);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String jsonString = response.body;
      if (mode == "anime")
        return listAnimeSearchResultFromJsonString(jsonString, 'anime');
      else
        return listMangaSearchResultFromJsonString(jsonString, 'manga');
    } else {
      return [];
    }
  } catch (e) {
    throw (e);
  }
}

// 6. Search Anime and Manga (LISOD NI)
// Sample: https://api.jikan.moe/v3/search/anime?q=Fate/Zero&page=1
Future<List<dynamic>> fetchSearchQuery(
    String searchQueryParameters, String mode) async {
  try {
    Uri uri = Uri.parse('$apiBasePath/search/$searchQueryParameters');
    print(uri.toString());
    print(mode);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String jsonString = response.body;
      if (mode == "Anime")
        return listAnimeSearchResultFromJsonString(jsonString, 'results');
      else
        return listMangaSearchResultFromJsonString(jsonString, 'results');
    } else {
      return [];
    }
  } catch (e) {
    throw e;
  }
}
