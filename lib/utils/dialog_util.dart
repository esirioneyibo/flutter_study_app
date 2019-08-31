import 'package:flutter/material.dart';

class DialogUtil {
  static void showAlertDialog(
      BuildContext context, String title, String content,
      [VoidCallback callback]) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            RaisedButton(
              color: Colors.blue,
              child: Text(
                "关闭",
                style: TextStyle(color: Colors.white, fontSize: 15),
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

  static void showConfirmDialog(BuildContext context, String title,
      [VoidCallback callback]) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          actions: <Widget>[
            RaisedButton(
              color: Colors.blue,
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
              color: Colors.grey,
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
