import 'package:flutter/material.dart';
import 'package:flutter_study_app/i18n/fs_localization.dart';

class NoData extends StatelessWidget {
  NoData({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Center(child: Text(FsLocalizations.getLocale(context).noData)));
  }
}
