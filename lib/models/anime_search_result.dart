import "dart:convert" as converter;

List<AnimeSearchResult> listAnimeSearchResultFromJsonString(String jsonString) {
  List<dynamic> jsonMap = converter.jsonDecode(jsonString)['results'];
  return List<AnimeSearchResult>.from(
    jsonMap.map(
      (jsonItem) => AnimeSearchResult.fromJson(jsonItem),
    ),
  );
}

class AnimeSearchResult {
  AnimeSearchResult({
    required this.malId,
    required this.url,
    required this.imageUrl,
    required this.title,
    required this.airing,
    required this.synopsis,
    required this.episodes,
    required this.score,
    required this.rated,
  });

  final int malId;
  final String url;
  final String imageUrl;
  final String title;
  final bool airing;
  final String synopsis;
  final num episodes;
  final num score;
  final String rated;

  factory AnimeSearchResult.fromJson(Map<String, dynamic> json) => AnimeSearchResult(
        malId: json['mal_id'],
        url: json['url'],
        imageUrl: json['image_url'],
        title: json['title'],
        airing: json['airing'],
        synopsis: json['synopsis'],
        episodes: json['episodes'] ?? 0,
        score: json['score'] ?? 0,
        rated: json['rated'] ?? "",
      );
}
