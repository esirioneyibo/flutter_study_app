import 'package:flutter/material.dart';

class TipUtil {
  static showTip(BuildContext context, String content,
      {int time = 200, Position position = Position.Bottom}) {
    Widget widget;
    if (position == Position.Bottom) {
      widget = Text(content);
    } else if (position == Position.Center) {
      widget = Center(child: Text(content));
    } else if (position == Position.Top) {
      widget = Container(
        alignment: Alignment.topCenter,
        child: Text(content),
      );
    }

    Scaffold.of(context).showSnackBar(SnackBar(
      content: widget,
      duration: Duration(milliseconds: time),
    ));
  }
}

enum Position { Bottom, Center, Top }
