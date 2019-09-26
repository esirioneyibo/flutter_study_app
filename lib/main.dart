import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_study_app/app.dart';
import 'package:flutter_study_app/config/router_config.dart';
import 'package:flutter_study_app/factory.dart';
import 'package:flutter_study_app/i18n/fs_localizations_delegate.dart';
import 'package:flutter_study_app/pages/mine/about_screen.dart';
import 'package:flutter_study_app/pages/mine/login_screen.dart';
import 'package:flutter_study_app/pages/mine/device_info_screen.dart';
import 'package:flutter_study_app/pages/mine/language_screen.dart';
import 'package:flutter_study_app/pages/mine/settings_screen.dart';
import 'package:flutter_study_app/pages/mine/theme_screen.dart';
import 'package:flutter_study_app/pages/splash_screen.dart';
import 'package:flutter_study_app/redux/ys_app_state.dart';

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
    RouterConfig router = ConfigFactory.router();
    return StoreProvider<YsAppState>(
        store: initializeStore,
        child: MaterialApp(
          routes: {
            router.index: (context) => FsApp(),
            router.account: (context) => LoginScreen(),
            router.about: (context) => AboutAppScreen(),
            router.settings: (context) => SettingScreen(),
            router.language: (context) => LanguageScreen(),
            router.theme: (context) => ThemeScreen(),
            router.deviceInfo: (context) => DeviceInfoScreen(),
          },
          locale: initializeStore.state.locale,
          localizationsDelegates: [
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            FsLocalizationsDelegate.delegate
          ],
          supportedLocales: [
            const Locale('zh', 'CN'), // 中文简体
            const Locale('en', 'US'), // 美国英语
            const Locale('ja', 'JP'), // 日本日语
          ],
          theme: initializeStore.state.themeData,
          home: SplashScreen(),
        ));
  }
}
