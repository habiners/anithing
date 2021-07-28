import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/controllers.dart';
import '../constants/genres.dart';
import '../widgets/scaffold_appbar.dart';
import '../widgets/scaffold_drawer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
                controller: jikanController.searchQueryController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Input ${jikanController.mode} title",
                  icon: Icon(Icons.search),
                ),
                onTap: () {
                  print(jikanController.searchQueryController.text);
                },
              ),
            ),
            // Toggle
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.10,
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
                  Container(width: 2, height: 40, color: Colors.black),
                  InkWell(
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.10,
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
                child: ListView(
                  children: (jikanController.mode.value == "Anime" ? AnimeGenres.values : MangaGenres.values)
                      .map(
                        (genre) => ListTile(
                          title: Text(genre.toString().split('.').last.replaceAll('_', ' ')),
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
