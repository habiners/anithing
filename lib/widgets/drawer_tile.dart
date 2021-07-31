import 'package:anithing/constants/controllers.dart';
import 'package:anithing/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_text.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    Key? key,
    required this.iconData,
    required this.title,
    required this.destinationRoute,
    this.arguments,
    this.active = false,
  }) : super(key: key);
  final IconData iconData;
  final String title;
  final String destinationRoute;
  final dynamic arguments;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: active ? blackCoffeeColor : royalBlueLightColor,
      leading: Icon(iconData, color: mintCreamColor),
      title: CustomText(
        text: title,
        color: mintCreamColor,
        size: 20.0,
        weight: FontWeight.bold,
      ),
      onTap: () {
        jikanController.activeRoute.value = destinationRoute;
        Get.offNamed(destinationRoute, arguments: arguments);
      },
    );
  }
}
