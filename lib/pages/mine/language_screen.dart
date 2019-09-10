import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/return_bar.dart';
import 'package:flutter_study_app/i10n/localization_intl.dart';
import 'package:flutter_study_app/utils/navigator_util.dart';

class LanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Locale myLocale =
        Localizations.localeOf(context);
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        NavigatorUtil.back(context, details);
      },
      child: Scaffold(
        appBar: ReturnBar(
            MyLocalizations.of(context)
                .changeLanguage),
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
                title:
                    Container(child: Text('English')),
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
