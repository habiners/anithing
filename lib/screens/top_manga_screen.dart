import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/jikan_controller.dart';
import '../widgets/scaffold_appbar.dart';
import '../widgets/scaffold_drawer.dart';
import '../widgets/top_manga_tile.dart';

class TopMangaListScreen extends StatelessWidget {
  TopMangaListScreen({Key? key}) : super(key: key);

  final JikanController jikanController = Get.find();
  @override
  Widget build(BuildContext context) {
    jikanController.topMangaController();
    return Scaffold(
      appBar: createScaffoldAppBar(
        title: 'Top Manga',
        actions: [],
      ),
      drawer: ScaffoldDrawer(),
      body: Obx(() {
        return jikanController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(children: [
                for (int i = 0; i < jikanController.topManga.length; i++) TopMangaTile(topMangaModel: jikanController.topManga[i], odd: i % 2 == 0)
              ]);
      }),
    );
  }
}
