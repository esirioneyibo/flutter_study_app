import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_study_app/components/my_app_bar.dart';
import 'package:flutter_study_app/i10n/localization_intl.dart';
import 'package:flutter_study_app/theme.dart';
import 'package:flutter_study_app/vo/bottom_item_vo.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tabs = List<Tab>();
    var tabContents = List<Widget>();

    List<TabItem> topItems = getTopItems(context);
    topItems.forEach((item) {
      tabs.add(item.tab);
      tabContents.add(item.screen);
    });


    // 顶部tab切换
    var topBar = TabBar(
      indicatorWeight: 0.5,
      isScrollable: true,
      unselectedLabelColor: topNavigatorUnSelectedColor,
      indicatorColor: topNavigatorSelectedColor,
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: Colors.pinkAccent,
      indicator: ShapeDecoration(
          shadows: [],
          shape: Border(
              bottom: BorderSide(
                  width: 3, color: Colors.pinkAccent))),
      tabs: tabs,
    );
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
          appBar: MyAppBar(
              title: MyLocalizations
                  .of(context)
                  .index,
              topbar: topBar),
          body: TabBarView(
            children: tabContents,
          )),
    );
  }
}
