import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/models/choice.dart';
import 'package:flutter_study_app/utils/random_util.dart';

import '../config.dart';

///选项卡
/// ICON+文字
class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle =
        new TextStyle(fontSize: 15, color: RandomUtil.randomColor());
    return Card(
        color: Colors.white,
        child: Center(
            child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => choice.screen));
          },
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(choice.icon, size: ChoiceIconSize, color: textStyle.color),
                Text(choice.title, style: textStyle),
              ]),
        )));
  }
}
