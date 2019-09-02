import 'package:flutter/cupertino.dart';
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

final List<TopNavigatorItem> topItems = [
  TopNavigatorItem('插件', PluginsScreen()),
  TopNavigatorItem('Dart', DartScreen()),
  TopNavigatorItem('博客', BlogScreen()),
  TopNavigatorItem('视频', VideosScreen()),
  TopNavigatorItem('工具', ToolsScreen()),
  TopNavigatorItem('社区', CommunitiesScreen()),
  TopNavigatorItem('开源项目', ProjectsScreen()),
  TopNavigatorItem('游戏', GamesScreen()),
  TopNavigatorItem('游戏引擎', GameEnginesScreen()),
  TopNavigatorItem('其他', OthersScreen()),
];
