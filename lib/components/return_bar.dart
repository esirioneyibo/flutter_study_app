import 'package:flutter/material.dart';
import 'package:flutter_study_app/config.dart';

class ReturnBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bottom;

  ReturnBar(this.title, [this.bottom]);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          tooltip: '返回',
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        bottom: bottom,
        title: Text(title));
  }

  @override
  Size get preferredSize => new Size.fromHeight(AppConfig.appBarHeight);
}
