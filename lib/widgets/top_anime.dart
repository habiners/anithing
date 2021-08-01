import 'package:anithing/controllers/jikan_controller.dart';
import 'package:anithing/models/manga.dart';
import 'package:anithing/screens/home_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_text.dart';
import 'manga_details.dart';

class TopAnime extends StatelessWidget {
  TopAnime({Key? key, this.odd = false, required this.topAnimeModel})
      : super(key: key);
  final JikanController jikanController = Get.find();
  final bool odd;
  final TopAnimeModel topAnimeModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 120,
        color: odd ? Colors.grey[900] : Colors.blueGrey[600],
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 80,
                height: 100,
                child: Container(
                  height: 462,
                  width: 400,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: topAnimeModel.imageUrl,
                  ),
                )),
            SizedBox(width: 4),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: topAnimeModel.title, weight: FontWeight.bold),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomText(
                                text:
                                    "Score: " + topAnimeModel.score.toString(),
                                weight: FontWeight.bold),
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
