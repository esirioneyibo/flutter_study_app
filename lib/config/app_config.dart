import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseUser currentUser;
bool theme;

class AppConfig {
  // 当前主题的localStorage key
  String currentTheme = 'currentTheme';

  // 当前语言
  String currentLocale = 'currentLocale';

  // appBar的高度
  double appBarHeight = 48;

  // 闪屏停留时间
  int splashTime = 2000;

  // 底部导航选中的颜色
  Color navigatorSelectedColor = Colors.pink;

  // 底部导航未选中的颜色
  Color navigatorUnSelectedColor = Colors.black54;

  String avatar = 'assets/images/avatar.png';
  String defaultAvatar = 'assets/images/default_avatar.png';
  String splash = 'assets/images/splash.png';
  String accountBg = 'assets/images/accountBg.jpg';
}
