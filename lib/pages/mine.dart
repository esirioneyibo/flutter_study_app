import 'package:flutter/material.dart';

class LeftNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 抽屉菜单
    var items = ListTile.divideTiles(context: context, tiles: <Widget>[
      ListTile(
        leading: const Icon(Icons.person),
        title: const Text('我的动态'),
        onTap: () {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('我的动态'),
            duration: Duration(milliseconds: 200),
          ));
        },
      ),
      ListTile(
        leading: const Icon(Icons.color_lens),
        title: const Text('主题切换'),
        onTap: () {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('主题切换'),
            duration: Duration(milliseconds: 200),
          ));
        },
      ),
      ListTile(
        leading: const Icon(Icons.cached),
        title: const Text('清除缓存'),
        onTap: () {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('清除缓存'),
            duration: Duration(milliseconds: 200),
          ));
        },
      ),
      ListTile(
        leading: const Icon(Icons.settings),
        title: const Text('设置中心'),
        onTap: () {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('设置中心'),
            duration: Duration(milliseconds: 200),
          ));
        },
      ),
      ListTile(
        leading: const Icon(Icons.near_me),
        title: const Text('关于软件'),
        onTap: () {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('关于软件'),
            duration: Duration(milliseconds: 200),
          ));
        },
      )
    ]);

    // 个人信息
    var info = Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ClipOval(
            child: Image.asset(
              'images/avatar.png',
              width: 80,
            ),
          ),
        ),
        Text(
          '小莫',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );

    return new Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: info,
              ),
              Expanded(
                child: ListView(
                  children: items.toList(),
                ),
              )
            ],
          )),
    );
  }
}
