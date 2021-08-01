import 'package:anithing/constants/controllers.dart';
import 'package:anithing/controllers/jikan_controller.dart';
import 'package:anithing/widgets/animeep_tile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class AnimeDetailsScreen extends StatelessWidget {
  AnimeDetailsScreen({Key? key}) : super(key: key);
  final JikanController animeController = Get.find();
  final JikanController animeepController = Get.find();

  @override
  Widget build(BuildContext context) {
    animeepController.getAnimeEpisodes();
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(animeController.isLoading.value
            ? "Loading..."
            : animeController.anime!.title)),
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Obx(() {
        return animeController.isLoading.value
            ? Container(
                margin: EdgeInsets.only(top: 80.0),
                height: MediaQuery.of(context).size.width * .6,
                width: MediaQuery.of(context).size.width * .6,
                child: Center(child: CircularProgressIndicator()),
              )
            : ListView(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 8),
                          child: Container(
                              width: 200,
                              height: 300,
                              child: CachedNetworkImage(
                                imageUrl: animeController.anime!.imageUrl,
                              )),
                        )
                      ]),
                  // SizedBox(height: 3),
                  Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Score:',
                              style: TextStyle(
                                  color: Color(0xFF575366), fontSize: 16)),
                          SizedBox(width: 3),
                          Container(
                              child:
                                  Icon(Icons.star, color: Colors.orangeAccent)),
                          SizedBox(width: 3),
                          Text('${animeController.anime!.score}')
                        ]),
                  ),
                  SizedBox(height: 3),
                  Center(
                    child: Text('Synopsis',
                        style:
                            TextStyle(color: Color(0xFF575366), fontSize: 16)),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: ExpandableText(
                        '${animeController.anime!.synopsis}',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        textAlign: TextAlign.justify,
                        expandText: 'Show more',
                        maxLines: 5,
                        collapseText: 'Show less',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Rating:',
                            style: TextStyle(
                                color: Color(0xFF575366), fontSize: 16)),
                        SizedBox(width: 3),
                        Text(
                          animeController.anime!.rating,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Status:',
                            style: TextStyle(
                                color: Color(0xFF575366), fontSize: 16)),
                        SizedBox(width: 3),
                        Text(
                          animeController.anime!.status,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Episodes',
                        style:
                            TextStyle(color: Color(0xFF575366), fontSize: 16)),
                  ),
                  ...jikanController.animeep!
                      .map((animeEp) => AnimeEpisodesTile(animeEp: animeEp))
                      .toList(),
                ],
              );
      }),
    );
  }
}
