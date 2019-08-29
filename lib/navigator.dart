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

  Color _itemColor(targetItem) {
    return _currentIndex == targetItem
        ? bottomNavigatorSelectedColor
        : bottomNavigatorUnSelectedColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new LeftNavigator(), // 侧边栏
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: _itemColor(0)),
              activeIcon: Icon(Icons.home, color: _itemColor(0)),
              title: new Text(
                '首页',
                style: TextStyle(color: _itemColor(0)),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.filter_vintage, color: _itemColor(1)),
              activeIcon: Icon(Icons.filter_vintage, color: _itemColor(1)),
              title: new Text(
                '资源',
                style: TextStyle(color: _itemColor(1)),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.whatshot, color: _itemColor(2)),
              activeIcon: Icon(Icons.whatshot, color: _itemColor(2)),
              title: new Text(
                '每日一练',
                style: TextStyle(color: _itemColor(2)),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera, color: _itemColor(3)),
              activeIcon: Icon(Icons.camera, color: _itemColor(3)),
              title: new Text(
                '圈子',
                style: TextStyle(color: _itemColor(3)),
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
