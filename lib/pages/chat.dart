import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/MyAppBar.dart';

import '../config.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var posts = <Widget>[
      ListTile(
        title: Text('这是标题'),
        subtitle: Text('假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容'),
      ),ListTile(
        title: Text('这是标题'),
        subtitle: Text('假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容'),
      ),ListTile(
        title: Text('这是标题'),
        subtitle: Text('假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容'),
      ),ListTile(
        title: Text('这是标题'),
        subtitle: Text('假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容'),
      ),ListTile(
        title: Text('这是标题'),
        subtitle: Text('假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容'),
      ),ListTile(
        title: Text('这是标题'),
        subtitle: Text('假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容'),
      ),ListTile(
        title: Text('这是标题'),
        subtitle: Text('假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容'),
      ),ListTile(
        title: Text('这是标题'),
        subtitle: Text('假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容'),
      ),ListTile(
        title: Text('这是标题'),
        subtitle: Text('假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容'),
      ),ListTile(
        title: Text('这是标题'),
        subtitle: Text('假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容'),
      ),ListTile(
        title: Text('这是标题'),
        subtitle: Text('假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容'),
      ),ListTile(
        title: Text('这是标题'),
        subtitle: Text('假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容'),
      ),ListTile(
        title: Text('这是标题'),
        subtitle: Text('假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容'),
      ),ListTile(
        title: Text('这是标题'),
        subtitle: Text('假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容'),
      )

    ];
    return Scaffold(
      appBar: MyAppBar(context, '圈子', AppHeight),
      body: Center(
        child: ListView(
          children:
              ListTile.divideTiles(context: context, tiles: posts).toList(),
        ),
      ),
    );
  }
}
