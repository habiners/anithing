import 'package:anithing/controllers/jikan_controller.dart';
import 'package:anithing/models/manga.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MangaDetails extends StatelessWidget {
  MangaDetails({Key? key}) : super(key: key);
  JikanController jikanController = Get.put(JikanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return jikanController.isLoading.value
            ? Container(
                margin: EdgeInsets.only(top: 80.0),
                height: MediaQuery.of(context).size.width * .6,
                width: MediaQuery.of(context).size.width * .6,
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: 10,
                        ),
                        child: Text(
                          jikanController.manga!.title,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          print('--------------sa button');
                          print(jikanController.manga!.title);
                        },
                        child: Text('data'))
                  ],
                ),
              );
      }),
    );
  }
}
