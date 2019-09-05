import 'package:flutter/material.dart';
import 'package:flutter_study_app/i10n/localization_intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomItem {
  final index;
  final IconData icon;
  final String title;

  BottomItem(this.index, this.icon, this.title);
}

getBottomItems(BuildContext context) {
  return [
    BottomItem(
      0,
      Icons.home,
      MyLocalizations.of(context).index,
    ),
    BottomItem(
      1,
      Icons.whatshot,
      MyLocalizations.of(context).study,
    ),
    BottomItem(
      2,
      FontAwesomeIcons.rocketchat,
      MyLocalizations.of(context).chat,
    ),
    BottomItem(
      3,
      FontAwesomeIcons.tools,
      MyLocalizations.of(context).tool,
    ),
  ];
}
