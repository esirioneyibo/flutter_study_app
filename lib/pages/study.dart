import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/my_app_bar.dart';
import 'package:flutter_study_app/models/top_navigator_item.dart';

import '../config.dart';

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
    var topBar = TabBar(
      labelPadding: EdgeInsets.only(right: 20),
      isScrollable: true,
      labelColor: Colors.white,
      tabs: tabs,
      controller: _tabController,
    );
    return Scaffold(
        appBar: MyAppBar(context, '资源', AppBarHeight, topBar),
        body: TabBarView(
          controller: _tabController,
          children: tabContents,
        ));
  }

  @override
  void initState() {
    TopNavigatorItem.topItems.forEach((item) =>
        {tabs.add(Tab(text: item.itemName)), tabContents.add(item.content)});
    _tabController = TabController(vsync: this, length: tabs.length);
    super.initState();
  }
}
