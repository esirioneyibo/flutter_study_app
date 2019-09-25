import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/return_bar.dart';
import 'package:flutter_study_app/i18n/localization_intl.dart';
import 'package:flutter_study_app/utils/navigator_util.dart';

class GithubRankScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        NavigatorUtil.back(context, details);
      },
      child: Scaffold(
        appBar: ReturnBar(MyLocalizations.of(context).returnButton),
        body: Center(child: Text('github榜单')),
      ),
    );
  }
}
