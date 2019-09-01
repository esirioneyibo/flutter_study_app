import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_study_app/config.dart';
import 'package:flutter_study_app/pages/chat.dart';
import 'package:flutter_study_app/pages/drawer.dart';
import 'package:flutter_study_app/pages/home.dart';
import 'package:flutter_study_app/pages/practise.dart';
import 'package:flutter_study_app/pages/study.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

import 'theme.dart';

///
/// 导航器是一个有状态的组件
class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
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
      drawer: LeftDrawer(), // 侧边栏
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.filter_vintage, color: _itemColor(0)),
              activeIcon: Icon(Icons.filter_vintage, color: _itemColor(0)),
              title: new Text(
                '资源',
                style: TextStyle(color: _itemColor(0)),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.whatshot, color: _itemColor(1)),
              activeIcon: Icon(Icons.whatshot, color: _itemColor(1)),
              title: new Text(
                '每日一练',
                style: TextStyle(color: _itemColor(1)),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera, color: _itemColor(2)),
              activeIcon: Icon(Icons.camera, color: _itemColor(2)),
              title: new Text(
                '圈子',
                style: TextStyle(color: _itemColor(2)),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: _itemColor(3)),
              activeIcon: Icon(Icons.home, color: _itemColor(3)),
              title: new Text(
                '工具',
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

  _initFluwx() async {
    await fluwx.register(
        appId: AppConfig.weChatAppId,
        doOnAndroid: Platform.isAndroid,
        doOnIOS: Platform.isIOS,
        enableMTA: false);
    var result = await fluwx.isWeChatInstalled();
    print("is installed $result");
  }

  @override
  void initState() {
    tabs
      ..add(new StudyScreen())
      ..add(new PractiseScreen())
      ..add(new ChatScreen())
      ..add(new HomeScreen());
//    _initFluwx();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    fluwx.dispose();
  }
}
