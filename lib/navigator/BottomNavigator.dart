import 'package:flutter/material.dart';
import 'package:flutter_study_app/pages/ChatScreen.dart';
import 'package:flutter_study_app/pages/HomeScreen.dart';
import 'package:flutter_study_app/pages/MineScreen.dart';
import 'package:flutter_study_app/pages/PractiseScreen.dart';

import '../theme.dart';

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
    var tabItems = [
      BottomNavigationBarItem(
          icon: Icon(Icons.home, color: bottomNavigatorBackgroundColor),
          title: new Text('首页')),
      BottomNavigationBarItem(
          icon: Icon(Icons.favorite, color: bottomNavigatorBackgroundColor),
          title: new Text('每日一练')),
      BottomNavigationBarItem(
          icon: Icon(Icons.chat, color: bottomNavigatorBackgroundColor),
          title: new Text('圈子')),
      BottomNavigationBarItem(
          icon: Icon(Icons.settings, color: bottomNavigatorBackgroundColor),
          title: new Text('我的')),
    ];
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: tabItems,
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
      ..add(new PractiseScreen())
      ..add(new ChatScreen())
      ..add(new MineScreen());
    super.initState();
  }
}
