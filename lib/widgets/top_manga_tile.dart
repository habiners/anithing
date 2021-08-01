import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/jikan_controller.dart';
import '../models/manga.dart';
import 'custom_text.dart';
import 'manga_details.dart';

class TopMangaTile extends StatelessWidget {
  TopMangaTile({Key? key, this.odd = false, required this.topMangaModel}) : super(key: key);
  final JikanController jikanController = Get.find();
  final bool odd;
  final TopMangaModel topMangaModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        jikanController.id = topMangaModel.malId;
        jikanController.isLoading.value = true;
        Get.to(() => MangaDetails());
      },
      child: Expanded(
        child: Card(
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
                        imageUrl: topMangaModel.imageUrl,
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
                        CustomText(text: topMangaModel.title, weight: FontWeight.bold),
                        SizedBox(height: 4),
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              CustomText(text: "Score: " + topMangaModel.score.toString(), weight: FontWeight.bold),
                            ]),
                            Row(
                              children: [
                                CustomText(text: "Volumes: " + topMangaModel.volumes.toString(), weight: FontWeight.bold),
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
        ),
      ),
    );
  }
}
