import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/jikan_controller.dart';

class MangaDetails extends StatelessWidget {
  MangaDetails({Key? key}) : super(key: key);
  final JikanController jikanController = Get.find();

  @override
  Widget build(BuildContext context) {
    jikanController.getManga();
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(400),
        child: AppBar(
          flexibleSpace: Obx(
            () {
              return jikanController.isLoading.value
                  ? Container(
                      margin: EdgeInsets.only(top: 80.0),
                      height: MediaQuery.of(context).size.width * .6,
                      width: MediaQuery.of(context).size.width * .6,
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      height: 462,
                      width: 400,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: jikanController.manga!.imageUrl,
                      ),
                    );
            },
          ),
        ),
      ),
      body: Obx(() {
        return jikanController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: 10,
                        ),
                        child: Text(
                          jikanController.manga!.title,
                          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: ExpandableText(
                          jikanController.manga!.synopsis,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.justify,
                          expandText: 'Show more',
                          maxLines: 8,
                          collapseText: 'Show less',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10, left: 10),
                      child: Text('Status: ' + jikanController.manga!.status, style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10, left: 10),
                      child: Text('Number of Volumes: ' + jikanController.manga!.volumes.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ],
                ),
              );
      }),
    );
  }
}
