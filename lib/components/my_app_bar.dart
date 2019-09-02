import 'package:flutter/material.dart';
import 'package:flutter_study_app/config.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final topbar;

  MyAppBar({this.title, this.topbar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
//        backgroundColor: Theme.of(context).appBarTheme.color,
        bottom: topbar,
        title: Text(title == null ? '' : title));
  }

  @override
  Size get preferredSize => Size.fromHeight(AppConfig.appBarHeight);
}
