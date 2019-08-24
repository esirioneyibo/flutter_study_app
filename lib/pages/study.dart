import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/MyAppBar.dart';
import 'package:flutter_study_app/models/TopNavigatorItem.dart';

class StudyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(context, '资源', kBottomNavigationBarHeight),
        body: Container(height: 50, child: HeadNavigator()));
  }
}

//--------------------------------------------------------------------------

/// 顶部导航
class HeadNavigator extends StatefulWidget {
  @override
  HeadNavigatorState createState() => HeadNavigatorState();
}

class HeadNavigatorState extends State<HeadNavigator> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var topItems = [
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

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: topItems.length,
      itemBuilder: (context, index) {
        return Container(
            child: Center(
              child: FlatButton(
                child: Text(topItems[index].itemName),
                onPressed: () {
                  print(topItems[index].itemName);
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
            ),
            decoration: index == selectedIndex
                ? BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.pink, width: 2)))
                : BoxDecoration());
      },
    );
  }
}
