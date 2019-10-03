import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/config/router_config.dart';

enum AnimType {
  Slider, // 进入从右往左滑入，退出从左往右滑出
  Fade, // 淡入淡出效果
  Scale, //进入从小到大打开，退出从大小到消失
  EnterExit, // 还没搞懂
  Size, // 进入从屏中间展开，退出从上下收缩
  ScaleRotation // 一边旋转一边缩放
}

class NavigatorUtil {
  static void push(BuildContext context, route) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => route));
  }

  static void back(BuildContext context, DragEndDetails details) {
    var value = (details.velocity.pixelsPerSecond.dx.toStringAsFixed(1));
    print(value);
    if (double.parse(value) > 500) {
      Navigator.of(context).pop();
    }
  }

  static void pushWithAnim(BuildContext context, route, AnimType animType,
      {secondPage}) {
    PageRouteBuilder builder;
    if (animType == AnimType.Size) {
      builder = SizeRoute(page: route);
    } else if (animType == AnimType.Fade) {
      builder = FadeRoute(page: route);
    } else if (animType == AnimType.Scale) {
      builder = ScaleRoute(page: route);
    } else if (animType == AnimType.ScaleRotation) {
      builder = ScaleRotateRoute(page: route);
    } else if (animType == AnimType.EnterExit) {
      builder = EnterExitRoute(exitPage: secondPage, enterPage: route);
    } else if (animType == AnimType.Slider) {
      builder = SliderRoute(page: route);
    } else {
      push(context, route);
    }

    Navigator.push(context, builder);
  }

  ///替换
  static pushReplacementNamed(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  ///切换无参数页面
  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  ///主页
  static goHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, RouterConfig.index);
  }
}

class SliderRoute extends PageRouteBuilder {
  final Widget page;

  SliderRoute({this.page})
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                page,
            transitionDuration: Duration(milliseconds: 300),
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) =>
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: const Offset(0, 0),
                  ).animate(animation),
                  child: child,
                ));
}

class ScaleRoute extends PageRouteBuilder {
  final Widget page;

  ScaleRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          ),
        );
}

class RotationRoute extends PageRouteBuilder {
  final Widget page;

  RotationRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              RotationTransition(
            turns: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.linear,
              ),
            ),
            child: child,
          ),
        );
}

class SizeRoute extends PageRouteBuilder {
  final Widget page;

  SizeRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Align(
            child: SizeTransition(
              sizeFactor: animation,
              child: child,
            ),
          ),
        );
}

class FadeRoute extends PageRouteBuilder {
  final Widget page;

  FadeRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}

class EnterExitRoute extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;

  EnterExitRoute({this.exitPage, this.enterPage})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              enterPage,
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Stack(
            children: <Widget>[
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 0.0),
                  end: const Offset(-1.0, 0.0),
                ).animate(animation),
                child: exitPage,
              ),
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: enterPage,
              )
            ],
          ),
        );
}

class ScaleRotateRoute extends PageRouteBuilder {
  final Widget page;

  ScaleRotateRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: RotationTransition(
              turns: Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.linear,
                ),
              ),
              child: child,
            ),
          ),
        );
}
