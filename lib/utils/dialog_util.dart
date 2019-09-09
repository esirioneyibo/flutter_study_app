import 'package:flutter/material.dart';
import 'package:flutter_study_app/app_state.dart';
import 'package:scoped_model/scoped_model.dart';

class DialogUtil {
  static void showAlertDialog(
      BuildContext context, String title, String content,
      {VoidCallback callback({Model model}), Model model}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            RaisedButton(
              child: Text(
                "关闭",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              onPressed: () {
                if (callback != null && model != null) {
                  callback(model: model);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void showConfirmDialog(BuildContext context, String title,
      [VoidCallback callback]) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          actions: <Widget>[
            RaisedButton(
              child: Text(
                "确定",
                style: TextStyle(color: Colors.white, fontSize: 15),
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
                "取消",
                style: TextStyle(color: Colors.white, fontSize: 15),
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
