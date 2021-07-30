import 'package:anithing/controllers/jikan_controller.dart';

import 'package:anithing/models/manga.dart';
import 'package:anithing/services/jikan_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expandable_text/expandable_text.dart';

class MangaDetails extends StatefulWidget {
  final id;
  MangaDetails({Key? key, this.id}) : super(key: key);

  @override
  _MangaDetailsState createState() => _MangaDetailsState();
}

class _MangaDetailsState extends State<MangaDetails> {
  Future<Manga>? manga;
  final JikanController jikanController = Get.put(JikanController());
  @override
  void initState() {
    super.initState();
    manga = MangaService.manga(jikanController.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(400),
        child: AppBar(
          flexibleSpace: Expanded(
            child: FutureBuilder<Manga>(
              future: manga,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Container(
                        height: 462,
                        width: 400,
                        child: Image.network(
                          snapshot.data!.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<Manga>(
          future: manga,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Text(
                        snapshot.data!.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: ExpandableText(
                      snapshot.data!.synopsis,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.justify,
                      expandText: 'Show more',
                      maxLines: 8,
                      collapseText: 'Show less',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10, left: 10),
                    child: Text('Status: ' + snapshot.data!.status,
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10, left: 10),
                    child: Text(
                        'Number of Volumes: ' +
                            snapshot.data!.volumes.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return Center(child: const CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
