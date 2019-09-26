import 'package:flutter/material.dart';
import 'package:flutter_study_app/config/app_config.dart';
import 'package:flutter_study_app/factory.dart';
import 'package:flutter_study_app/i18n/fs_localization.dart';

class ReturnBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bottom;

  ReturnBar(this.title, [this.bottom]);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          tooltip: FsLocalizations.of(context).currentLocale.returnButton,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        bottom: bottom,
        title: Text(title));
  }

  @override
  Size get preferredSize {
    AppConfig appConfig = ConfigFactory.appConfig();
    return Size.fromHeight(appConfig.appBarHeight);
  }
}
