import 'package:anithing/controllers/jikan_controller.dart';
import 'package:anithing/router/routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/manga_search_result.dart';
import 'custom_text.dart';

class MangaSearchTile extends StatelessWidget {
  MangaSearchTile({Key? key, required this.manga}) : super(key: key);

  final MangaSearchResult manga;
  final JikanController jikanController = Get.put(JikanController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: Add link to Manga Page
        jikanController.getManga(manga.malId);
        Get.toNamed(mangaDetailsRoute);
      },
      child: Container(
        height: 120,
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 80,
                height: 100,
                child: CachedNetworkImage(imageUrl: manga.imageUrl)),
            SizedBox(width: 4),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: manga.title, weight: FontWeight.bold),
                  CustomText(
                      text: manga.synopsis,
                      textAlign: TextAlign.left,
                      maxLines: 3),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomText(text: "Score: ", weight: FontWeight.bold),
                          CustomText(text: "${manga.score}"),
                        ],
                      ),
                      Row(
                        children: [
                          CustomText(
                              text: "Chapters: ", weight: FontWeight.bold),
                          CustomText(
                              text: "${manga.chapters.toString().padLeft(4)}"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 4),
      ),
    );
  }
}
