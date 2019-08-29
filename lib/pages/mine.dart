import 'package:flutter/material.dart';
import 'package:flutter_study_app/app_state.dart';
import 'package:flutter_study_app/config.dart';

class LeftNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 抽屉菜单
    var items = ListTile.divideTiles(context: context, tiles: <Widget>[
      ListTile(
        leading: const Icon(Icons.person),
        title: const Text('我的动态'),
        onTap: () {
          Navigator.pushNamed(context, '/login');
        },
      ),
      ListTile(
        leading: const Icon(Icons.color_lens),
        title: const Text('主题切换'),
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
      ListTile(
        leading: const Icon(Icons.cached),
        title: const Text('清除缓存'),
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
      ListTile(
        leading: const Icon(Icons.settings),
        title: const Text('设置中心'),
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
      ListTile(
        leading: const Icon(Icons.near_me),
        title: const Text('关于软件'),
        onTap: () {
          Navigator.of(context).pop();
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
              avatar,
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

    var noLogin = Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ClipOval(
            child: Image.asset(
              default_avatar,
              width: 80,
            ),
          ),
        ),
        InkWell(
          child: Text(
            '点击登录',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/login');
          },
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
                child: isLogin ? info : noLogin,
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
