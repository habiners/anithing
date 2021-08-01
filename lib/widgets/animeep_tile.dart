import 'package:anithing/controllers/jikan_controller.dart';
import 'package:anithing/models/anime_episodes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimeEpisodesTile extends StatelessWidget {
  AnimeEpisodesTile({Key? key, required this.animeEp, this.odd = false})
      : super(key: key);
  final AnimeEpisodes animeEp;
  final bool odd;
  final JikanController animeEpController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text('Episodes')],
    ));
  }
}
