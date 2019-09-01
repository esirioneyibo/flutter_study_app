import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_study_app/config.dart';
import 'package:flutter_study_app/i10n/localization_intl.dart';
import 'package:flutter_study_app/pages/chat.dart';
import 'package:flutter_study_app/pages/drawer.dart';
import 'package:flutter_study_app/pages/tool.dart';
import 'package:flutter_study_app/pages/practise.dart';
import 'package:flutter_study_app/pages/study.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              icon: Icon(Icons.home, color: _itemColor(0)),
              activeIcon: Icon(Icons.home, color: _itemColor(0)),
              title: new Text(
                MyLocalizations.of(context).index,
                style: TextStyle(color: _itemColor(0)),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.whatshot, color: _itemColor(1)),
              activeIcon: Icon(Icons.whatshot, color: _itemColor(1)),
              title: new Text(
                MyLocalizations.of(context).study,
                style: TextStyle(color: _itemColor(1)),
              )),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.rocketchat, color: _itemColor(2)),
              activeIcon: Icon(FontAwesomeIcons.rocketchat, color: _itemColor(2)),
              title: new Text(
                MyLocalizations.of(context).chat,
                style: TextStyle(color: _itemColor(2)),
              )),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.tools, color: _itemColor(3)),
              activeIcon: Icon(FontAwesomeIcons.tools, color: _itemColor(3)),
              title: new Text(
                MyLocalizations.of(context).tool,
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
      ..add(new ToolScreen());
//    _initFluwx();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    fluwx.dispose();
  }
}
