import 'package:anithing/constants/genres.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../constants/styles.dart';
import '../controllers/search_query_controller.dart';
import '../widgets/custom_text.dart';
import '../widgets/scaffold_appbar.dart';
import '../widgets/scaffold_drawer.dart';

class BrowseGenresScreen extends StatelessWidget {
  BrowseGenresScreen({Key? key}) : super(key: key);

  final SearchQueryController searchQueryController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createScaffoldAppBar(title: "Browse", actions: []),
      drawer: ScaffoldDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
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
                          color: searchQueryController.mode.value == "Anime" ? royalBlueLightColor : independenceColor,
                          border: Border(),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                      ),
                      onTap: () {
                        searchQueryController.mode.value = "Anime";
                        searchQueryController.selectedGenre.value = 0;
                      },
                    ),
                    Container(width: 1, height: 40, color: Colors.white),
                    InkWell(
                      child: Container(
                        height: 40,
                        width: 120,
                        child: Center(child: CustomText(text: "Manga")),
                        decoration: BoxDecoration(
                          color: searchQueryController.mode.value == "Manga" ? royalBlueLightColor : independenceColor,
                          border: Border(),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      onTap: () {
                        searchQueryController.mode.value = "Manga";
                        searchQueryController.selectedGenre.value = 0;
                      },
                    ),
                  ],
                ),
              ),
              DropdownButton<int>(
                onChanged: (int? newSelected) => searchQueryController.selectedGenre.value = newSelected ?? 0,
                style: TextStyle(color: mintCreamColor),
                value: searchQueryController.selectedGenre.value,
                dropdownColor: blackCoffeeColor,
                items: searchQueryController.mode.value == "Anime"
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
            ],
          ),
        ),
      ),
    );
  }
}
