import 'package:flutter/material.dart';
import 'package:flutter_study_app/i18n/fs_localization.dart';
import 'package:flutter_study_app/pages/home/blog_screen.dart';
import 'package:flutter_study_app/pages/home/plugins_screen.dart';
import 'package:flutter_study_app/pages/home/project_screen.dart';
import 'package:flutter_study_app/pages/home/video_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabItem {
  final index;
  final IconData icon;
  final String title;
  final Widget screen;
  final Tab tab;

  TabItem({this.index, this.icon, this.title, this.screen, this.tab});
}

getBottomItems(BuildContext context) {
  return [
    TabItem(
      index: 0,
      icon: Icons.home,
      title: FsLocalizations.of(context).currentLocale.index,
    ),
    TabItem(
      index: 1,
      icon: Icons.ac_unit,
      title: FsLocalizations.of(context).currentLocale.study,
    ),
    TabItem(
      index: 2,
      icon: FontAwesomeIcons.rocketchat,
      title: FsLocalizations.of(context).currentLocale.chat,
    ),
    TabItem(
      index: 3,
      icon: FontAwesomeIcons.tools,
      title: FsLocalizations.of(context).currentLocale.tool,
    ),
  ];
}

List<TabItem> getTopItems(BuildContext context) {
  return [
    TabItem(
        index: 0,
        tab: Tab(text: FsLocalizations.of(context).currentLocale.video),
        screen: VideosScreen()),
    TabItem(
        index: 1,
        tab: Tab(text: FsLocalizations.of(context).currentLocale.plugin),
        screen: PluginsScreen()),
    TabItem(
        index: 2,
        tab: Tab(text: FsLocalizations.of(context).currentLocale.blog),
        screen: BlogScreen()),
    TabItem(
        index: 3,
        tab: Tab(text: FsLocalizations.of(context).currentLocale.openSource),
        screen: ProjectsScreen()),
//    TabItem(
//        index: 4,
//        tab: Tab(text: FsLocalizations.of(context).currentLocale.tool),
//        screen: DevelopToolsScreen()),
//    TabItem(
//        index: 5,
//        tab: Tab(text: FsLocalizations.of(context).currentLocale.dart),
//        screen: DartScreen()),
//    TabItem(
//        index: 6,
//        tab: Tab(text: FsLocalizations.of(context).currentLocale.game),
//        screen: GamesScreen()),
//    TabItem(
//        index: 7,
//        tab: Tab(
//            text: FsLocalizations.of(context).currentLocale.gameEngine),
//        screen: GameEnginesScreen()),
//    TabItem(
//        index: 8,
//        tab: Tab(
//            text: FsLocalizations.of(context).currentLocale.community),
//        screen: CommunitiesScreen()),
//    TabItem(
//        index: 9,
//        tab: Tab(text: FsLocalizations.of(context).currentLocale.other),
//        screen: OthersScreen()),
  ];
}
