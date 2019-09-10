import 'package:flutter/material.dart';
import 'package:flutter_study_app/app_state.dart';
import 'package:flutter_study_app/config.dart';
import 'package:flutter_study_app/i10n/localization_intl.dart';
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
          duration: Duration(milliseconds: 300),
          content:
              Text(MyLocalizations.of(context).exitLogin)));
    }

    // 抽屉菜单
    var items = ListTile
        .divideTiles(context: context, tiles: <Widget>[
      ListTile(
        leading: Icon(Icons.color_lens),
        title: Text(
            MyLocalizations.of(context).changeLanguage),
        onTap: () {
          Navigator.pushNamed(
              context, RouterConfig.language);
        },
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text(MyLocalizations.of(context).settings),
        onTap: () {
          Navigator.pushNamed(
              context, RouterConfig.settings);
        },
      ),
      ListTile(
        leading: Icon(Icons.phone_iphone),
        title: Text(MyLocalizations.of(context).deviceInfo),
        onTap: () {
          Navigator.pushNamed(
              context, RouterConfig.deviceInfo);
        },
      ),
      Visibility(
        visible: currentUser != null,
        child: ListTile(
          leading: Icon(Icons.exit_to_app),
          title:
              Text(MyLocalizations.of(context).exitLogin),
          onTap: () {
            DialogUtil.showConfirmDialog(
                context,
                MyLocalizations.of(context)
                    .confirmExitLogin,
                exitLogin);
          },
        ),
      )
    ]);

    // 个人信息
    var infoWidget = UserAccountsDrawerHeader(
      accountName: Text(currentUser == null
          ? MyLocalizations.of(context).clickLogin
          : currentUser.displayName),
      accountEmail: Text(
          currentUser == null ? '' : currentUser.email),
      onDetailsPressed: () {
        if (currentUser == null) {
          Navigator.pushNamed(
              context, RouterConfig.account);
        } else {
          DialogUtil.showAlertDialog(
              context,
              MyLocalizations.of(context).developing,
              MyLocalizations.of(context).beHope);
        }
      },
      currentAccountPicture: CircleAvatar(
        backgroundImage: currentUser == null
            ? AssetImage(
                AppConfig.default_avatar,
              )
            : NetworkImage(
                currentUser.photoUrl,
              ),
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
//              colorFilter: ColorFilter.mode(
//                  Colors.blue[400].withAlpha(60),
//                  BlendMode.hardLight),
              fit: BoxFit.cover,
              image: AssetImage(AppConfig.accountBg))),
    );

    return Drawer(
        child: Column(
      children: <Widget>[
        infoWidget,
        Expanded(
            child: ListView(
          children: items.toList(),
        ))
      ],
    ));
  }
}
