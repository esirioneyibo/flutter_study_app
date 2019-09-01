import 'package:flutter/material.dart';
import 'package:flutter_study_app/app_state.dart';
import 'package:flutter_study_app/config.dart';
import 'package:flutter_study_app/utils/dialog_util.dart';

class LeftDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void exitLogin() {
      currentUser = null;
      // 连退2级，从dialog退到drawer再退到主页
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Scaffold.of(context).showSnackBar(SnackBar(
          duration: Duration(milliseconds: 300), content: Text('您己退出登录')));
    }

    // 抽屉菜单
    var items = ListTile.divideTiles(context: context, tiles: <Widget>[
      ListTile(
        leading: Icon(Icons.color_lens),
        title: Text('语言切换'),
        onTap: () {
          Navigator.pushNamed(context, RouterConfig.language);
        },
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('设置中心'),
        onTap: () {
          Navigator.pushNamed(context, RouterConfig.settings);
        },
      ),
      ListTile(
        leading: Icon(Icons.near_me),
        title: Text('关于软件'),
        onTap: () {
          Navigator.pushNamed(context, RouterConfig.about);
        },
      ),
      Visibility(
        visible: currentUser != null,
        child: ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('退出登录'),
          onTap: () {
            DialogUtil.showConfirmDialog(context, "确定退出登陆吗?", exitLogin);
          },
        ),
      )
    ]);

    // 个人信息
    var infoWidget = Container(
        child: Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ClipOval(
            child: currentUser == null
                ? Image.asset(
                    AppConfig.default_avatar,
                    width: 80,
                  )
                : Image.network(
                    currentUser.photoUrl,
                    width: 80,
                  ),
          ),
        ),
        Text(
          currentUser == null ? "点击登陆" : currentUser.displayName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    ));

    return new Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                onTap: () {
                  if (currentUser == null) {
                    Navigator.pushNamed(context, RouterConfig.account);
                  }
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
                  child: infoWidget,
                ),
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
