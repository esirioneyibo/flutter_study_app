import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  final BuildContext navigatorContext;
  final bottom;

  MyAppBar(this.navigatorContext, this.title, this.height, [this.bottom]);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(this.navigatorContext).openDrawer();
          },
        ),
        bottom: bottom,
        title: Text(title));
  }

  @override
  Size get preferredSize => new Size.fromHeight(height);
}
