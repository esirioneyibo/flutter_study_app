import 'package:flutter/material.dart';
import 'package:flutter_study_app/redux/reducer/locale_reducer.dart';
import 'package:flutter_study_app/redux/reducer/theme_data_reducer.dart';
import 'package:flutter_study_app/redux/ys_app_state.dart';
import 'package:redux/redux.dart';

enum LocaleEnum { cn, en, ja }

class CommonUtil {
  static themeColors() {
    return [
      Colors.brown,
      Colors.blue,
      Colors.teal,
      Colors.amber,
      Colors.blueGrey,
      Colors.deepOrange
    ];
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
  static changeTheme(Store<YsAppState> store, int index) {
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
  static changeLocale(Store<YsAppState> store, LocaleEnum target) {
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

  ///大陆手机号码11位数，匹配格式：前三位固定格式+后8位任意数
  /// 此方法中前三位格式有：
  /// 13+任意数 * 15+除4的任意数 * 18+除1和4的任意数 * 17+除9的任意数 * 147
  static bool isChinaPhone(String str) {
    return new RegExp('^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$').hasMatch(str);
  }

  /// 判断是不是邮箱
  static bool isEmail(String str){
    return RegExp('^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+\$').hasMatch(str);
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
