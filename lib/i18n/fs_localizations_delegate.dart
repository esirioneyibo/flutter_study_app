import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/i18n/fs_localization.dart';

/// 多语言代理
class FsLocalizationsDelegate extends LocalizationsDelegate<FsLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh', 'ja'].contains(locale.languageCode);
  }

  @override
  Future<FsLocalizations> load(Locale locale) {
    return SynchronousFuture<FsLocalizations>(FsLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<FsLocalizations> old) {
    return false;
  }

  static FsLocalizationsDelegate delegate = new FsLocalizationsDelegate();
}
