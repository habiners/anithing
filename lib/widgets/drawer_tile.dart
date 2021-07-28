import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    Key? key,
    required this.iconData,
    required this.title,
    required this.destinationRoute,
    this.arguments,
  }) : super(key: key);
  final IconData iconData;
  final String title;
  final String destinationRoute;
  final dynamic arguments;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData, color: Colors.black),
      title: Text(
        title,
        style: TextStyle(
          // fontFamily: "RobotoCondensed",
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      // selected: true,
      onTap: () => Get.offNamed(destinationRoute, arguments: arguments),
    );
  }
}
