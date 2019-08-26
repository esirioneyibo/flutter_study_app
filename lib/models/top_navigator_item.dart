import 'package:flutter/cupertino.dart';

class TopNavigatorItem {
  // 项目名
  String itemName;

  // 内容
  Widget content;

  TopNavigatorItem(this.itemName, this.content);

  static var topItems = [
    TopNavigatorItem('库', Text('库')),
    TopNavigatorItem('Dart', Text('Dart')),
    TopNavigatorItem('博客', Text('博客')),
    TopNavigatorItem('视频', Text('视频')),
    TopNavigatorItem('工具', Text('工具')),
    TopNavigatorItem('社区', Text('社区')),
    TopNavigatorItem('开源项目', Text('开源项目')),
    TopNavigatorItem('游戏', Text('游戏')),
    TopNavigatorItem('游戏引擎', Text('游戏引擎')),
    TopNavigatorItem('其他', Text('其他')),
  ];
}
