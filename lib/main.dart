import 'package:flutter/material.dart';
import 'package:flutter_study_app/navigator/BottomNavigator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'xiaomo',
      theme: ThemeData.light(),
      home: BottomNavigator(),
    );
  }
}
