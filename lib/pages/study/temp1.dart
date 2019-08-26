import 'package:flutter/material.dart';

class Temp1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var posts = <Widget>[
      ListTile(
        title: Text('这是标题'),
        subtitle: Text('假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容'),
      ),
      ListTile(
        title: Text('这是标题'),
        subtitle: Text('假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容'),
      ),
      ListTile(
        title: Text('这是标题'),
        subtitle: Text('假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容'),
      ),
      ListTile(
        title: Text('这是标题'),
        subtitle: Text('假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容'),
      ),
      ListTile(
        title: Text('这是标题'),
        subtitle: Text('假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容'),
      ),
      ListTile(
        title: Text('这是标题'),
        subtitle: Text('假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容'),
      ),
      ListTile(
        title: Text('这是标题'),
        subtitle: Text('假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容'),
      ),
      ListTile(
        title: Text('这是标题'),
        subtitle: Text('假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容'),
      ),
      ListTile(
        title: Text('这是标题'),
        subtitle: Text('假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容'),
      ),
      ListTile(
        title: Text('这是标题'),
        subtitle: Text('假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容'),
      ),
      ListTile(
        title: Text('这是标题'),
        subtitle: Text('假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容'),
      ),
      ListTile(
        title: Text('这是标题'),
        subtitle: Text('假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容'),
      ),
      ListTile(
        title: Text('这是标题'),
        subtitle: Text('假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容'),
      ),
      ListTile(
        title: Text('这是标题'),
        subtitle: Text('假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容'),
      )
    ];
    return Scaffold(
      body: Center(
        child: ListView(
          children:
              ListTile.divideTiles(context: context, tiles: posts).toList(),
        ),
      ),
    );
  }
}
