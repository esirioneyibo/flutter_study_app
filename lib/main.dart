import 'package:flutter/material.dart';
import 'package:flutter_study_app/app.dart';
import 'package:flutter_study_app/config.dart';
import 'package:flutter_study_app/pages/mine/about.dart';
import 'package:flutter_study_app/pages/mine/account.dart';
import 'package:flutter_study_app/pages/mine/settings.dart';
import 'package:flutter_study_app/pages/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        RouterConfig.index: (context) => App(),
        RouterConfig.account: (context) => AccountScreen(),
        RouterConfig.about: (context) => AboutScreen(),
        RouterConfig.settings: (context) => SettingScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
      ),
      home: new SplashScreen(),
    );
  }
}
