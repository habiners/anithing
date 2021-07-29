import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './controllers/jikan_controller.dart';
import './screens/home.dart';
import './screens/search_results.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'AniThing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: homeRoute,
      getPages: [
        GetPage(name: homeRoute, page: () => HomeScreen()),
        GetPage(name: animeDetailsRoute, page: () => HomeScreen()),
        GetPage(name: animeEpisodesRoute, page: () => HomeScreen()),
        GetPage(name: mangaDetailsRoute, page: () => HomeScreen()),
        GetPage(name: topAnimeRoute, page: () => HomeScreen()),
        GetPage(name: topMangaRoute, page: () => HomeScreen()),
        GetPage(name: browseGenreRoute, page: () => HomeScreen()),
        GetPage(name: searchResultRoute, page: () => SearchResultsScreen()),
      ],
    );
  }
}
