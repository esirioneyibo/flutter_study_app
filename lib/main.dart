import 'package:flutter/material.dart';
import 'package:flutter_study_app/config.dart';
import 'package:flutter_study_app/navigator.dart';
import 'package:flutter_study_app/pages/mine/account.dart';
import 'package:flutter_study_app/pages/splash.dart';
import 'package:flutter_study_app/service/base_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        RouterConfig.home: (context) => BottomNavigator(),
        RouterConfig.account: (context) => AccountScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
      ),
      home: new SplashScreen(),
    );
  }
}
