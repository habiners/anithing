import 'dart:convert';

Anime detailsFromJson(String str) => Anime.fromJson(json.decode(str));

class Anime {
  int malId;
  String url;
  String imageUrl;
  String title;
  String rating;
  String status;
  num score;
  String? synopsis;

  Anime({
    required this.malId,
    required this.url,
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.status,
    required this.score,
    required this.synopsis,
  });

  factory Anime.fromJson(Map<String, dynamic> json) => new Anime(
        malId: json["mal_id"],
        url: json["url"],
        imageUrl: json["image_url"],
        title: json["title"] ?? 'No title',
        rating: json["rating"],
        status: json["status"],
        score: json["score"] ?? 0,
        synopsis: json["synopsis"] ?? 'No Synopsis',
      );
}
