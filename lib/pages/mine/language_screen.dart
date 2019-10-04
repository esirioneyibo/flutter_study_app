import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/return_bar.dart';
import 'package:flutter_study_app/i18n/fs_localization.dart';
import 'package:flutter_study_app/model/app_model.dart';
import 'package:flutter_study_app/utils/index.dart';
import 'package:scoped_model/scoped_model.dart';

class LanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
      builder: (context, child, model) {
        return GestureDetector(
          onHorizontalDragEnd: (DragEndDetails details) {
            NavigatorUtil.back(context, details);
          },
          child: Scaffold(
            appBar:
                ReturnBar(FsLocalizations.getLocale(context).changeLanguage),
            body: Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                    trailing: Icon(Icons.chevron_right),
                    title: Container(child: Text('中文')),
                    onTap: () {
                      model.changeLocale(localeEnum: LocaleEnum.cn);
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                  ),
                  Divider(),
                  ListTile(
                    trailing: Icon(Icons.chevron_right),
                    title: Container(child: Text('English')),
                    onTap: () {
                      model.changeLocale(localeEnum: LocaleEnum.en);
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                  ),
                  Divider(),
                  ListTile(
                    trailing: Icon(Icons.chevron_right),
                    title: Container(child: Text('日本語')),
                    onTap: () {
                      model.changeLocale(localeEnum: LocaleEnum.ja);
                      Navigator.of(context).pop();
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
