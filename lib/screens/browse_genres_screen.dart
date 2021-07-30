import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../constants/genres.dart';
import '../constants/styles.dart';
import '../controllers/browse_genre_controller.dart';
import '../widgets/custom_text.dart';
import '../widgets/scaffold_appbar.dart';
import '../widgets/scaffold_drawer.dart';
import '../widgets/anime_search_tile.dart';
import '../widgets/manga_search_tile.dart';

class BrowseGenresScreen extends StatelessWidget {
  BrowseGenresScreen({Key? key}) : super(key: key);

  final BrowseGenreController browseGenreController = Get.find();

  bool _notAtFirstGenre() => browseGenreController.selectedGenre.value > 0;

  bool _notAtLastGenre() {
    return (browseGenreController.selectedGenre.value <
        (browseGenreController.mode.value == "Anime" ? AnimeGenres.values.length - 1 : MangaGenres.values.length - 1));
  }

  @override
  Widget build(BuildContext context) {
    browseGenreController.genreQuery();
    return Scaffold(
      appBar: createScaffoldAppBar(title: "Browse by Genre | ${browseGenreController.mode.value}", actions: []),
      drawer: ScaffoldDrawer(),
      body: Obx(
        () => Column(
          children: [
            // Anime/Manga Toggle
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Container(
                      height: 40,
                      width: 120,
                      child: Center(child: CustomText(text: "Anime")),
                      decoration: BoxDecoration(
                        color: browseGenreController.mode.value == "Anime" ? royalBlueLightColor : independenceColor,
                        border: Border(),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                    ),
                    onTap: () {
                      if (browseGenreController.mode.value != "Anime") {
                        browseGenreController.mode.value = "Anime";
                        browseGenreController.selectedGenre.value = 0;
                        browseGenreController.genreQuery();
                      }
                    },
                  ),
                  Container(width: 1, height: 40, color: Colors.white),
                  InkWell(
                    child: Container(
                      height: 40,
                      width: 120,
                      child: Center(child: CustomText(text: "Manga")),
                      decoration: BoxDecoration(
                        color: browseGenreController.mode.value == "Manga" ? royalBlueLightColor : independenceColor,
                        border: Border(),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                    ),
                    onTap: () {
                      if (browseGenreController.mode.value != "Manga") {
                        browseGenreController.mode.value = "Manga";
                        browseGenreController.selectedGenre.value = 0;
                        browseGenreController.genreQuery();
                      }
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_left, color: _notAtFirstGenre() ? mintCreamColor : independenceColor, size: 30),
                    onPressed: () {
                      if (_notAtFirstGenre()) {
                        browseGenreController.selectedGenre.value--;
                        browseGenreController.genreQuery();
                      }
                    },
                  ),
                ),
                DropdownButton<int>(
                  style: TextStyle(color: mintCreamColor),
                  value: browseGenreController.selectedGenre.value,
                  dropdownColor: blackCoffeeColor,
                  iconEnabledColor: mintCreamColor,
                  onChanged: (int? newSelected) {
                    browseGenreController.selectedGenre.value = newSelected ?? 0;
                    browseGenreController.genreQuery();
                  },
                  items: browseGenreController.mode.value == "Anime"
                      ? AnimeGenres.values
                          .map((AnimeGenres genre) => DropdownMenuItem<int>(
                                value: genre.index,
                                child: CustomText(text: genre.toString().split('.').last.replaceAll('_', ' ')),
                              ))
                          .toList()
                      : MangaGenres.values
                          .map(
                            (MangaGenres genre) => DropdownMenuItem<int>(
                              value: genre.index,
                              child: CustomText(text: genre.toString().split('.').last.replaceAll('_', ' ')),
                            ),
                          )
                          .toList(),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_right, color: _notAtLastGenre() ? mintCreamColor : independenceColor, size: 30),
                    onPressed: () {
                      if (_notAtLastGenre()) {
                        browseGenreController.selectedGenre.value++;
                        browseGenreController.genreQuery();
                      }
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: browseGenreController.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : ListView(
                      children: browseGenreController.mode.value == "Anime"
                          ? browseGenreController.animeGenreResults.isEmpty
                              ? [
                                  Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(top: 14),
                                    child: CustomText(text: "No Results found!", size: 48, weight: FontWeight.bold),
                                  ),
                                ]
                              : [
                                  for (int i = 0; i < browseGenreController.animeGenreResults.length; i++)
                                    AnimeSearchTile(anime: browseGenreController.animeGenreResults[i], odd: i % 2 == 1)
                                ]
                          : browseGenreController.mangaGenreResults.isEmpty
                              ? [
                                  Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(top: 14),
                                    child: CustomText(text: "No Results found!", size: 48, weight: FontWeight.bold),
                                  ),
                                ]
                              : [
                                  for (int i = 0; i < browseGenreController.mangaGenreResults.length; i++)
                                    MangaSearchTile(manga: browseGenreController.mangaGenreResults[i], odd: i % 2 == 1)
                                ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
