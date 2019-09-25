import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/my_app_bar.dart';
import 'package:flutter_study_app/config/app_config.dart';
import 'package:flutter_study_app/factory.dart';
import 'package:flutter_study_app/i10n/localization_intl.dart';
import 'package:flutter_study_app/pages/chat_screen.dart';
import 'package:flutter_study_app/pages/drawer_screen.dart';
import 'package:flutter_study_app/pages/home_screen.dart';
import 'package:flutter_study_app/pages/practise_screen.dart';
import 'package:flutter_study_app/pages/tools_screen.dart';
import 'package:flutter_study_app/vo/bottom_item_vo.dart';

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

  AppConfig style = ConfigFactory.appConfig();

  Color _itemColor(targetItem) {
    return _currentIndex == targetItem
        ? style.navigatorSelectedColor
        : style.navigatorUnSelectedColor;
  }

  @override
  Widget build(BuildContext context) {
    // 点击tab切换页面
    var _tableHandler = (int index) {
      setState(() {
        _currentIndex = index;
      });
    };

    final List<TabItem> items = getBottomItems(context);

    // 底部的4个tab
    var bottomNavigationBars = BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: style.navigatorUnSelectedColor,
      selectedItemColor: style.navigatorSelectedColor,
      items: items.map((item) {
        return BottomNavigationBarItem(
            icon: Icon(item.icon),
            title: Text(item.title,
                style: TextStyle(color: _itemColor(item.index))));
      }).toList(),
      onTap: _tableHandler,
      currentIndex: _currentIndex,
    );

    return Scaffold(
      appBar: MyAppBar(title: MyLocalizations.of(context).appName),
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
      ..add(ToolsScreen());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
