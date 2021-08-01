import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/styles.dart';
import '../controllers/jikan_controller.dart';
import '../models/manga_search_result.dart';
import 'custom_text.dart';
import 'manga_details.dart';

class MangaSearchTile extends StatelessWidget {
  MangaSearchTile({Key? key, required this.manga, this.odd = false}) : super(key: key);

  final MangaSearchResult manga;
  final JikanController jikanController = Get.find();
  final bool odd;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        jikanController.id = manga.malId;
        Get.to(() => MangaDetails());
      },
      child: Container(
        height: 120,
        color: odd ? blackCoffeeColor : independenceColor,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(width: 80, height: 100, child: CachedNetworkImage(imageUrl: manga.imageUrl)),
            SizedBox(width: 4),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: manga.title, weight: FontWeight.bold),
                    CustomText(text: manga.synopsis, textAlign: TextAlign.left, maxLines: 3),
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
                            CustomText(text: "Volumes: ", weight: FontWeight.bold),
                            CustomText(text: "${manga.volumes.toString().padLeft(4)}"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
