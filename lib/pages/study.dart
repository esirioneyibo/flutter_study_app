import 'package:flutter/material.dart';
import 'package:flutter_study_app/pages/study/Temp1Screen.dart';
import 'package:flutter_study_app/pages/study/Temp2Screen.dart';
import 'package:flutter_study_app/pages/study/Temp3Screen.dart';
import 'package:flutter_study_app/pages/study/Temp4Screen.dart';

class StudyScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TopTabPage2State();
}

class TopTabPage2State extends State<StudyScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  List<Widget> tabs = new List();

  @override
  void initState() {
    super.initState();
    tabs
      ..add(new Temp1Screen())
      ..add(new Temp3Screen())
      ..add(new Temp2Screen())
      ..add(new Temp4Screen());
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var tabItems = [
      Tab(text: '社区'),
      Tab(text: '博客'),
      Tab(text: '开源项目'),
      Tab(text: '视频课程'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          tabs: tabItems,
          controller: tabController,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
      ),
      body: TabBarView(
        children: tabs,
        controller: tabController,
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
