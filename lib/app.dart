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
import 'package:flutter_study_app/service/http_service.dart';
import 'package:flutter_study_app/service/local_storage.dart';
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

  AppStyle style = ConfigFactory.appStyle();

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
      appBar: MyAppBar(title: FsLocalizations.getLocale(context).appName),
      drawer: LeftDrawer(), // 侧边栏
      body: tabs[_currentIndex],
      bottomNavigationBar: bottomNavigationBars,
    );
  }

  @override
  void initState() {
    super.initState();
    tabs
      ..add(HomeScreen())
      ..add(PractiseScreen())
      ..add(ChatScreen())
      ..add(ToolsScreen());

    // auto login
    checkAndLogin();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// check login
  checkAndLogin() async {
    String username = await LocalStorage.get(Constant.USERNAME);
    String password = await LocalStorage.get(Constant.PASSWORD);

    if (username == null || password == null) {
      return;
    }

    HttpService.login(username, password);
  }
}

class AppStyle {
  // 底部导航选中的颜色
  Color navigatorSelectedColor = Colors.blue;

  // 底部导航未选中的颜色
  Color navigatorUnSelectedColor = Colors.black54;
}
