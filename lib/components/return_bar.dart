import 'package:flutter/material.dart';
import 'package:flutter_study_app/config.dart';
import 'package:flutter_study_app/i10n/localization_intl.dart';

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
          tooltip: MyLocalizations.of(context).returnButton,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        bottom: bottom,
        title: Text(title));
  }

  @override
  Size get preferredSize => Size.fromHeight(AppConfig.appBarHeight);
}
