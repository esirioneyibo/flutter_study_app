import 'package:flutter/material.dart';
import 'package:flutter_study_app/factory.dart';
import 'package:flutter_study_app/i10n/localization_intl.dart';

class DialogUtil {
  static void showAlertDialog(
      BuildContext context, String title, String content,
      {VoidCallback callback()}) {
    DialogStyle style = ConfigFactory.dialogStyle();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            RaisedButton(
              color: style.buttonColor,
              child: Text(
                MyLocalizations.of(context).close,
                style: TextStyle(
                    color: style.buttonFontColor,
                    fontSize: style.buttonFontSize),
              ),
              onPressed: () {
                if (callback != null) {
                  callback();
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void showConfirmDialog(
      BuildContext context, String title,
      [VoidCallback callback]) {
    DialogStyle style = ConfigFactory.dialogStyle();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          actions: <Widget>[
            RaisedButton(
              child: Text(
                MyLocalizations.of(context).ok,
                style: TextStyle(
                    color: style.buttonFontColor,
                    fontSize: style.buttonFontSize),
              ),
              onPressed: () {
                if (callback != null) {
                  callback();
                }
              },
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                MyLocalizations.of(context).cancel,
                style: TextStyle(
                    color: style.buttonFontColor,
                    fontSize: style.buttonFontSize),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class DialogStyle {
  // 关闭按钮的颜色
  Color buttonColor = Colors.blue;

  // 关闭按钮的文字颜色
  Color buttonFontColor = Colors.white;

  // 关闭按钮的文字大小
  double buttonFontSize = 15;
}
