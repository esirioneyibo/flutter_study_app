import 'package:flutter/material.dart';
import 'package:flutter_study_app/i18n/translate/fs_string_base.dart';
import 'package:flutter_study_app/i18n/translate/fs_string_en.dart';
import 'package:flutter_study_app/i18n/translate/fs_string_jp.dart';
import 'package:flutter_study_app/i18n/translate/fs_string_zh.dart';

/// 自定义多语言实现
class FsLocalizations {
  final Locale locale;

  FsLocalizations(this.locale);

  static Map<String, FsStringBase> _localizationMap = {
    'en': FsStringEN(),
    'zh': FsStringZH(),
    'ja': FsStringJP()
  };

  FsStringBase get currentLocale {
    if (_localizationMap.containsKey(locale.languageCode)) {
      return _localizationMap[locale.languageCode];
    }
    return _localizationMap['cn'];
  }

  static FsLocalizations _of(BuildContext context) {
    return Localizations.of(context, FsLocalizations);
  }

  /// 获取当前语言
  static FsStringBase getLocale(BuildContext context) {
    return _of(context).currentLocale;
  }
}
