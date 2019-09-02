import 'package:flutter/material.dart';
import 'package:flutter_study_app/i10n/messages_all.dart';
import 'package:intl/intl.dart';

class MyLocalizations {
  static Future<MyLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localName = Intl.canonicalizedLocale(name);
    return initializeMessages(localName).then((value) {
      Intl.defaultLocale = localName;
      return MyLocalizations();
    });
  }

  static MyLocalizations of(BuildContext context) {
    return Localizations.of(context, MyLocalizations);
  }

  // ----------------------------------底部导航--------------------------------------------
  String get index {
    return Intl.message('index',
        name: 'index', desc: '底部导航首页', locale: Intl.defaultLocale);
  }

  String get study {
    return Intl.message('study',
        name: 'study', desc: '底部导航资源', locale: Intl.defaultLocale);
  }

  String get chat {
    return Intl.message('chat',
        name: 'chat', desc: '底部导航圈子', locale: Intl.defaultLocale);
  }

  String get tool {
    return Intl.message('tool',
        name: 'tool', desc: '底部导航工具', locale: Intl.defaultLocale);
  }

// ----------------------------------顶部导航--------------------------------------------
  String get plugin {
    return Intl.message('plugin',
        name: 'plugin', desc: '顶部导航 插件', locale: Intl.defaultLocale);
  }

  String get dart {
    return Intl.message('dart',
        name: 'dart', desc: '顶部导航 dart', locale: Intl.defaultLocale);
  }

  String get blog {
    return Intl.message('blog',
        name: 'blog', desc: '顶部导航 博客', locale: Intl.defaultLocale);
  }

  String get video {
    return Intl.message('video',
        name: 'video', desc: '顶部导航 视频', locale: Intl.defaultLocale);
  }

  String get community {
    return Intl.message('community',
        name: 'community', desc: '顶部导航 社区', locale: Intl.defaultLocale);
  }

  String get openSource {
    return Intl.message('openSource',
        name: 'openSource', desc: '顶部导航 开源项目', locale: Intl.defaultLocale);
  }

  String get game {
    return Intl.message('game',
        name: 'game', desc: '顶部导航 游戏', locale: Intl.defaultLocale);
  }

  String get gameEngine {
    return Intl.message('gameEngine',
        name: 'gameEngine', desc: '顶部导航 游戏引擎', locale: Intl.defaultLocale);
  }

  String get other {
    return Intl.message('other',
        name: 'other', desc: '顶部导航 其他', locale: Intl.defaultLocale);
  }

// ----------------------------------Drawer--------------------------------------------
  String get changeLanguage {
    return Intl.message('changeLanguage',
        name: 'changeLanguage', desc: '语言切换', locale: Intl.defaultLocale);
  }

  String get settings {
    return Intl.message('settings',
        name: 'settings', desc: '设置中心', locale: Intl.defaultLocale);
  }

  String get aboutSoftware {
    return Intl.message('aboutSoftware',
        name: 'aboutSoftware', desc: '关于软件', locale: Intl.defaultLocale);
  }

  String get exitLogin {
    return Intl.message('exitLogin',
        name: 'exitLogin', desc: '退出登录', locale: Intl.defaultLocale);
  }

  String get clickLogin {
    return Intl.message('clickLogin',
        name: 'clickLogin', desc: '点击登录', locale: Intl.defaultLocale);
  }

  String get confirmExitLogin {
    return Intl.message('confirmExitLogin',
        name: 'confirmExitLogin', desc: '确定退出登陆吗', locale: Intl.defaultLocale);
  }

  String get logout {
    return Intl.message('logout',
        name: 'logout', desc: '您己退出登录', locale: Intl.defaultLocale);
  }

// --------------------------------------通有-------------------------------------------------
  String get developing {
    return Intl.message('developing',
        name: 'developing', desc: '开发中', locale: Intl.defaultLocale);
  }

  String get beHope {
    return Intl.message('beHope',
        name: 'beHope', desc: '敬请期待', locale: Intl.defaultLocale);
  }

  String get returnButton {
    return Intl.message('returnButton',
        name: 'returnButton', desc: '返回', locale: Intl.defaultLocale);
  }
// --------------------------------------语言转换方法-------------------------------------------------
}

//代理文件
class MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh', 'ja'].contains(locale.languageCode);
  }

  @override
  Future<MyLocalizations> load(Locale locale) {
    return MyLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<MyLocalizations> old) {
    return false;
  }
}
