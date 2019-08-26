import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/my_app_bar.dart';
import 'package:flutter_study_app/config.dart';
import 'package:flutter_study_app/models/top_navigator_item.dart';

class StudyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(context, '资源', AppBarHeight),
        body: Container(
            height: 50,
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 1))),
            child: HeadNavigator()));
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
    var topItems = TopNavigatorItem.topItems;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: topItems.length,
      itemBuilder: (context, index) {
        return Container(
            child: Center(
              child: FlatButton(
                child: Text(
                  topItems[index].itemName,
                  style: TextStyle(
                      color:
                          index == selectedIndex ? Colors.pink : Colors.black),
                ),
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
