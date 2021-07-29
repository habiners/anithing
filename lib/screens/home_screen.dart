import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/genres.dart';
import '../constants/styles.dart';
import '../controllers/search_query_controller.dart';
import 'search_results_screen.dart';
import '../widgets/scaffold_appbar.dart';
import '../widgets/scaffold_drawer.dart';
import '../widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final SearchQueryController jikanController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createScaffoldAppBar(
        title: 'AniThing',
        actions: [],
      ),
      drawer: ScaffoldDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
        child: Obx(
          () => Column(
            children: [
              // Search Button
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: TextField(
                  controller: jikanController.searchQueryTextController,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  style: TextStyle(color: mintCreamColor),
                  decoration: InputDecoration(
                    labelText: "Search ${jikanController.mode}:",
                    labelStyle: TextStyle(color: mintCreamColor),
                    hintText: "Input ${jikanController.mode} title",
                    hintStyle: TextStyle(color: independenceColor),
                    icon: Icon(Icons.search, color: mintCreamColor),
                    suffix: IconButton(
                      onPressed: () => jikanController.searchQueryTextController.clear(),
                      icon: Icon(Icons.clear, color: mintCreamColor),
                    ),
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: mintCreamColor)),
                    focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: royalBlueLightColor)),
                  ),
                  onSubmitted: (String str) {
                    if (jikanController.searchQueryTextController.text.length < 3)
                      Get.snackbar("Warning!", "Search query must contain at least 3 letters!");
                    else
                      Get.to(SearchResultsScreen());
                  },
                ),
              ),
              // Test search
              // ElevatedButton(
              //     onPressed: () {
              //       if (jikanController.searchQueryTextController.text.length < 3)
              //         Get.snackbar("Warning!", "Search query must contain at least 3 letters!");
              //       else
              //         Get.to(SearchResultsScreen());
              //     },
              //     child: Text("Search")),
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
                          color: jikanController.mode.value == "Anime" ? royalBlueLightColor : independenceColor,
                          border: Border(),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                      ),
                      onTap: () => jikanController.mode.value = "Anime",
                    ),
                    Container(width: 1, height: 40, color: Colors.white),
                    InkWell(
                      child: Container(
                        height: 40,
                        width: 120,
                        child: Center(child: CustomText(text: "Manga")),
                        decoration: BoxDecoration(
                          color: jikanController.mode.value == "Manga" ? royalBlueLightColor : independenceColor,
                          border: Border(),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      onTap: () => jikanController.mode.value = "Manga",
                    ),
                  ],
                ),
              ),
              //Genres
              Container(
                padding: EdgeInsets.only(bottom: 10),
                alignment: Alignment.centerLeft,
                child: CustomText(text: "Select genre(s):", size: 18),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    children: jikanController.mode.value == "Anime"
                        ? AnimeGenres.values
                            .map(
                              (AnimeGenres genre) => Container(
                                child: FilterChip(
                                  label: CustomText(text: genre.toString().split('.').last.replaceAll('_', ' ')),
                                  selected: jikanController.selectedAnimeGenres[genre.index],
                                  onSelected: (boolValue) {
                                    jikanController.selectedAnimeGenres[genre.index] = boolValue;
                                  },
                                  checkmarkColor: mintCreamColor,
                                  backgroundColor: independenceColor,
                                  selectedColor: royalBlueLightColor,
                                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                  side: BorderSide(color: blackCoffeeColor, width: 1),
                                ),
                              ),
                            )
                            .toList()
                        : MangaGenres.values
                            .map(
                              (MangaGenres genre) => Container(
                                child: FilterChip(
                                  label: CustomText(text: genre.toString().split('.').last.replaceAll('_', ' ')),
                                  selected: jikanController.selectedMangaGenres[genre.index],
                                  onSelected: (boolValue) {
                                    jikanController.selectedMangaGenres[genre.index] = boolValue;
                                  },
                                  checkmarkColor: mintCreamColor,
                                  backgroundColor: independenceColor,
                                  selectedColor: royalBlueLightColor,
                                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                  side: BorderSide(color: blackCoffeeColor, width: 1),
                                ),
                              ),
                            )
                            .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
