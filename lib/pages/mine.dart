import 'package:flutter/material.dart';

class LeftNavigator extends StatelessWidget {
  // 抽屉菜单
  final  menuItems = ListView(
    children: <Widget>[
      ListTile(
        leading: const Icon(Icons.add),
        title: const Text('用户中心'),
      ),
      ListTile(
        leading: const Icon(Icons.settings),
        title: const Text('关于我'),
      )
    ],
  );

  // 个人信息
  final info = Row(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ClipOval(
          child: Image.network(
            'https://image.xiaomo.info/logo/avatar.png',
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

  @override
  Widget build(BuildContext context) {
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
                child: menuItems,
              )
            ],
          )),
    );
  }
}
