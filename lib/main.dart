import 'package:anithing/screens/anime_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './controllers/jikan_controller.dart';
import './screens/home.dart';
import './router/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(JikanController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AniThing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: homeRoute,
      getPages: [
        GetPage(name: homeRoute, page: () => Home()),
        GetPage(name: animeDetailsRoute, page: () => Home()),
        GetPage(name: animeEpisodesRoute, page: () => Home()),
        GetPage(name: mangaDetailsRoute, page: () => Home()),
        GetPage(name: topAnimeRoute, page: () => Home()),
        GetPage(name: topMangaRoute, page: () => Home()),
        GetPage(name: browseGenreRoute, page: () => Home()),
        GetPage(name: animeSearchRoute, page: () => AnimeSearch()),
      ],
    );
  }
}
