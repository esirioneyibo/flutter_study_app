import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_study_app/components/my_app_bar.dart';
import 'package:flutter_study_app/factory.dart';
import 'package:flutter_study_app/i18n/fs_localization.dart';
import 'package:flutter_study_app/vo/bottom_item_vo.dart';

class HomeScreen extends StatefulWidget {
  State createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    HomeStyle homeStyle = ConfigFactory.homeStyle();

    var tabs = List<Tab>();
    var tabContents = List<Widget>();

    List<TabItem> topItems = getTopItems(context);
    topItems.forEach((item) {
      tabs.add(item.tab);
      tabContents.add(item.screen);
    });

    // 顶部tab切换
    var topBar = TabBar(
      indicatorWeight: homeStyle.indicatorWeight,
      isScrollable: tabs.length > homeStyle.scrollCount ? true : false,
      unselectedLabelColor: homeStyle.unSelectedColor,
      indicatorColor: homeStyle.selectedColor,
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: homeStyle.labelColor,
      indicator: ShapeDecoration(
          shadows: [],
          shape: Border(
              bottom: BorderSide(
                  width: homeStyle.borderSize, color: homeStyle.borderColor))),
      tabs: tabs,
    );
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
          appBar: MyAppBar(
              title: FsLocalizations.getLocale(context).index, tabBar: topBar),
          body: TabBarView(
            children: tabContents,
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// 首页配置
class HomeStyle {
  // 指示器高度
  double indicatorWeight = 0.5;

  // 顶部导航大于这个数量就可以滑动
  int scrollCount = 5;

  // 顶部导航选中后的颜色
  Color selectedColor = Colors.pink;

  // 顶部导航未选中的颜色
  Color unSelectedColor = Colors.white70;

  // 标签颜色
  Color labelColor = Colors.pinkAccent;

  // 底部边框大小
  double borderSize = 3;

  // 底部边框颜色
  Color borderColor = Colors.pink;
}
