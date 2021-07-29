import 'package:flutter/material.dart';

import '../constants/controllers.dart';
import '../constants/styles.dart';
import '../router/routes.dart';
import 'drawer_tile.dart';

class ScaffoldDrawer extends StatelessWidget {
  const ScaffoldDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: royalBlueLightColor),
      child: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 42,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(text: "Ani", style: TextStyle(color: mintCreamColor)),
                      TextSpan(text: "Thing", style: TextStyle(color: blackCoffeeColor)),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                children: [
                  DrawerTile(
                    title: "Home",
                    iconData: Icons.home_outlined,
                    destinationRoute: homeRoute,
                    active: jikanController.activeRoute.value == homeRoute,
                  ),
                  DrawerTile(
                    title: "Browse Top Anime",
                    iconData: Icons.tv,
                    destinationRoute: topAnimeRoute,
                    active: jikanController.activeRoute.value == topAnimeRoute,
                  ),
                  DrawerTile(
                    title: "Browse Top Manga",
                    iconData: Icons.book_outlined,
                    destinationRoute: topMangaRoute,
                    active: jikanController.activeRoute.value == topMangaRoute,
                  ),
                  DrawerTile(
                    title: "Browse by Genre",
                    iconData: Icons.category_outlined,
                    destinationRoute: browseGenreRoute,
                    active: jikanController.activeRoute.value == browseGenreRoute,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
