import 'package:flutter/material.dart';
import 'package:flutter_study_app/pages/mine/login.dart';
import 'package:flutter_study_app/pages/mine/register.dart';
import 'package:flutter_study_app/pages/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'xiaomo',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
      ),
      home: new SplashScreen(),
    );
  }
}
