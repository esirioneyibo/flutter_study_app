import 'package:flutter/cupertino.dart';
import 'package:flutter_study_app/i10n/localization_intl.dart';
import 'package:flutter_study_app/pages/home/blog.dart';
import 'package:flutter_study_app/pages/home/community.dart';
import 'package:flutter_study_app/pages/home/dart.dart';
import 'package:flutter_study_app/pages/home/game.dart';
import 'package:flutter_study_app/pages/home/game_engine.dart';
import 'package:flutter_study_app/pages/home/other.dart';
import 'package:flutter_study_app/pages/home/plugins.dart';
import 'package:flutter_study_app/pages/home/project.dart';
import 'package:flutter_study_app/pages/home/tools.dart';
import 'package:flutter_study_app/pages/home/video.dart';

class TopNavigatorItem {
  // 项目名
  String itemName;

  // 内容
  Widget content;

  TopNavigatorItem(this.itemName, this.content);
}

List<TopNavigatorItem> topItems(BuildContext context) {
  return [
    TopNavigatorItem(MyLocalizations.of(context).plugin, PluginsScreen()),
    TopNavigatorItem(MyLocalizations.of(context).dart, DartScreen()),
    TopNavigatorItem(MyLocalizations.of(context).blog, BlogScreen()),
    TopNavigatorItem(MyLocalizations.of(context).video, VideosScreen()),
    TopNavigatorItem(MyLocalizations.of(context).tool, ToolsScreen()),
    TopNavigatorItem(MyLocalizations.of(context).community, CommunitiesScreen()),
    TopNavigatorItem(MyLocalizations.of(context).openSource, ProjectsScreen()),
    TopNavigatorItem(MyLocalizations.of(context).game, GamesScreen()),
    TopNavigatorItem(MyLocalizations.of(context).gameEngine, GameEnginesScreen()),
    TopNavigatorItem(MyLocalizations.of(context).other
        , OthersScreen()),
  ];
}
