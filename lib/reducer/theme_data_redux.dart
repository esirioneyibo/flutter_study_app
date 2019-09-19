import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

final themeDataReducer = combineReducers<ThemeData>([
  TypedReducer<ThemeData, RefreshThemeDataAction>(_refresh)
]);

///定义处理 Action 行为的方法，返回新的 State
ThemeData _refresh(
    ThemeData themeData, RefreshThemeDataAction action) {
  themeData = action.themeData;
  return themeData;
}

///定义一个 Action 类
///将该 Action 在 Reducer 中与处理该Action的方法绑定
class RefreshThemeDataAction {
  final ThemeData themeData;

  RefreshThemeDataAction(this.themeData);
}
