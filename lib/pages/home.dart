import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_study_app/components/my_app_bar.dart';
import 'package:flutter_study_app/i10n/localization_intl.dart';
import 'package:flutter_study_app/models/navigator_item.dart';
import 'package:flutter_study_app/theme.dart';

class StudyScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StudyScreenState();
  }
}

class StudyScreenState extends State<StudyScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  var tabs = List<Tab>();
  var tabContents = List<Widget>();

  @override
  Widget build(BuildContext context) {
    topItems(context).forEach((item) =>
        {tabs.add(Tab(text: item.itemName)), tabContents.add(item.content)});
    _tabController = TabController(vsync: this, length: tabs.length);

    // 顶部tab切换
    var topBar = TabBar(
      isScrollable: true,
      unselectedLabelColor: navigatorUnSelectedColor,
      indicatorColor: navigatorSelectedColor,
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: Colors.pinkAccent,
      indicator: ShapeDecoration(
          shadows: [],
          shape:
              Border(bottom: BorderSide(width: 3, color: Colors.pinkAccent))),
      tabs: tabs,
      controller: _tabController,
    );
    return Scaffold(
        appBar:
            MyAppBar(title: MyLocalizations.of(context).index, topbar: topBar),
        body: TabBarView(
          controller: _tabController,
          children: tabContents,
        ));
  }
}
