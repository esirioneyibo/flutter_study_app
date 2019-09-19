import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RouterConfig {
// route
  String account = '/account';
  String index = '/index';
  String about = "/about";
  String settings = "/settings";
  String theme = "/theme";
  String language = '/language';
  String deviceInfo = 'deviceInfo';
}

class APIConfig {
  // issue list  get access_token  page: [int], // 当前页 per_page: [int] // 获取的条数
  String chatList =
      'https://api.github.com/repos/houko/flutter-study-app/issues';
}

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

  // twitter
  String twitterApiKey = '3398211287-Bhgnx4cEwXEaRL8S7Z3cWE4lmqWvzylqkYd5Sm7';
  String twitterApiSecret = '7ig505pCyMk2BxDuHASwoOyCJ39EBpAY5AXg206xlbJSN';

  // github
  String githubClientId = '4cd0c308ae1050806a2c';
  String githubClientSecret = '42b3c750a3585cb22e05768abc275e9e75ecfca8';

  get weChatAppId => "wxd930ea5d5a258f4f";
}

FirebaseUser currentUser;
bool theme;
