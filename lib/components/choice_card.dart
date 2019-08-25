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
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(choice.title),
              duration: Duration(milliseconds: 200),
            ));
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
