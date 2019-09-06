import 'package:flutter/material.dart';
import 'package:flutter_study_app/i10n/messages_all.dart';
import 'package:intl/intl.dart';

class MyLocalizations {
  static Future<MyLocalizations> load(Locale locale) {
    final String name = locale.countryCode.isEmpty
        ? locale.languageCode
        : locale.toString();
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
        name: 'index',
        desc: '底部导航首页',
        locale: Intl.defaultLocale);
  }

  String get study {
    return Intl.message('study',
        name: 'study',
        desc: '底部导航资源',
        locale: Intl.defaultLocale);
  }

  String get chat {
    return Intl.message('chat',
        name: 'chat',
        desc: '底部导航圈子',
        locale: Intl.defaultLocale);
  }

  String get tool {
    return Intl.message('tool',
        name: 'tool',
        desc: '底部导航工具',
        locale: Intl.defaultLocale);
  }

// ----------------------------------顶部导航--------------------------------------------
  String get plugin {
    return Intl.message('plugin',
        name: 'plugin',
        desc: '顶部导航 插件',
        locale: Intl.defaultLocale);
  }

  String get dart {
    return Intl.message('dart',
        name: 'dart',
        desc: '顶部导航 dart',
        locale: Intl.defaultLocale);
  }

  String get blog {
    return Intl.message('blog',
        name: 'blog',
        desc: '顶部导航 博客',
        locale: Intl.defaultLocale);
  }

  String get video {
    return Intl.message('video',
        name: 'video',
        desc: '顶部导航 视频',
        locale: Intl.defaultLocale);
  }

  String get community {
    return Intl.message('community',
        name: 'community',
        desc: '顶部导航 社区',
        locale: Intl.defaultLocale);
  }

  String get openSource {
    return Intl.message('openSource',
        name: 'openSource',
        desc: '顶部导航 开源项目',
        locale: Intl.defaultLocale);
  }

  String get game {
    return Intl.message('game',
        name: 'game',
        desc: '顶部导航 游戏',
        locale: Intl.defaultLocale);
  }

  String get gameEngine {
    return Intl.message('gameEngine',
        name: 'gameEngine',
        desc: '顶部导航 游戏引擎',
        locale: Intl.defaultLocale);
  }

  String get other {
    return Intl.message('other',
        name: 'other',
        desc: '顶部导航 其他',
        locale: Intl.defaultLocale);
  }

// ----------------------------------Drawer--------------------------------------------
  String get changeLanguage {
    return Intl.message('changeLanguage',
        name: 'changeLanguage',
        desc: '语言切换',
        locale: Intl.defaultLocale);
  }

  String get settings {
    return Intl.message('settings',
        name: 'settings',
        desc: '设置中心',
        locale: Intl.defaultLocale);
  }

  String get aboutSoftware {
    return Intl.message('aboutSoftware',
        name: 'aboutSoftware',
        desc: '关于软件',
        locale: Intl.defaultLocale);
  }

  String get exitLogin {
    return Intl.message('exitLogin',
        name: 'exitLogin',
        desc: '退出登录',
        locale: Intl.defaultLocale);
  }

  String get clickLogin {
    return Intl.message('clickLogin',
        name: 'clickLogin',
        desc: '点击登录',
        locale: Intl.defaultLocale);
  }

  String get confirmExitLogin {
    return Intl.message('confirmExitLogin',
        name: 'confirmExitLogin',
        desc: '确定退出登陆吗',
        locale: Intl.defaultLocale);
  }

  String get logout {
    return Intl.message('logout',
        name: 'logout',
        desc: '您己退出登录',
        locale: Intl.defaultLocale);
  }

  // --------------------------------------工具分类-------------------------------------------------
  String get studyTools {
    return Intl.message('studyTools',
        name: 'studyTools',
        desc: '学习类',
        locale: Intl.defaultLocale);
  }

  String get lifeTools {
    return Intl.message('lifeTools',
        name: 'lifeTools',
        desc: '生活类',
        locale: Intl.defaultLocale);
  }

  String get developTools {
    return Intl.message('developTools',
        name: 'developTools',
        desc: '开发类',
        locale: Intl.defaultLocale);
  }

  String get mediaTools {
    return Intl.message('mediaTools',
        name: 'mediaTools',
        desc: '媒体类',
        locale: Intl.defaultLocale);
  }

