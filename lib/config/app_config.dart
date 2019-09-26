import 'package:flutter/material.dart';
import 'package:github/server.dart';

User currentUser;
bool theme;

class AppConfig {
  static bool debug = true;

  // 当前主题的localStorage key
  static String currentTheme = 'currentTheme';

  // 当前语言
  static String currentLocale = 'currentLocale';

  // appBar的高度
  static double appBarHeight = 48;

  // 闪屏停留时间
  static int splashTime = 2000;

  // 底部导航选中的颜色
  Color navigatorSelectedColor = Colors.pink;

  // 底部导航未选中的颜色
  Color navigatorUnSelectedColor = Colors.black54;

  static String avatar = 'assets/images/avatar.png';
  static String defaultAvatar = 'assets/images/default_avatar.png';
  static String splash = 'assets/images/splash.png';
  static String accountBg = 'assets/images/accountBg.jpg';
  static const TOKEN_KEY = "token";
  static const USERNAME = "ys_username";
  static const PASSWORD = "ys_password";
  static const USER_BASIC_CODE = "user-basic-code";
  static const USER_INFO = "user-info";
  static const LANGUAGE_SELECT = "language-select";
  static const LANGUAGE_SELECT_NAME = "language-select-name";
  static const REFRESH_LANGUAGE = "refreshLanguageApp";
  static const THEME_COLOR = "theme-color";
  static const LOCALE = "locale";
}
