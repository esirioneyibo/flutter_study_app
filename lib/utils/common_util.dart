import 'package:flutter/material.dart';
import 'package:flutter_study_app/app_state.dart';
import 'package:flutter_study_app/reducer/locale_redux.dart';
import 'package:flutter_study_app/reducer/theme_data_redux.dart';
import 'package:redux/redux.dart';

enum LocaleEnum { cn, en, ja }

class CommonUtil {
  static themeColors() {
    return [Colors.brown, Colors.blue, Colors.teal, Colors.amber, Colors.blueGrey, Colors.deepOrange];
  }

  static format(String content, {String param, List<String> params}) {
    // 单个参数
    if (param != null) {
      return content.replaceAll('{0}', param);

      // 多个参数
    } else if (params != null) {
      params.asMap().forEach((index, param) {
        content = content.replaceAll('{$index}', param);
      });
      return content;
    }
  }

  // 切换语言
  static changeTheme(Store<AppState> store, int index) {
    var themeData = store.state.themeData;
    themeData = ThemeData().copyWith(primaryColor: themeColors()[index]);
    store.dispatch(RefreshThemeDataAction(themeData));
  }

  static transLocale(LocaleEnum localeEnum) {
    switch (localeEnum.index) {
      case 0:
        return Locale('zh', 'CN');
      case 1:
        return Locale('en', 'US');
      case 2:
        return Locale('ja', 'JP');
    }
    return Locale('zh', 'CN');
  }

  // 切换语言
  static changeLocale(Store<AppState> store, LocaleEnum target) {
    var locale = store.state.platformLocale;
    switch (target.index) {
      case 0:
        locale = Locale('zh', 'CN');
        break;
      case 1:
        locale = Locale('en', 'US');
        break;
      case 2:
        locale = Locale('ja', 'JP');
        break;
    }
    store.dispatch(RefreshLocaleAction(locale));
  }

  static List<Color> getThemeListColor() {
    return [
      Colors.brown,
      Colors.blue,
      Colors.teal,
      Colors.amber,
      Colors.blueGrey,
      Colors.deepOrange,
    ];
  }
}
