import 'package:anithing/router/routes.dart';
import 'package:anithing/widgets/drawer_tile.dart';
import 'package:flutter/material.dart';

class ScaffoldDrawer extends StatelessWidget {
  const ScaffoldDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            // TODO: Design
            child: Text("Header Design"),
          ),
          DrawerTile(title: "Home", iconData: Icons.home_outlined, destinationRoute: homeRoute),
          DrawerTile(title: "Browse Top Anime", iconData: Icons.tv, destinationRoute: topAnimeRoute),
          DrawerTile(title: "Browse Top Manga", iconData: Icons.book_outlined, destinationRoute: topMangaRoute),
          DrawerTile(title: "Browse by Genre", iconData: Icons.category_outlined, destinationRoute: browseGenreRoute),
          // DrawerTile(title: "Random Anime/Manga", iconData: Icons.home, destinationRoute: homeRoute),
        ],
      ),
    );
  }
}
