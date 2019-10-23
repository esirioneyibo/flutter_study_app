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
  final HomeStyle style = ConfigFactory.homeStyle();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var tabs = List<Tab>();
    var tabContents = List<Widget>();
    List<TabItem> topItems = getTopItems(context);
    topItems.forEach((item) {
      tabs.add(item.tab);
      tabContents.add(item.screen);
    });
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
          appBar: MyAppBar(
              title: FsLocalizations.getLocale(context).index,
              tabBar: _buildTopBars(tabs)),
          body: TabBarView(
            children: tabContents,
          )),
    );
  }

  Widget _buildTopBars(tabs) {
    return TabBar(
      indicatorWeight: style.indicatorWeight,
      isScrollable: tabs.length > style.scrollCount ? true : false,
      unselectedLabelColor: style.unSelectedColor,
      indicatorColor: style.selectedColor,
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: style.labelColor,
      indicator: ShapeDecoration(
          shadows: [],
          shape: Border(
              bottom: BorderSide(
                  width: style.borderSize, color: style.borderColor))),
      tabs: tabs,
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
  Color borderColor = Colors.blue;
}
