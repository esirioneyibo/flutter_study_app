import 'package:flutter/material.dart';
import 'package:flutter_github_api/flutter_github_api.dart';
import 'package:flutter_study_app/utils/common_util.dart';
import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
  /// 当前用户
  User user;

  // 当前主题
  Color theme = CommonUtil.themeColors()[0];

  // 当前语言
  Locale locale = CommonUtil.transLocale(LocaleEnum.cn);

  changeLocale(LocaleEnum localeEnum) {
    this.locale = CommonUtil.transLocale(localeEnum);
    notifyListeners();
  }

  changeTheme(int color) {
    List<Color> listColor = CommonUtil.themeColors();
    this.theme = listColor[color];
    notifyListeners();
  }

  afterLogin(User user) {
    this.user = user;
  }

  afterLogout() {
    this.user = null;
  }
}
