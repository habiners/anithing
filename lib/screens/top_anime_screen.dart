import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/jikan_controller.dart';
import '../widgets/scaffold_appbar.dart';
import '../widgets/scaffold_drawer.dart';
import '../widgets/top_anime_tile.dart';

class TopAnimeListScreen extends StatelessWidget {
  TopAnimeListScreen({Key? key}) : super(key: key);
  final JikanController jikanController = Get.find();
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
                for (int i = 0; i < jikanController.topAnime.length; i++) TopAnimeTile(topAnimeModel: jikanController.topAnime[i], odd: i % 2 == 0)
              ]);
      }),
    );
  }
}
