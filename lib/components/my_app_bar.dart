import 'package:flutter/material.dart';
import 'package:flutter_study_app/config.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final BuildContext navigatorContext;
  final topbar;

  MyAppBar(this.navigatorContext, this.title, [this.topbar]);

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
        bottom: topbar,
        title: Text(title));
  }

  @override
  Size get preferredSize => new Size.fromHeight(AppConfig.appBarHeight);
}
