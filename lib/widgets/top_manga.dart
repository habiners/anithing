import 'package:anithing/controllers/jikan_controller.dart';
import 'package:anithing/models/manga.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import 'custom_text.dart';
import 'manga_details.dart';

class TopManga extends StatelessWidget {
  TopManga({Key? key, this.odd = false, required this.topMangaModel})
      : super(key: key);
  final JikanController jikanController = Get.find();
  final bool odd;
  final TopMangaModel topMangaModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        jikanController.id = topMangaModel.malId;
        jikanController.onInit();
        Get.to(() => MangaDetails());
      },
      child: Container(
        height: 120,
        color: Colors.black54,
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
                  child: Image.network(
                    topMangaModel.imageUrl,
                    fit: BoxFit.cover,
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
                        text: topMangaModel.title, weight: FontWeight.bold),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomText(
                                text:
                                    "Score: " + topMangaModel.score.toString(),
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
