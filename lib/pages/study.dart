import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/MyAppBar.dart';

class StudyScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TopTabPage2State();
}

class TopTabPage2State extends State<StudyScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  List<Widget> tabs = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(this.context, '资源', kBottomNavigationBarHeight),
        body: Column(
          children: <Widget>[
            Container(
              height: 50,
              child: HeadNavigator(),
            )
          ],
        ));
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}

class HeadNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
            child: Center(
              child: FlatButton(
                child: Text('库'),
                onPressed: () => {print('库')},
              ),
            )),
        Container(
            child: Center(
              child: FlatButton(
                child: Text('Dart'),
                onPressed: () => {print('Dart')},
              ),
            )),
        Container(
            child: Center(
              child: FlatButton(
                child: Text('博客'),
                onPressed: () => {print('博客')},
              ),
            )),     Container(
            child: Center(
              child: FlatButton(
                child: Text('视频'),
                onPressed: () => {print('视频')},
              ),
            )),     Container(
            child: Center(
              child: FlatButton(
                child: Text('工具'),
                onPressed: () => {print('工具')},
              ),
            )),     Container(
            child: Center(
              child: FlatButton(
                child: Text('社区'),
                onPressed: () => {print('社区')},
              ),
            )),     Container(
            child: Center(
              child: FlatButton(
                child: Text('项目'),
                onPressed: () => {print('开源项目')},
              ),
            )),     Container(
            child: Center(
              child: FlatButton(
                child: Text('游戏'),
                onPressed: () => {print('游戏')},
              ),
            )),     Container(
            child: Center(
              child: FlatButton(
                child: Text('游戏引擎'),
                onPressed: () => {print('游戏引擎')},
              ),
            )),     Container(
            child: Center(
              child: FlatButton(
                child: Text('其他'),
                onPressed: () => {print('其他')},
              ),
            )),
      ],
    );
  }
}
