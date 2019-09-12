import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_study_app/app.dart';
import 'package:flutter_study_app/config.dart';
import 'package:flutter_study_app/factory.dart';
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
    RouterConfig router = ConfigFactory.router();
    return MaterialApp(
      routes: {
        router.index: (context) => MyApp(),
        router.account: (context) => AccountScreen(),
        router.about: (context) => AboutAppScreen(),
        router.settings: (context) => SettingScreen(),
        router.language: (context) => LanguageScreen(),
        router.deviceInfo: (context) => DeviceInfoScreen(),
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
