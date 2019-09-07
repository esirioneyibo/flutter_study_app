import 'package:flutter/material.dart';
import 'package:flutter_study_app/utils/navigator_util.dart';
import 'package:flutter_study_app/utils/random_util.dart';
import 'package:flutter_study_app/vo/choice_vo.dart';

import '../config.dart';

///选项卡
/// ICON+文字
class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice})
      : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
        fontSize: 15, color: Colors.black);

        final TextStyle iconStyle = TextStyle(
        fontSize: 15, color: RandomUtil.randomColor());
    return Card(
        color: Colors.white,
        child: Center(
            child: InkWell(
          onTap: () {
            NavigatorUtil.pushWithAnim(
                context, choice.screen, AnimType.Slider);
          },
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(choice.icon,
                    size: AppConfig.choiceIconSize,
                    color: iconStyle.color),
                Text(choice.title, style: textStyle),
              ]),
        )));
  }
}
