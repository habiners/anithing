import 'package:anithing/constants/styles.dart';
import 'package:anithing/controllers/jikan_controller.dart';
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
      appBar: AppBar(
        backgroundColor: royalBlueLightColor,
        title: Text(
          'Top Manga',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Get.to(
            HomeScreen(),
          ),
        ),
      ),
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
