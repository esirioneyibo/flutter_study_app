import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/my_app_bar.dart';
import 'package:flutter_study_app/config.dart';
import 'package:flutter_study_app/i10n/localization_intl.dart';
import 'package:flutter_study_app/pages/chat.dart';
import 'package:flutter_study_app/pages/drawer.dart';
import 'package:flutter_study_app/pages/home.dart';
import 'package:flutter_study_app/pages/practise.dart';
import 'package:flutter_study_app/pages/tool.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'theme.dart';

///
/// 导航器是一个有状态的组件
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// tab页容器,如果list内容可变，不能指定list的大小
  List<Widget> tabs = List();

  int _currentIndex = 0;

  Color _itemColor(targetItem) {
    return _currentIndex == targetItem
        ? navigatorSelectedColor
        : navigatorUnSelectedColor;
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
  Widget build(BuildContext context) {
    // 点击tab切换页面
    var _tableHandler = (int index) {
      setState(() {
        _currentIndex = index;
      });
    };
    // 底部的4个tab
    var bottomNavigationBars =
        BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor:
          navigatorUnSelectedColor,
      selectedItemColor: navigatorSelectedColor,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text(
              MyLocalizations.of(context).index,
              style:
                  TextStyle(color: _itemColor(0)),
            )),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.whatshot,
            ),
            title: Text(
              MyLocalizations.of(context).study,
              style:
                  TextStyle(color: _itemColor(1)),
            )),
        BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.rocketchat,
            ),
            title: Text(
              MyLocalizations.of(context).chat,
              style:
                  TextStyle(color: _itemColor(2)),
            )),
        BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.tools,
            ),
            title: Text(
              MyLocalizations.of(context).tool,
              style:
                  TextStyle(color: _itemColor(3)),
            )),
      ],
      onTap: _tableHandler,
      currentIndex: _currentIndex,
    );

    return Scaffold(
      appBar: MyAppBar(title: ''),
      drawer: LeftDrawer(), // 侧边栏
      body: tabs[_currentIndex],
      bottomNavigationBar: bottomNavigationBars,
    );
  }

  @override
  void initState() {
    tabs
      ..add(HomeScreen())
      ..add(PractiseScreen())
      ..add(ChatScreen())
      ..add(ToolScreen());
//    _initFluwx();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    fluwx.dispose();
  }
}
