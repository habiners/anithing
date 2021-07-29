import 'package:anithing/constants/styles.dart';
import 'package:anithing/router/routes.dart';
import 'package:anithing/widgets/drawer_tile.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

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
                // child: CustomText(
                //   text: "AniThing",
                //   size: 42,
                //   color: mintCreamColor,
                //   fontFamily: 'Montserrat',
                //   weight: FontWeight.bold,
                // ),
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
                  DrawerTile(title: "Home", iconData: Icons.home_outlined, destinationRoute: homeRoute, active: true),
                  DrawerTile(title: "Browse Top Anime", iconData: Icons.tv, destinationRoute: topAnimeRoute),
                  DrawerTile(title: "Browse Top Manga", iconData: Icons.book_outlined, destinationRoute: topMangaRoute),
                  DrawerTile(title: "Browse by Genre", iconData: Icons.category_outlined, destinationRoute: browseGenreRoute),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
