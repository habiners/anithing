import "dart:convert" as converter;

List<AnimeEpisodes> listAnimeEpisodesFromJsonString(String jsonString) {
  List<dynamic> jsonMap = converter.jsonDecode(jsonString)['episodes'];
  return List<AnimeEpisodes>.from(
    jsonMap.map(
      (jsonItem) => AnimeEpisodes.fromJson(jsonItem),
    ),
  );
}

class AnimeEpisodes {
  int episode_id;
  String title;
  String aired;

  AnimeEpisodes({
    required this.episode_id,
    required this.title,
    required this.aired,
  });

  String toCustomString() {
    return "Ep: $episode_id, Title: $title, Aired: $aired";
  }

  factory AnimeEpisodes.fromJson(Map<String, dynamic> json) =>
      new AnimeEpisodes(
        episode_id: json["episode_id"],
        title: json["title"] ?? 'No title',
        aired: json["aired"] != null || json["aired"] != ''
            ? json["aired"].toString().substring(0, 10)
            : 'Unknown',
      );
}
