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
