import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/return_bar.dart';
import 'package:flutter_study_app/i18n/fs_localization.dart';
import 'package:flutter_study_app/utils/index.dart';

class LanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        NavigatorUtil.back(context, details);
      },
      child: Scaffold(
        appBar: ReturnBar(FsLocalizations.getLocale(context).changeLanguage),
        body: Container(
          child: Column(
            children: <Widget>[
              ListTile(
                trailing: Icon(Icons.chevron_right),
                title: Container(child: Text('中文')),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
              Divider(),
              ListTile(
                trailing: Icon(Icons.chevron_right),
                title: Container(child: Text('English')),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
              Divider(),
              ListTile(
                trailing: Icon(Icons.chevron_right),
                title: Container(child: Text('日本語')),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
