import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.fontFamily = 'Roboto',
    this.size = 16,
    this.weight = FontWeight.normal,
    this.textAlign = TextAlign.left,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines = 1,
  }) : super(key: key);

  final String text;
  final Color color;
  final String fontFamily;
  final double size;
  final FontWeight weight;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize: size,
        fontWeight: weight,
      ),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
