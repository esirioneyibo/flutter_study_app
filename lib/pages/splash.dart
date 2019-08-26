import 'package:flutter/material.dart';
import '../navigator.dart';

///
/// 导航器是一个有状态的组件
class SplashScreen extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  /// 动画控制器
  AnimationController _animationController;

  /// 动画
  Animation _animation;

  @override
  Widget build(BuildContext context) {
    return new FadeTransition(
        opacity: _animation,
        child: Image.asset(
          'images/splash.png',
          scale: 2.0,
          fit: BoxFit.cover,
        ));
  }

  @override
  void initState() {
    super.initState();

    // 初始化动画
    _animationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 3000));
    _animation = new Tween(begin: 0.0, end: 1.0).animate(_animationController);

    var listener = (status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(
            new MaterialPageRoute(builder: (context) => new BottomNavigator()),
            (router) => router == null);
      }
    };
    _animation.addStatusListener(listener);
    // 播放动画
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
}
