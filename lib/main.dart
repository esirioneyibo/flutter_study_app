import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_study_app/app.dart';
import 'package:flutter_study_app/config.dart';
import 'package:flutter_study_app/i10n/localization_intl.dart';
import 'package:flutter_study_app/pages/mine/about_screen.dart';
import 'package:flutter_study_app/pages/mine/account_screen.dart';
import 'package:flutter_study_app/pages/mine/device_info_screen.dart';
import 'package:flutter_study_app/pages/mine/language_screen.dart';
import 'package:flutter_study_app/pages/mine/settings_screen.dart';
import 'package:flutter_study_app/pages/splash_screen.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        RouterConfig.index: (context) => MyApp(),
        RouterConfig.account: (context) => AccountScreen(),
        RouterConfig.about: (context) => AboutAppScreen(),
        RouterConfig.settings: (context) => SettingScreen(),
        RouterConfig.language: (context) =>
            LanguageScreen(),
        RouterConfig.deviceInfo: (context) =>
            DeviceInfoScreen(),
      },
//      locale: Locale("en","US"),
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        MyLocalizationsDelegate()
      ],
      supportedLocales: [
        const Locale('zh', 'CN'), // 中文简体
        const Locale('en', 'US'), // 美国英语
        const Locale('ja', 'JP'), // 日本日语
      ],
      theme: ThemeData(primaryColor: Colors.blue),
      home: SplashScreen(),
    );
  }
}
