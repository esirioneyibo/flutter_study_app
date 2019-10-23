import 'package:flutter/material.dart';
import 'package:flutter_study_app/config/app_config.dart';

class ReturnBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bottom;

  ReturnBar(this.title, [this.bottom]);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        bottom: bottom,
        title: Text(title));
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(Constant.appBarHeight);
  }
}
