import 'package:flutter/material.dart';
import 'package:flutter_study_app/config/app_config.dart';
import 'package:flutter_study_app/config/router_config.dart';
import 'package:flutter_study_app/factory.dart';
import 'package:flutter_study_app/i18n/fs_localization.dart';
import 'package:flutter_study_app/utils/dialog_util.dart';

class LeftDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RouterConfig router = ConfigFactory.router();
    void exitLogin() {
      currentUser = null;
      // 连退2级，从dialog退到drawer再退到主页
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Scaffold.of(context).showSnackBar(SnackBar(
          duration: Duration(milliseconds: 300),
          content: Text(FsLocalizations.getLocale(context).exitLogin)));
    }

    // 抽屉菜单
    var items = ListTile.divideTiles(context: context, tiles: <Widget>[
      ListTile(
        leading: Icon(Icons.color_lens),
        title: Text(FsLocalizations.getLocale(context).changeLanguage),
        onTap: () {
          Navigator.pushNamed(context, router.language);
        },
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text(FsLocalizations.getLocale(context).settings),
        onTap: () {
          Navigator.pushNamed(context, router.settings);
        },
      ),
      ListTile(
        leading: Icon(Icons.color_lens),
        title: Text(FsLocalizations.getLocale(context).theme),
        onTap: () {
          Navigator.pushNamed(context, router.theme);
        },
      ),
      ListTile(
        leading: Icon(Icons.phone_iphone),
        title: Text(FsLocalizations.getLocale(context).deviceInfo),
        onTap: () {
          Navigator.pushNamed(context, router.deviceInfo);
        },
      ),
      Visibility(
        visible: currentUser != null,
        child: ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text(FsLocalizations.getLocale(context).exitLogin),
          onTap: () {
            DialogUtil.showConfirmDialog(context,
                FsLocalizations.getLocale(context).confirmExitLogin, exitLogin);
          },
        ),
      )
    ]);

    // 个人信息
    var infoWidget = UserAccountsDrawerHeader(
      accountName: Text(currentUser == null
          ? FsLocalizations.getLocale(context).clickLogin
          : currentUser.login),
      accountEmail: Text(currentUser == null ? '' : currentUser.email),
      onDetailsPressed: () {
        if (currentUser == null) {
          Navigator.pushNamed(context, router.account);
        } else {
          DialogUtil.showAlertDialog(
              context,
              FsLocalizations.getLocale(context).developing,
              FsLocalizations.getLocale(context).beHope);
        }
      },
      currentAccountPicture: CircleAvatar(
        backgroundImage: currentUser == null
            ? AssetImage(
                AppConfig.defaultAvatar,
              )
            : NetworkImage(
                currentUser.avatarUrl,
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
