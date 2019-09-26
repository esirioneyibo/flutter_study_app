import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/my_app_bar.dart';
import 'package:flutter_study_app/config/app_config.dart';
import 'package:flutter_study_app/factory.dart';
import 'package:flutter_study_app/i18n/fs_localization.dart';
import 'package:flutter_study_app/pages/chat_screen.dart';
import 'package:flutter_study_app/pages/drawer_screen.dart';
import 'package:flutter_study_app/pages/home_screen.dart';
import 'package:flutter_study_app/pages/practise_screen.dart';
import 'package:flutter_study_app/pages/tools_screen.dart';
import 'package:flutter_study_app/vo/bottom_item_vo.dart';

/// FsApp = (flutter study app)
class FsApp extends StatefulWidget {
  @override
  _FsAppState createState() => _FsAppState();
}

class _FsAppState extends State<FsApp> {
  /// tab页容器,如果list内容可变，不能指定list的大小
  List<Widget> tabs = List();

  int _currentIndex = 0;

  AppConfig style = ConfigFactory.appConfig();

  /// 改变选择的tab的文字颜色
  Color _itemColor(targetIndex) {
    return _currentIndex == targetIndex
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
      appBar: MyAppBar(title: FsLocalizations.of(context).currentLocale.appName),
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


class AppStyle{

}
