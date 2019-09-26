import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_study_app/components/return_bar.dart';
import 'package:flutter_study_app/i18n/fs_localization.dart';
import 'package:flutter_study_app/redux/ys_app_state.dart';
import 'package:flutter_study_app/utils/common_util.dart';
import 'package:flutter_study_app/utils/navigator_util.dart';

class ThemeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ThemeScreenState();
  }
}

class ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<YsAppState, Locale>(
      converter: (store) => store.state.locale,
      builder: (context, locale) {
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
                        child:
                            Text('蓝色', style: TextStyle(color: Colors.blue))),
                    onTap: () {
                      CommonUtil.changeTheme(initializeStore, 0);
                      Navigator.of(context).pop();
                    },
                  ),
                  Divider(),
                  ListTile(
                    trailing: Icon(Icons.chevron_right),
                    title: Container(
                        child:
                            Text('绿色', style: TextStyle(color: Colors.green))),
                    onTap: () {
                      CommonUtil.changeTheme(initializeStore, 1);
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
                      CommonUtil.changeTheme(initializeStore, 2);
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
                      CommonUtil.changeTheme(initializeStore, 3);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
