import 'package:flutter/material.dart';
import 'package:flutter_github_api/entity/index.dart';
import 'package:flutter_study_app/config/app_config.dart';
import 'package:flutter_study_app/factory.dart';
import 'package:flutter_study_app/model/app_model.dart';
import 'package:flutter_study_app/pages/chat/chat_screen.dart';
import 'package:flutter_study_app/pages/home/home_screen.dart';
import 'package:flutter_study_app/pages/mine/settings_screen.dart';
import 'package:flutter_study_app/pages/practise/practise_screen.dart';
import 'package:flutter_study_app/service/http_service.dart';
import 'package:flutter_study_app/service/local_storage.dart';
import 'package:flutter_study_app/utils/common_util.dart';
import 'package:flutter_study_app/vo/bottom_item_vo.dart';
import 'package:scoped_model/scoped_model.dart';

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
        ? Theme.of(context).primaryColor
        : style.navigatorUnSelectedColor;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
      builder: (context, child, model) {
        return Scaffold(
//          drawer: LeftDrawer(), // 侧边栏
          body: tabs[_currentIndex],
          bottomNavigationBar: _buildBottomBar(),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    tabs
      ..add(HomeScreen())
      ..add(PractiseScreen())
      ..add(ChatScreen())
      ..add(SettingScreen());

    // auto login
    checkAndLogin();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildBottomBar() {
    final List<TabItem> items = getBottomItems(context);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: style.navigatorUnSelectedColor,
      selectedItemColor: Theme.of(context).primaryColor,
      items: items.map((item) {
        return BottomNavigationBarItem(
            icon: Icon(item.icon),
            title: Text(item.title,
                style: TextStyle(color: _itemColor(item.index))));
      }).toList(),
      onTap: _tableHandler,
      currentIndex: _currentIndex,
    );
  }

  // 点击tab切换页面
  _tableHandler(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  /// check login
  checkAndLogin() async {
    String username = await LocalStorage.get(Constant.USERNAME);
    String password = await LocalStorage.get(Constant.PASSWORD);

    if (username == null || password == null) {
      return;
    }
    OauthResult result = await HttpService.login(username, password);
    if (result.data != null) {
      AppModel model = CommonUtil.getModel(context);
      model.afterLogin(result.data);
    }
  }
}

class AppStyle {

  // 底部导航未选中的颜色
  Color navigatorUnSelectedColor = Colors.black54;
}
