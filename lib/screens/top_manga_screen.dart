import 'package:anithing/controllers/jikan_controller.dart';
import 'package:anithing/widgets/scaffold_appbar.dart';
import 'package:anithing/widgets/scaffold_drawer.dart';
import 'package:anithing/widgets/top_manga.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

class TopMangaListScreen extends StatelessWidget {
  TopMangaListScreen({Key? key}) : super(key: key);
  JikanController jikanController = Get.find();
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
                for (int i = 0; i < jikanController.topManga.length; i++)
                  TopManga(
                      topMangaModel: jikanController.topManga[i],
                      odd: i % 2 == 0)
              ]);
      }),
    );
  }
}
