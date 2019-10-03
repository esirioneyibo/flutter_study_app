import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_study_app/app.dart';
import 'package:flutter_study_app/config/router_config.dart';
import 'package:flutter_study_app/i18n/fs_localizations_delegate.dart';
import 'package:flutter_study_app/model/app_model.dart';
import 'package:flutter_study_app/pages/mine/about_screen.dart';
import 'package:flutter_study_app/pages/mine/device_info_screen.dart';
import 'package:flutter_study_app/pages/mine/language_screen.dart';
import 'package:flutter_study_app/pages/mine/login_screen.dart';
import 'package:flutter_study_app/pages/mine/settings_screen.dart';
import 'package:flutter_study_app/pages/mine/theme_screen.dart';
import 'package:flutter_study_app/pages/splash_screen.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => {
      runZoned(() {
        runApp(MainApp());
        PaintingBinding.instance.imageCache.maximumSize = 100;
      }, onError: (Object obj, StackTrace stack) {
        print(obj);
        print(stack);
      })
    };

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(
      model: AppModel(),
      child: ScopedModelDescendant<AppModel>(
        builder: (context, child, model) {
          return MaterialApp(
            routes: {
              RouterConfig.index: (context) => FsApp(),
              RouterConfig.account: (context) => LoginScreen(),
              RouterConfig.about: (context) => AboutAppScreen(),
              RouterConfig.settings: (context) => SettingScreen(),
              RouterConfig.language: (context) => LanguageScreen(),
              RouterConfig.theme: (context) => ThemeScreen(),
              RouterConfig.deviceInfo: (context) => DeviceInfoScreen(),
            },
            localizationsDelegates: [
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              FsLocalizationsDelegate.delegate
            ],
            locale: model.locale,
            supportedLocales: [
              const Locale('zh', 'CN'), // 中文简体
              const Locale('en', 'US'), // 美国英语
              const Locale('ja', 'JP'), // 日本日语
            ],
            theme: ThemeData(primaryColor: model.theme),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
