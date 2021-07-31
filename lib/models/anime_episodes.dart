import 'dart:convert';

AnimeEpisodes detailsFromJson(String str) =>
    AnimeEpisodes.fromJson(json.decode(str));

String detailsToJson(AnimeEpisodes data) => json.encode(data.toJson());

class AnimeEpisodes {
  int malId;
  String url;
  String imageUrl;
  String title;
  // String type;
  // String source;
  num? episodes;
  // String status;
  // bool airing;
  Aired aired;
  // String duration;
  String rating;
  num score;
  // int scoredBy;
  // int rank;
  // int popularity;
  // int members;
  // int favorites;
  String? synopsis;
  // dynamic background;
  // String premiered;
  // String broadcast;
  // Related related;
  // List<Genre> producers;
  // List<Genre> licensors;
  // List<Genre> studios;
  List<Genre> genres;

  AnimeEpisodes({
    required this.malId,
    required this.url,
    required this.imageUrl,
    required this.title,
    // required this.type,
    // required this.source,
    required this.episodes,
    // required this.status,
    // required this.airing,
    required this.aired,
    // required this.duration,
    required this.rating,
    required this.score,
    // required this.scoredBy,
    // required this.rank,
    // required this.popularity,
    // required this.members,
    // required this.favorites,
    required this.synopsis,
    // this.background,
    // required this.premiered,
    // required this.broadcast,
    // required this.related,
    // required this.producers,
    // required this.licensors,
    // required this.studios,
    required this.genres,
  });

  factory AnimeEpisodes.fromJson(Map<String, dynamic> json) =>
      new AnimeEpisodes(
        malId: json["mal_id"],
        url: json["url"],
        imageUrl: json["image_url"],
        title: json["title"] ?? 'No title',
        // titleEnglish: json["title_english"],
        // titleJapanese: json["title_japanese"],
        // titleSynonyms:
        //     new List<dynamic>.from(json["title_synonyms"].map((x) => x)),
        // type: json["type"],
        // source: json["source"],
        episodes: json["episodes"] ?? 0,
        // status: json["status"],
        // airing: json["airing"],
        aired: Aired.fromJson(json["aired"]),
        // duration: json["duration"],
        rating: json["rating"],
        score: json["score"] ?? 0,
        // scoredBy: json["scored_by"],
        // rank: json["rank"],
        // popularity: json["popularity"],
        // members: json["members"],
        // favorites: json["favorites"],
        synopsis: json["synopsis"] ?? 'No Synopsis',
        // background: json["background"],
        // premiered: json["premiered"],
        // broadcast: json["broadcast"],
        // related: Related.fromJson(json["related"]),
        // producers: new List<Genre>.from(
        //     json["producers"].map((x) => Genre.fromJson(x))),
        // licensors: new List<Genre>.from(
        //     json["licensors"].map((x) => Genre.fromJson(x))),
        // studios:
        //     new List<Genre>.from(json["studios"].map((x) => Genre.fromJson(x))),
        genres:
            new List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "url": url,
        "image_url": imageUrl,
        // "trailer_url": trailerUrl,
        "title": title,
        // "title_english": titleEnglish,
        // "title_japanese": titleJapanese,
        // "title_synonyms": new List<dynamic>.from(titleSynonyms.map((x) => x)),
        // "type": type,
        // "source": source,
        "episodes": episodes,
        // "status": status,
        // "airing": airing,
        // "aired": aired.toJson(),
        // "duration": duration,
        "rating": rating,
        "score": score,
        // "scored_by": scoredBy,
        // "rank": rank,
        // "popularity": popularity,
        // "members": members,
        // "favorites": favorites,
        // "synopsis": synopsis,
        // "background": background,
        // "premiered": premiered,
        // "broadcast": broadcast,
        // "related": related.toJson(),
        // "producers": new List<dynamic>.from(producers.map((x) => x.toJson())),
        // "licensors": new List<dynamic>.from(licensors.map((x) => x.toJson())),
        // "studios": new List<dynamic>.from(studios.map((x) => x.toJson())),
        "genres": new List<dynamic>.from(genres.map((x) => x.toJson())),
      };
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

class Genre {
  int malId;
  String type;
  String name;
  String url;

  Genre({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => new Genre(
        malId: json["mal_id"],
        type: json["type"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "type": type,
        "name": name,
        "url": url,
      };
}

class Related {
  List<Genre> adaptation;

  Related({
    required this.adaptation,
  });

  factory Related.fromJson(Map<String, dynamic> json) => new Related(
        adaptation: new List<Genre>.from(
            json["Adaptation"].map((x) => Genre.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Adaptation": new List<dynamic>.from(adaptation.map((x) => x.toJson())),
      };
}
