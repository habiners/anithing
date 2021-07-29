import 'package:flutter/material.dart';

import '../constants/styles.dart';
import 'custom_text.dart';

// class ScaffoldAppBar extends StatelessWidget implements PreferredSizeWidget {
//   ScaffoldAppBar({
//     Key? key,
//     this.title = "",
//     required this.appBar,
//     required this.actions,
//   }) : super(key: key);

//   final String title;
//   final AppBar appBar;
//   final List<Widget> actions;

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: CustomText(text: title, color: mintCreamColor),
//       actions: actions,
//       backgroundColor: royalBlueLightColor,
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
// }

AppBar createScaffoldAppBar({required String title, required List<Widget> actions}) => AppBar(
      // title: CustomText(
      //   text: title,
      //   color: mintCreamColor,
      //   // weight: FontWeight.bold,
      //   size: 24,
      //   fontFamily: 'Montserrat',
      // ),
      title: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(text: "Ani", style: TextStyle(color: mintCreamColor)),
            TextSpan(text: "Thing", style: TextStyle(color: blackCoffeeColor)),
          ],
        ),
      ),
      actions: actions,
      backgroundColor: royalBlueLightColor,
    );
