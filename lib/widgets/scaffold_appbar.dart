import 'package:flutter/material.dart';

class ScaffoldAppBar extends StatelessWidget implements PreferredSizeWidget {
  ScaffoldAppBar({
    Key? key,
    this.title = "",
    required this.appBar,
    required this.actions,
  }) : super(key: key);

  final String title;
  final AppBar appBar;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
