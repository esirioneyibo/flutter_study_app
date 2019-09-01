import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_study_app/app.dart';
import 'package:flutter_study_app/config.dart';
import 'package:flutter_study_app/i10n/localization_intl.dart';
import 'package:flutter_study_app/pages/mine/about.dart';
import 'package:flutter_study_app/pages/mine/account.dart';
import 'package:flutter_study_app/pages/mine/settings.dart';
import 'package:flutter_study_app/pages/splash.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        RouterConfig.index: (context) => MyApp(),
        RouterConfig.account: (context) => AccountScreen(),
        RouterConfig.about: (context) => AboutScreen(),
        RouterConfig.settings: (context) => SettingScreen(),
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        MyLocalizationsDelegate()
      ],
      supportedLocales: [
        const Locale('zh', 'CN'), // 中文简体
        const Locale('en', 'US'), // 美国英语
        const Locale('ja', 'JP'), // 日本日语
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
      ),
      home: new SplashScreen(),
    );
  }
}
