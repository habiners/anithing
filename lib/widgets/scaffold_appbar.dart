import 'package:flutter/material.dart';

import '../constants/styles.dart';
import 'custom_text.dart';

AppBar createScaffoldAppBar({required String title, required List<Widget> actions}) => AppBar(
      title: title == 'AniThing'
          ? RichText(
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
            )
          : CustomText(text: title, family: 'Montserrat', weight: FontWeight.bold, size: 24),
      actions: actions,
      backgroundColor: royalBlueLightColor,
      shadowColor: mintCreamColor,
    );
