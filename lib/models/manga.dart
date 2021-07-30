class Manga {
  Manga({
    required this.malId,
    required this.url,
    required this.imageUrl,
    required this.title,
    required this.publishing,
    required this.synopsis,
    required this.type,
    required this.chapters,
    required this.volumes,
    required this.score,
    required this.status,
  });

  final int malId;
  final String url;
  final String imageUrl;
  final String title;
  final bool publishing;
  final String synopsis;
  final String type;
  final num chapters;
  final num volumes;
  final num score;
  final String status;

  factory Manga.fromJson(Map<String, dynamic> json) => Manga(
        malId: json['mal_id'],
        url: json['url'],
        imageUrl: json['image_url'],
        title: json['title'],
        publishing: json['publishing'],
        synopsis: json['synopsis'],
        type: json['type'],
        chapters: json['chapters'] ?? 0,
        volumes: json['volumes'] ?? 0,
        score: json['score'] ?? 0,
        status: json['status'],
      );
}
