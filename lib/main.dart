import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/styles.dart';
import './controllers/jikan_controller.dart';
import './controllers/browse_genre_controller.dart';
import './controllers/search_query_controller.dart';
import './screens/home_screen.dart';
import './screens/top_anime_screen.dart';
import './screens/top_manga_screen.dart';
import './screens/browse_genres_screen.dart';
import './router/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(JikanController());
  Get.put(SearchQueryController());
  Get.put(BrowseGenreController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AniThing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: blackCoffeeColor,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: mintCreamColor,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      initialRoute: homeRoute,
      getPages: [
        GetPage(name: homeRoute, page: () => HomeScreen()),
        GetPage(name: topAnimeRoute, page: () => TopAnimeListScreen()),
        GetPage(name: topMangaRoute, page: () => TopMangaListScreen()),
        GetPage(name: browseGenreRoute, page: () => BrowseGenresScreen()),
      ],
    );
  }
}
