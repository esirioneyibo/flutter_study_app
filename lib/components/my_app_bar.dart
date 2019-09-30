import 'package:flutter/material.dart';
import 'package:flutter_study_app/config/app_config.dart';
import 'package:flutter_study_app/pages/mine/about_screen.dart';
import 'package:flutter_study_app/utils/index.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final tabBar;

  MyAppBar({this.title, this.tabBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        bottom: tabBar,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.assignment_late),
            onPressed: () {
              NavigatorUtil.pushWithAnim(
                  context, AboutAppScreen(), AnimType.Slider);
            },
          )
        ],
        title: Text(title == null ? '' : title));
  }

  @override
  Size get preferredSize => Size.fromHeight(AppConfig.appBarHeight);
}
