import 'package:anithing/controllers/jikan_controller.dart';
import 'package:anithing/models/anime.dart';
import 'package:anithing/services/jikan_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class AnimeDetails extends StatelessWidget {
  AnimeDetails({Key? key}) : super(key: key);
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
                child: CircularProgressIndicator(),
              )
            : Column(
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
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child:
                                Icon(Icons.star, color: Colors.orangeAccent)),
                        Text('${animeController.anime!.score}')
                      ]),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Synopsis',
                        style: Theme.of(context).textTheme.headline6,
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('${animeController.anime!.synopsis}'),
                  ),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Genre',
                        style: Theme.of(context).textTheme.headline6,
                      )),
                ],
              );
      }),
    );
  }
}
