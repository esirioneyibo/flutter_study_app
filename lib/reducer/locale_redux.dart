import 'package:flutter/material.dart';
import 'package:flutter_study_app/factory.dart';
import 'package:flutter_study_app/service/local_storage.dart';
import 'package:redux/redux.dart';

/// 语言切换redux


final localeReducer = combineReducers<Locale>([
  TypedReducer<Locale, RefreshLocaleAction>(_refresh),
]);

Locale _refresh(Locale locale, RefreshLocaleAction action) {
  locale = action.locale;
  LocalStorage.save(
      ConfigFactory.appConfig().currentLocale, locale.countryCode);
  return locale;
}

class RefreshLocaleAction {
  final Locale locale;

  RefreshLocaleAction(this.locale);
}
