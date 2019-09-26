import 'package:flutter/material.dart';
import 'package:flutter_study_app/redux/middleware/epic_middleware.dart';
import 'package:flutter_study_app/redux/middleware/user_info_middleware.dart';
import 'package:flutter_study_app/redux/reducer/locale_reducer.dart';
import 'package:flutter_study_app/redux/reducer/theme_data_reducer.dart';
import 'package:flutter_study_app/redux/reducer/user_reducer.dart';
import 'package:github/server.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

final initializeStore = Store<YsAppState>(reducers,
    middleware: [
      EpicMiddleware<YsAppState>(UserInfoEpic()),
      UserInfoMiddleware(),
      thunkMiddleware
    ],
    initialState: YsAppState.initialState());

class YsAppState {
  // 当前用户
  User user;

  // 主题样式
  ThemeData themeData;

  // 语言
  Locale locale;

  // 当前平台默认语言
  Locale platformLocale;

  YsAppState({this.user, this.themeData, this.locale, this.platformLocale});

  factory YsAppState.initialState() {
    return YsAppState(
        user: null,
        themeData: ThemeData(primarySwatch: Colors.blue),
        locale: Locale('zh', 'CN'));
  }
}

// 这里是所有的操作
YsAppState reducers(YsAppState state, dynamic action) {
  return YsAppState(
      // 用户
      user: userReducer(state.user, action),
      // 主题
      themeData: themeDataReducer(state.themeData, action),
      // 语言切换
      locale: localeReducer(state.locale, action));
}

class AppStateViewModel {
  final YsAppState appState;
  final void Function() onclick;

  AppStateViewModel({this.appState, this.onclick});
}
