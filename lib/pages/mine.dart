import 'package:flutter/material.dart';
import 'package:flutter_study_app/app_state.dart';
import 'package:flutter_study_app/config.dart';

class LeftNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 抽屉菜单
    var items = ListTile.divideTiles(context: context, tiles: <Widget>[
      ListTile(
        leading: Icon(Icons.person),
        title: Text('我的动态'),
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
      ListTile(
        leading: Icon(Icons.color_lens),
        title: Text('主题切换'),
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
      ListTile(
        leading: Icon(Icons.cached),
        title: Text('清除缓存'),
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('设置中心'),
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
      ListTile(
        leading: Icon(Icons.near_me),
        title: Text('关于软件'),
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
      Visibility(
        visible: isLogin,
        child: ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('退出登录'),
          onTap: () {
            isLogin = false;
            Navigator.of(context).pop();
            Scaffold.of(context).showSnackBar(SnackBar(
                duration: Duration(milliseconds: 300),
                content: Text('您己退出登录')));
          },
        ),
      )
    ]);

    // 个人信息
    var infoWidget = Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ClipOval(
            child: InkWell(
              child: Image.asset(
                AppConfig.avatar,
                width: 80,
              ),
              onTap: () {
                debugPrint('点击头像');
              },
            ),
          ),
        ),
        Text(
          '小莫',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );

    var noLoginWidget = Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            child: ClipOval(
              child: Image.asset(
                AppConfig.default_avatar,
                width: 80,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, RouterConfig.account);
            },
          ),
        ),
        InkWell(
          child: Text(
            '点击头像登录',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.pushNamed(context, RouterConfig.account);
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
                padding: EdgeInsets.only(top: 40),
                child: isLogin ? infoWidget : noLoginWidget,
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
