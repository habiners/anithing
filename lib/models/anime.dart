import 'dart:convert';

Anime detailsFromJson(String str) => Anime.fromJson(json.decode(str));

class Anime {
  int malId;
  String url;
  String imageUrl;
  String title;
  num? episodes;
  String rating;
  num score;
  String? synopsis;

  Anime({
    required this.malId,
    required this.url,
    required this.imageUrl,
    required this.title,
    required this.episodes,
    required this.rating,
    required this.score,
    required this.synopsis,
  });

  factory Anime.fromJson(Map<String, dynamic> json) => new Anime(
        malId: json["mal_id"],
        url: json["url"],
        imageUrl: json["image_url"],
        title: json["title"] ?? 'No title',
        episodes: json["episodes"] ?? 0,
        rating: json["rating"],
        score: json["score"] ?? 0,
        synopsis: json["synopsis"] ?? 'No Synopsis',
      );
}
