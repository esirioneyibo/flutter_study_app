import 'package:flutter/material.dart';
import 'package:flutter_study_app/pages/chat.dart';
import 'package:flutter_study_app/pages/home.dart';
import 'package:flutter_study_app/pages/mine.dart';
import 'package:flutter_study_app/pages/practise.dart';
import 'package:flutter_study_app/pages/study.dart';

import 'theme.dart';

///
/// 导航器是一个有状态的组件
class BottomNavigator extends StatefulWidget {
  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  /// tab页容器,如果list内容可变，不能指定list的大小
  List<Widget> tabs = new List();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new LeftNavigator(), // 侧边栏
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: bottomNavigatorUnSelectedColor),
              title: new Text(
                '首页',
                style: TextStyle(color: bottomNavigatorUnSelectedColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.filter_vintage,
                  color: bottomNavigatorUnSelectedColor),
              title: new Text(
                '资源',
                style: TextStyle(color: bottomNavigatorUnSelectedColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.whatshot, color: bottomNavigatorUnSelectedColor),
              title: new Text(
                '每日一练',
                style: TextStyle(color: bottomNavigatorUnSelectedColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera, color: bottomNavigatorUnSelectedColor),
              title: new Text(
                '圈子',
                style: TextStyle(color: bottomNavigatorUnSelectedColor),
              )),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
      ),
    );
  }

  @override
  void initState() {
    tabs
      ..add(new HomeScreen())
      ..add(new StudyScreen())
      ..add(new PractiseScreen())
      ..add(new ChatScreen());
    super.initState();
  }
}
