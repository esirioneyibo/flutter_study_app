import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_study_app/components/my_app_bar.dart';
import 'package:flutter_study_app/i10n/localization_intl.dart';
import 'package:flutter_study_app/pages/home/blog_screen.dart';
import 'package:flutter_study_app/pages/home/community_screen.dart';
import 'package:flutter_study_app/pages/home/dart_screen.dart';
import 'package:flutter_study_app/pages/home/deveop_tools_screen.dart';
import 'package:flutter_study_app/pages/home/game_screen.dart';
import 'package:flutter_study_app/pages/home/game_engine_screen.dart';
import 'package:flutter_study_app/pages/home/other_screen.dart';
import 'package:flutter_study_app/pages/home/plugins_screen.dart';
import 'package:flutter_study_app/pages/home/project_screen.dart';
import 'package:flutter_study_app/pages/home/video_screen.dart';
import 'package:flutter_study_app/theme.dart';

// 本页面有性能问题，每次销毁重绘都会new新的list然后把内容放进去
// 这么写是因为取国际化的参数需要用到context参数
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tabs = List<Tab>();
    var tabContents = List<Widget>();
    tabs.add(Tab(text: MyLocalizations.of(context).plugin));
    tabContents.add(PluginsScreen());

    tabs.add(Tab(text: MyLocalizations.of(context).dart));
    tabContents.add(DartScreen());

    tabs.add(Tab(text: MyLocalizations.of(context).blog));
    tabContents.add(BlogScreen());

    tabs.add(Tab(text: MyLocalizations.of(context).video));
    tabContents.add(VideosScreen());

    tabs.add(Tab(text: MyLocalizations.of(context).tool));
    tabContents.add(DevelopToolsScreen());

    tabs.add(
        Tab(text: MyLocalizations.of(context).openSource));
    tabContents.add(ProjectsScreen());

    tabs.add(Tab(text: MyLocalizations.of(context).game));
    tabContents.add(GamesScreen());

    tabs.add(
        Tab(text: MyLocalizations.of(context).gameEngine));
    tabContents.add(GameEnginesScreen());

    tabs.add(
        Tab(text: MyLocalizations.of(context).community));
    tabContents.add(CommunitiesScreen());

    tabs.add(Tab(text: MyLocalizations.of(context).other));
    tabContents.add(OthersScreen());

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
              title: MyLocalizations.of(context).index,
              topbar: topBar),
          body: TabBarView(
            children: tabContents,
          )),
    );
  }
}
