import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/i18n/fs_localization.dart';

class NoData extends StatefulWidget {
  NoData({Key key, this.tips}) : super(key: key);

  final String tips;

  @override
  _NoDataState createState() => _NoDataState(tips);
}

class _NoDataState extends State<NoData> {
  String tips;

  _NoDataState(this.tips);

  @override
  Widget build(BuildContext context) {
    if (tips == null) {
      tips = FsLocalizations.getLocale(context).noData;
    }
    return Material(
        color: Colors.transparent,
        child: Container(
            padding: EdgeInsets.all(10), child: Center(child: Text(tips))));
  }
}
