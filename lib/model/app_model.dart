import 'package:flutter/material.dart';
import 'package:flutter_github_api/flutter_github_api.dart';
import 'package:flutter_study_app/config/app_config.dart';
import 'package:flutter_study_app/service/http_service.dart';
import 'package:flutter_study_app/service/local_storage.dart';
import 'package:flutter_study_app/utils/common_util.dart';
import 'package:flutter_study_app/vo/video_vo.dart';
import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
  /// 当前用户
  User user;

  // 当前主题
  Color theme = CommonUtil.themeColors()[0];

  // 当前语言
  Locale locale = CommonUtil.transLocale(localeEnum: LocaleEnum.cn);

  // 帖子列表
  List<Issue> posts;

  // videos
  List<VideoVo> videos;

  AppModel() {
    // theme
    LocalStorage.get(Constant.currentTheme).then((data) {
      changeTheme(int.parse(data));
    }).catchError((error) {});

    // locale
    LocalStorage.get(Constant.currentLocale).then((data) {
      changeLocale(localeStr: data);
    }).catchError((error) {});
  }

  /// 修改locale
  changeLocale({LocaleEnum localeEnum, String localeStr}) {
    this.locale =
        CommonUtil.transLocale(localeEnum: localeEnum, localeStr: localeStr);
    if (localeEnum != null) {
      LocalStorage.save(Constant.currentLocale, localeEnum.index.toString());
    } else {
      LocalStorage.save(Constant.currentLocale, localeStr);
    }
    notifyListeners();
  }

  /// update newest post list
  updatePosts(BuildContext context) async {
    List<Issue> issues = await HttpService.getChatList(context);
    if (issues == null) {
      this.posts = [];
    } else {
      this.posts = issues;
    }
    notifyListeners();
    return true;
  }

  /// update videos
  updateVideos(BuildContext context) async {
    await Future.delayed(Duration(seconds: 1), () {
      this.videos = mockVideos;
      notifyListeners();
    });
    return true;
  }

  // 修改theme
  changeTheme(int color) {
    List<Color> listColor = CommonUtil.themeColors();
    this.theme = listColor[color];
    LocalStorage.save(Constant.currentTheme, color.toString());
    notifyListeners();
  }

  /// 是否登录
  isLogin() {
    return user != null;
  }

  afterLogin(User user) {
    this.user = user;
    notifyListeners();
  }

  afterLogout() {
    this.user = null;
    notifyListeners();
  }
}
