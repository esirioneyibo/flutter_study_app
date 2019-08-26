import 'package:flutter/cupertino.dart';
import 'package:flutter_study_app/pages/study/blog.dart';
import 'package:flutter_study_app/pages/study/community.dart';
import 'package:flutter_study_app/pages/study/dart.dart';
import 'package:flutter_study_app/pages/study/game.dart';
import 'package:flutter_study_app/pages/study/game_engine.dart';
import 'package:flutter_study_app/pages/study/other.dart';
import 'package:flutter_study_app/pages/study/plugins.dart';
import 'package:flutter_study_app/pages/study/project.dart';
import 'package:flutter_study_app/pages/study/tools.dart';
import 'package:flutter_study_app/pages/study/video.dart';

class TopNavigatorItem {
  // 项目名
  String itemName;

  // 内容
  Widget content;

  TopNavigatorItem(this.itemName, this.content);

  static var topItems = [
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
}
