import 'package:anithing/controllers/jikan_controller.dart';
import 'package:anithing/models/anime.dart';
import 'package:anithing/services/jikan_service.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class AnimeDetailsScreen extends StatelessWidget {
  AnimeDetailsScreen({Key? key}) : super(key: key);
  final JikanController animeController = Get.find();

  @override
  Widget build(BuildContext context) {
    animeController.getAnime();
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
            : SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: animeController.anime!.imageUrl,
                          ))
                        ]),
                    SizedBox(height: 3),
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Score:',
                              style: TextStyle(
                                  color: Color(0xFF575366), fontSize: 16),
                            ),
                            SizedBox(width: 3),
                            Container(
                                child: Icon(Icons.star,
                                    color: Colors.orangeAccent)),
                            SizedBox(width: 3),
                            Text('${animeController.anime!.score}')
                          ]),
                    ),
                    Center(
                      child: Text(
                        'Synopsis',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: ExpandableText(
                          '${animeController.anime!.synopsis}',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.justify,
                          expandText: 'Show more',
                          maxLines: 8,
                          collapseText: 'Show less',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Rating:',
                            style: TextStyle(
                                color: Color(0xFF575366), fontSize: 16),
                          ),
                          SizedBox(width: 3),
                          Text(
                            animeController.anime!.rating,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      }),
    );
  }
}
