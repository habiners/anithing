import 'package:anithing/controllers/jikan_controller.dart';
import 'package:anithing/screens/anime_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/styles.dart';
import '../models/anime_search_result.dart';
import '../screens/home_screen.dart';
import 'custom_text.dart';

class AnimeSearchTile extends StatelessWidget {
  AnimeSearchTile({Key? key, required this.anime, this.odd = false})
      : super(key: key);
  final AnimeSearchResult anime;
  final JikanController animeController = Get.find();
  final bool odd;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        animeController.id = anime.malId;
        Get.to(() => AnimeDetailsScreen());
      },
      child: Container(
        height: 120,
        color: odd ? blackCoffeeColor : independenceColor,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 80,
                height: 100,
                child: CachedNetworkImage(imageUrl: anime.imageUrl)),
            SizedBox(width: 4),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: anime.title, weight: FontWeight.bold),
                    CustomText(
                        text: anime.synopsis,
                        textAlign: TextAlign.left,
                        maxLines: 3),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomText(
                                text: "Score: ", weight: FontWeight.bold),
                            CustomText(text: "${anime.score}"),
                          ],
                        ),
                        Row(
                          children: [
                            CustomText(
                                text: "Episodes: ", weight: FontWeight.bold),
                            CustomText(
                                text:
                                    "${anime.episodes.toString().padLeft(4)}"),
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
