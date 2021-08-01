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
        child: Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        color: Color(0xFF575366),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Episode ${animeEp.episode_id}:',
                        style:
                            TextStyle(color: Color(0xFF32292F), fontSize: 16)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${animeEp.aired}',
                        style:
                            TextStyle(color: Color(0xFF32292F), fontSize: 16)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 8),
              child: Text('${animeEp.title}',
                  style: TextStyle(color: Color(0xFFD1E3DD), fontSize: 20)),
            )
          ],
        ),
      ),
    ));
  }
}
