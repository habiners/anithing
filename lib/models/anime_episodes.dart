import "dart:convert" as converter;

List<AnimeEpisodes> listAnimeEpisodesFromJsonString(String jsonString) {
  List<dynamic> jsonMap = converter.jsonDecode(jsonString)['episodes'];
  print('----JSON-----');
  print(jsonMap);
  return List<AnimeEpisodes>.from(
    jsonMap.map(
      (jsonItem) => AnimeEpisodes.fromJson(jsonItem),
    ),
  );
}

class AnimeEpisodes {
  int episode_id;
  String title;
  Aired aired;

  AnimeEpisodes({
    required this.episode_id,
    required this.title,
    required this.aired,
  });

  factory AnimeEpisodes.fromJson(Map<String, dynamic> json) =>
      new AnimeEpisodes(
        episode_id: json["episode_id"],
        title: json["title"] ?? 'No title',
        aired: Aired.fromJson(json["aired"]),
      );
}

class Aired {
  DateTime from;
  dynamic to;
  Prop prop;
  String string;

  Aired({
    required this.from,
    this.to,
    required this.prop,
    required this.string,
  });

  factory Aired.fromJson(Map<String, dynamic> json) => new Aired(
        from: DateTime.parse(json["from"]),
        to: json["to"],
        prop: Prop.fromJson(json["prop"]),
        string: json["string"],
      );

  Map<String, dynamic> toJson() => {
        "from": from.toIso8601String(),
        "to": to,
        "prop": prop.toJson(),
        "string": string,
      };
}

class Prop {
  From from;
  From to;

  Prop({
    required this.from,
    required this.to,
  });

  factory Prop.fromJson(Map<String, dynamic> json) => new Prop(
        from: From.fromJson(json["from"]),
        to: From.fromJson(json["to"]),
      );

  Map<String, dynamic> toJson() => {
        "from": from.toJson(),
        "to": to.toJson(),
      };
}

class From {
  int day;
  int month;
  int year;

  From({
    required this.day,
    required this.month,
    required this.year,
  });

  factory From.fromJson(Map<String, dynamic> json) => new From(
        day: json["day"] == null ? null : json["day"],
        month: json["month"] == null ? null : json["month"],
        year: json["year"] == null ? null : json["year"],
      );

  Map<String, dynamic> toJson() => {
        "day": day == null ? null : day,
        "month": month == null ? null : month,
        "year": year == null ? null : year,
      };
}