// --------------------------------------通有-------------------------------------------------
  String get developing {
    return Intl.message('developing',
        name: 'developing',
        desc: '功能开发中',
        locale: Intl.defaultLocale);
  }

  String get beHope {
    return Intl.message('beHope',
        name: 'beHope',
        desc: '敬请期待',
        locale: Intl.defaultLocale);
  }

  String get returnButton {
    return Intl.message('returnButton',
        name: 'returnButton',
        desc: '返回',
        locale: Intl.defaultLocale);
  }

// --------------------------------------账号相关-------------------------------------------------
  String get login {
    return Intl.message('login',
        name: 'login',
        desc: '登录',
        locale: Intl.defaultLocale);
  }

  String get register {
    return Intl.message('register',
        name: 'register',
        desc: '注册',
        locale: Intl.defaultLocale);
  }

  String get email {
    return Intl.message('email',
        name: 'email',
        desc: '邮箱',
        locale: Intl.defaultLocale);
  }

  String get password {
    return Intl.message('password',
        name: 'password',
        desc: '密码',
        locale: Intl.defaultLocale);
  }

  String get loginError {
    return Intl.message('loginError',
        name: 'loginError',
        desc: '登录失败',
        locale: Intl.defaultLocale);
  }

  String get validateEmailTitle {
    return Intl.message('validateEmailTitle',
        name: 'validateEmailTitle',
        desc: '请验证您的邮箱',
        locale: Intl.defaultLocale);
  }

  String get validateEmailContent {
    return Intl.message('validateEmailContent',
        name: 'validateEmailContent',
        desc: '请到您的邮箱查看并激活账号',
        locale: Intl.defaultLocale);
  }

  String get emailIllegal {
    return Intl.message('emailIllegal',
        name: 'emailIllegal',
        desc: '邮箱地址格式错误',
        locale: Intl.defaultLocale);
  }

  String get emailNotFound {
    return Intl.message('emailNotFound',
        name: 'emailNotFound',
        desc: '找不到账号，请先注册',
        locale: Intl.defaultLocale);
  }

  String get passwordError {
    return Intl.message('passwordError',
        name: 'passwordError',
        desc: '密码错误，请检查后再试',
        locale: Intl.defaultLocale);
  }

  String get unknownError {
    return Intl.message('unknownError',
        name: 'unknownError',
        desc: '未知错误',
        locale: Intl.defaultLocale);
  }

  String get createAccount {
    return Intl.message('createAccount',
        name: 'createAccount',
        desc: '创建一个账号',
        locale: Intl.defaultLocale);
  }

  String get moveToLogin {
    return Intl.message('moveToLogin',
        name: 'moveToLogin',
        desc: '己有账号?去登录',
        locale: Intl.defaultLocale);
  }

  String get moveToRegister {
    return Intl.message('moveToRegister',
        name: 'moveToRegister',
        desc: '注册账号',
        locale: Intl.defaultLocale);
  }

  String get deviceInfo {
    return Intl.message('deviceInfo',
        name: 'deviceInfo',
        desc: '设备信息',
        locale: Intl.defaultLocale);
  }

  String get appName => Intl.message('appName',
      name: 'appName',
      desc: 'app name',
      locale: Intl.defaultLocale);

  get newChat => Intl.message('newChat',
      name: 'newChat',
      desc: '发布帖子',
      locale: Intl.defaultLocale);

  String get chatContent => Intl.message('chatContent',
      name: 'chatContent',
      desc: '帖子内容',
      locale: Intl.defaultLocale);

// --------------------------------------语言转换方法-------------------------------------------------
}

//代理文件
class MyLocalizationsDelegate
    extends LocalizationsDelegate<MyLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh', 'ja'].contains(locale.languageCode);
  }

  @override
  Future<MyLocalizations> load(Locale locale) {
    return MyLocalizations.load(locale);
  }

  @override
  bool shouldReload(
      LocalizationsDelegate<MyLocalizations> old) {
    return false;
  }
}
