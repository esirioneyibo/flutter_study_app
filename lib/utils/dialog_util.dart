import 'package:flutter/material.dart';
import 'package:flutter_study_app/factory.dart';
import 'package:flutter_study_app/i10n/localization_intl.dart';

class DialogUtil {
  static bool _isShowing = false;

  ///展示
  static void showProgress(BuildContext context,
      {Widget child = const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.red),
      )}) {
    if (!_isShowing) {
      _isShowing = true;
      Navigator.push(
        context,
        _PopRoute(
          child: _Progress(
            child: child,
          ),
        ),
      );
    }
  }

  ///隐藏
  static void dismiss(BuildContext context) {
    if (_isShowing) {
      Navigator.of(context).pop();
      _isShowing = false;
    }
  }

  static void showAlertDialog(BuildContext context, String title, String content, {VoidCallback callback()}) {
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
                style: TextStyle(color: style.buttonFontColor, fontSize: style.buttonFontSize),
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

  static void showConfirmDialog(BuildContext context, String title, [VoidCallback callback]) {
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
                style: TextStyle(color: style.buttonFontColor, fontSize: style.buttonFontSize),
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
                style: TextStyle(color: style.buttonFontColor, fontSize: style.buttonFontSize),
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

///Widget
class _Progress extends StatelessWidget {
  final Widget child;

  _Progress({
    Key key,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Center(
          child: child,
        ));
  }
}

class _PopRoute extends PopupRoute {
  final Duration _duration = Duration(milliseconds: 300);
  Widget child;

  _PopRoute({@required this.child});

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;
}

class DialogStyle {
  // 关闭按钮的颜色
  Color buttonColor = Colors.blue;

  // 关闭按钮的文字颜色
  Color buttonFontColor = Colors.white;

  // 关闭按钮的文字大小
  double buttonFontSize = 15;
}
