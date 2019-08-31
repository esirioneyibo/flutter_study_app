import 'package:flutter/material.dart';

class DialogUtil {
  static void showAlertDialog(
      BuildContext context, String title, String content,
      [VoidCallback callback]) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title),
          content: new Text(content),
          actions: <Widget>[
            new RaisedButton(
              color: Colors.blue,
              child: new Text(
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
}
