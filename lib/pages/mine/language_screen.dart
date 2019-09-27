import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_study_app/components/return_bar.dart';
import 'package:flutter_study_app/i18n/fs_localization.dart';
import 'package:flutter_study_app/redux/ys_app_state.dart';
import 'package:flutter_study_app/utils/common_util.dart';
import 'package:flutter_study_app/utils/navigator_util.dart';

class LanguageScreen extends StatelessWidget {
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
            appBar:
                ReturnBar(FsLocalizations.getLocale(context).changeLanguage),
            body: Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                    trailing: Icon(Icons.chevron_right),
                    title: Container(child: Text('中文')),
                    onTap: () {
                      CommonUtil.changeLocale(initializeStore, LocaleEnum.cn);
                      Navigator.of(context).pop();
                    },
                  ),
                  Divider(),
                  ListTile(
                    trailing: Icon(Icons.chevron_right),
                    title: Container(child: Text('English')),
                    onTap: () {
                      CommonUtil.changeLocale(initializeStore, LocaleEnum.en);
                      Navigator.of(context).pop();
                    },
                  ),
                  Divider(),
                  ListTile(
                    trailing: Icon(Icons.chevron_right),
                    title: Container(child: Text('日本語')),
                    onTap: () {
                      CommonUtil.changeLocale(initializeStore, LocaleEnum.ja);
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
