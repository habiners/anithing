import 'dart:convert';

Manga mangaFromJson(String str) => Manga.fromJson(json.decode(str));
// List<Manga> mangaFromJson(String str) =>
//     List<Manga>.from(json.decode(str).map((x) => Manga.fromJson(x)));
String mangaToJson(Manga data) => json.encode(data.toJson());
// String productToJson(List<Manga> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Manga {
  Manga({
    required this.requestHash,
    required this.requestCached,
    required this.requestCacheExpiry,
    required this.malId,
    required this.url,
    required this.title,
    required this.titleEnglish,
    required this.titleSynonyms,
    required this.titleJapanese,
    required this.status,
    required this.imageUrl,
    required this.type,
    required this.volumes,
    required this.chapters,
    required this.publishing,
    required this.published,
    required this.rank,
    required this.score,
    required this.scoredBy,
    required this.popularity,
    required this.members,
    required this.favorites,
    required this.synopsis,
    required this.background,
    required this.related,
    required this.genres,
    required this.authors,
    required this.serializations,
  });

  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  int malId;
  String url;
  String title;
  String titleEnglish;
  List<dynamic> titleSynonyms;
  String titleJapanese;
  String status;
  String imageUrl;
  String type;
  int volumes;
  int chapters;
  bool publishing;
  Published published;
  int rank;
  double score;
  int scoredBy;
  int popularity;
  int members;
  int favorites;
  String synopsis;
  String background;
  Related related;
  List<Author> genres;
  List<Author> authors;
  List<Author> serializations;

  factory Manga.fromJson(Map<String, dynamic> json) => Manga(
        requestHash: json["request_hash"],
        requestCached: json["request_cached"],
        requestCacheExpiry: json["request_cache_expiry"],
        malId: json["mal_id"],
        url: json["url"],
        title: json["title"],
        titleEnglish: json["title_english"],
        titleSynonyms: List<dynamic>.from(json["title_synonyms"].map((x) => x)),
        titleJapanese: json["title_japanese"],
        status: json["status"],
        imageUrl: json["image_url"],
        type: json["type"],
        volumes: json["volumes"],
        chapters: json["chapters"],
        publishing: json["publishing"],
        published: Published.fromJson(json["published"]),
        rank: json["rank"],
        score: json["score"].toDouble(),
        scoredBy: json["scored_by"],
        popularity: json["popularity"],
        members: json["members"],
        favorites: json["favorites"],
        synopsis: json["synopsis"],
        background: json["background"],
        related: Related.fromJson(json["related"]),
        genres:
            List<Author>.from(json["genres"].map((x) => Author.fromJson(x))),
        authors:
            List<Author>.from(json["authors"].map((x) => Author.fromJson(x))),
        serializations: List<Author>.from(
            json["serializations"].map((x) => Author.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "request_hash": requestHash,
        "request_cached": requestCached,
        "request_cache_expiry": requestCacheExpiry,
        "mal_id": malId,
        "url": url,
        "title": title,
        "title_english": titleEnglish,
        "title_synonyms": List<dynamic>.from(titleSynonyms.map((x) => x)),
        "title_japanese": titleJapanese,
        "status": status,
        "image_url": imageUrl,
        "type": type,
        "volumes": volumes,
        "chapters": chapters,
        "publishing": publishing,
        "published": published.toJson(),
        "rank": rank,
        "score": score,
        "scored_by": scoredBy,
        "popularity": popularity,
        "members": members,
        "favorites": favorites,
        "synopsis": synopsis,
        "background": background,
        "related": related.toJson(),
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "authors": List<dynamic>.from(authors.map((x) => x.toJson())),
        "serializations":
            List<dynamic>.from(serializations.map((x) => x.toJson())),
      };
}

class Author {
  Author({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  int malId;
  String type;
  String name;
  String url;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
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

class Published {
  Published({
    required this.from,
    required this.to,
    required this.prop,
    required this.string,
  });

  DateTime from;
  DateTime to;
  Prop prop;
  String string;

  factory Published.fromJson(Map<String, dynamic> json) => Published(
        from: DateTime.parse(json["from"]),
        to: DateTime.parse(json["to"]),
        prop: Prop.fromJson(json["prop"]),
        string: json["string"],
      );

  Map<String, dynamic> toJson() => {
        "from": from.toIso8601String(),
        "to": to.toIso8601String(),
        "prop": prop.toJson(),
        "string": string,
      };
}

class Prop {
  Prop({
    required this.from,
    required this.to,
  });

  From from;
  From to;

  factory Prop.fromJson(Map<String, dynamic> json) => Prop(
        from: From.fromJson(json["from"]),
        to: From.fromJson(json["to"]),
      );

  Map<String, dynamic> toJson() => {
        "from": from.toJson(),
        "to": to.toJson(),
      };
}

class From {
  From({
    required this.day,
    required this.month,
    required this.year,
  });

  int day;
  int month;
  int year;

  factory From.fromJson(Map<String, dynamic> json) => From(
        day: json["day"],
        month: json["month"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "month": month,
        "year": year,
      };
}

class Related {
  Related({
    required this.sideStory,
    required this.adaptation,
  });

  List<Author> sideStory;
  List<Author> adaptation;

  factory Related.fromJson(Map<String, dynamic> json) => Related(
        sideStory: List<Author>.from(
            json["Side story"].map((x) => Author.fromJson(x))),
        adaptation: List<Author>.from(
            json["Adaptation"].map((x) => Author.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Side story": List<dynamic>.from(sideStory.map((x) => x.toJson())),
        "Adaptation": List<dynamic>.from(adaptation.map((x) => x.toJson())),
      };
}
