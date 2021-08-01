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
  int episodeId;
  String title;
  String aired;

  AnimeEpisodes({
    required this.episodeId,
    required this.title,
    required this.aired,
  });

  factory AnimeEpisodes.fromJson(Map<String, dynamic> json) => new AnimeEpisodes(
        episodeId: json["episode_id"],
        title: json["title"] ?? 'No title',
        aired: json["aired"] != null || json["aired"] != '' ? json["aired"].toString().substring(0, 10) : 'Unknown',
      );
}
