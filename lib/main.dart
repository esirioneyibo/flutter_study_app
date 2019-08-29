import 'package:flutter/material.dart';
import 'package:flutter_study_app/config.dart';
import 'package:flutter_study_app/navigator.dart';
import 'package:flutter_study_app/pages/mine/account.dart';
import 'package:flutter_study_app/pages/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Router.home: (context) => BottomNavigator(),
        Router.login: (context) => LoginScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
      ),
      home: new SplashScreen(),
    );
  }
}
