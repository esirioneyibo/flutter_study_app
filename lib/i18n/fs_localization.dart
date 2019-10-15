import 'package:flutter/material.dart';
import 'package:flutter_study_app/i18n/translate/fs_string_en.dart';
import 'package:flutter_study_app/i18n/translate/fs_string_jp.dart';
import 'package:flutter_study_app/i18n/translate/fs_string_zh.dart';

/// 自定义多语言实现
class FsLocalizations {
  final Locale locale;

  FsLocalizations(this.locale);

  static Map<String, FsStringZH> _localizationMap = {
    'en': FsStringEN(),
    'zh': FsStringZH(),
    'ja': FsStringJP()
  };


  /// 获得支持语言的keys
    static get supportedLocales{
    return _localizationMap.keys;
  }

  /// 获取当前语言
  static FsStringZH getLocale(BuildContext context) {
    return Localizations.of(context, FsLocalizations)._currentLocale;
  }

  FsStringZH get _currentLocale {
    if (_localizationMap.containsKey(locale.languageCode)) {
      return _localizationMap[locale.languageCode];
    }
    return _localizationMap['cn'];
  }

}
