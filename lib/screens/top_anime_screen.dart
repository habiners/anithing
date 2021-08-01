import 'package:anithing/controllers/jikan_controller.dart';
import 'package:anithing/widgets/scaffold_appbar.dart';
import 'package:anithing/widgets/scaffold_drawer.dart';
import 'package:anithing/widgets/top_anime.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopAnimeListScreen extends StatelessWidget {
  TopAnimeListScreen({Key? key}) : super(key: key);
  JikanController jikanController = Get.find();
  @override
  Widget build(BuildContext context) {
    jikanController.topAnimeController();
    return Scaffold(
      appBar: createScaffoldAppBar(
        title: 'Top Anime',
        actions: [],
      ),
      drawer: ScaffoldDrawer(),
      body: Obx(() {
        return jikanController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(children: [
                for (int i = 0; i < jikanController.topAnime.length; i++)
                  TopAnime(
                      topAnimeModel: jikanController.topAnime[i],
                      odd: i % 2 == 0)
              ]);
      }),
    );
  }
}
