import 'package:flutter/material.dart';
import 'package:flutter_github_api/flutter_github_api.dart';
import 'package:flutter_study_app/config/app_config.dart';
import 'package:flutter_study_app/service/local_storage.dart';
import 'package:flutter_study_app/utils/common_util.dart';
import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
  /// 当前用户
  User _user;

  // 当前主题
  Color _theme = CommonUtil.themeColors()[0];

  // 当前语言
  Locale _locale = CommonUtil.transLocale(localeEnum: LocaleEnum.cn);

  AppModel() {
    // theme
    LocalStorage.get(Constant.currentTheme).then((data) {
      changeTheme(int.parse(data));
    }).catchError((error){
    });

    // locale
    LocalStorage.get(Constant.currentLocale).then((data) {
      changeLocale(localeStr: data);
    }).catchError((error){
    });
  }

  /// 修改locale
  changeLocale({LocaleEnum localeEnum, String localeStr}) {
    this._locale =
        CommonUtil.transLocale(localeEnum: localeEnum, localeStr: localeStr);
    if (localeEnum != null) {
      LocalStorage.save(Constant.currentLocale, localeEnum.index.toString());
    } else {
      LocalStorage.save(Constant.currentLocale, localeStr);
    }

    notifyListeners();
  }

  // 修改theme
  changeTheme(int color) {
    List<Color> listColor = CommonUtil.themeColors();
    this._theme = listColor[color];
    // 保存当前主题到本地
    LocalStorage.save(Constant.currentTheme, color.toString());
    notifyListeners();
  }

  /// 是否登录
  isLogin() {
    return user != null;
  }

  afterLogin(User user) {
    this._user = user;
    notifyListeners();
  }

  afterLogout() {
    this._user = null;
    notifyListeners();
  }

  User get user {
    return this._user;
  }

  Locale get locale {
    return this._locale;
  }

  Color get theme {
    return this._theme;
  }
}
