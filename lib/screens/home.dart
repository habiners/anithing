import 'package:anithing/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/controllers.dart';
import '../constants/genres.dart';
import '../widgets/scaffold_appbar.dart';
import '../widgets/scaffold_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScaffoldAppBar(
        appBar: AppBar(),
        title: 'AniThing',
        actions: [],
      ),
      drawer: ScaffoldDrawer(),
      body: Obx(
        () => Column(
          children: [
            // Search Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 10),
              child: TextField(
                controller: jikanController.searchQueryTextController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Input ${jikanController.mode} title",
                  icon: Icon(Icons.search),
                ),
                onTap: () {
                  print(jikanController.searchQueryTextController.text);
                },
              ),
            ),
            // Test search
            ElevatedButton(
                onPressed: () async {
                  await jikanController.searchQuery();
                  Get.toNamed(searchResultRoute);
                },
                child: Text("Search")),
            // Toggle
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Container(
                      height: 30,
                      width: 80,
                      child: Center(child: Text("Anime")),
                      decoration: BoxDecoration(
                        color: jikanController.mode.value == "Anime" ? Colors.blue : Colors.white,
                        border: Border(),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                    ),
                    onTap: () => jikanController.mode.value = "Anime",
                  ),
                  Container(width: 2, height: 30, color: Colors.white),
                  InkWell(
                    child: Container(
                      height: 30,
                      width: 80,
                      child: Center(child: Text("Manga")),
                      decoration: BoxDecoration(
                        color: jikanController.mode.value == "Manga" ? Colors.blue : Colors.white,
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
            Text("Select genres:"),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                child: Wrap(
                  children: jikanController.mode.value == "Anime"
                      ? AnimeGenres.values
                          .map(
                            (AnimeGenres genre) => FilterChip(
                              label: Text(genre.toString().split('.').last.replaceAll('_', ' ')),
                              selected: jikanController.selectedAnimeGenres[genre.index],
                              onSelected: (boolValue) {
                                jikanController.selectedAnimeGenres[genre.index] = boolValue;
                              },
                            ),
                          )
                          .toList()
                      : MangaGenres.values
                          .map(
                            (MangaGenres genre) => FilterChip(
                              label: Text(genre.toString().split('.').last.replaceAll('_', ' ')),
                              selected: jikanController.selectedMangaGenres[genre.index],
                              onSelected: (boolValue) {
                                jikanController.selectedMangaGenres[genre.index] = boolValue;
                              },
                            ),
                          )
                          .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
