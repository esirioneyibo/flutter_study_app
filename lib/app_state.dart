import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/reducer/locale_redux.dart';
import 'package:flutter_study_app/reducer/theme_data_redux.dart';
import 'package:flutter_study_app/reducer/user_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

final store = Store<AppState>(reducers,
    middleware: [thunkMiddleware],
    initialState: AppState.initialState());

class AppState {
  // 当前用户
  FirebaseUser user;

  // 主题样式
  ThemeData themeData;

  // 语言
  Locale locale;

  // 当前平台默认语言
  Locale platformLocale;

  AppState(
      {this.user,
      this.themeData,
      this.locale,
      this.platformLocale});

  factory AppState.initialState() {
    return AppState(
        user: null,
        themeData: ThemeData(primarySwatch: Colors.blue),
        locale: Locale('zh', 'CN'));
  }
}

// 这里是所有的操作
AppState reducers(AppState state, dynamic action) {
  return AppState(
      // 用户
      user: userReducer(state.user, action),
      // 主题
      themeData: themeDataReducer(state.themeData, action),
      // 语言切换
      locale: localeReducer(state.locale, action));
}

class AppStateViewModel {
  final AppState appState;
  final void Function() onclick;

  AppStateViewModel({this.appState, this.onclick});
}
