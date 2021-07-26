import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.size = 16,
    this.weight = FontWeight.normal,
  }) : super(key: key);

  final String text;
  final Color color;
  final double size;
  final FontWeight weight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size, fontWeight: weight),
    );
  }
}
