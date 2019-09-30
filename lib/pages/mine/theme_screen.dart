import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/return_bar.dart';
import 'package:flutter_study_app/i18n/fs_localization.dart';
import 'package:flutter_study_app/utils/index.dart';

class ThemeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ThemeScreenState();
  }
}

class ThemeScreenState extends State<ThemeScreen> {
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
                title: Container(
                    child: Text('蓝色', style: TextStyle(color: Colors.blue))),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              Divider(),
              ListTile(
                trailing: Icon(Icons.chevron_right),
                title: Container(
                    child: Text('绿色', style: TextStyle(color: Colors.green))),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              Divider(),
              ListTile(
                trailing: Icon(Icons.chevron_right),
                title: Container(
                    child: Text(
                  '粉色',
                  style: TextStyle(color: Colors.pink),
                )),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                trailing: Icon(Icons.chevron_right),
                title: Container(
                    child: Text(
                  '黄色',
                  style: TextStyle(color: Colors.amber),
                )),
                onTap: () {
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
