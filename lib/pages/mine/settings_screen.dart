import 'package:flutter/material.dart';
import 'package:flutter_github_api/flutter_github_api.dart';
import 'package:flutter_study_app/config/app_config.dart';
import 'package:flutter_study_app/config/router_config.dart';
import 'package:flutter_study_app/i18n/fs_localization.dart';
import 'package:flutter_study_app/model/app_model.dart';
import 'package:flutter_study_app/service/local_storage.dart';
import 'package:flutter_study_app/utils/index.dart';
import 'package:scoped_model/scoped_model.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
      builder: (context, child, model) {
        return Scaffold(
            appBar: AppBar(
                title: Text(FsLocalizations.getLocale(context).settings)),
            body: Column(
              children: <Widget>[
                _buildInfo(context, model),
                Expanded(
                    child: ListView(
                  children: _buildDrawItems(context, model),
                ))
              ],
            ));
      },
    );
  }

  /// 退出登录
  void _exitLogin(BuildContext context, AppModel model) {
    Navigator.of(context).pop();
    Scaffold.of(context).showSnackBar(SnackBar(
        duration: Duration(milliseconds: 300),
        content: Text(FsLocalizations.getLocale(context).exitLogin)));
    model.afterLogout();
  }

  void _clearCacheCallback(BuildContext context) {
    LocalStorage.removeAll();
    Navigator.of(context).pop();
    DialogUtil.showOKDialog(context,FsLocalizations.getLocale(context)
        .clearCacheSuccess);
  }

  /// 菜单项目列表
  List<Widget> _buildDrawItems(BuildContext context, AppModel model) {
    return ListTile.divideTiles(context: context, tiles: <Widget>[
      ListTile(
        leading: Icon(Icons.color_lens),
        title: Text(FsLocalizations.getLocale(context).changeLanguage),
        onTap: () {
          Navigator.pushNamed(context, RouterConfig.language);
        },
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text(FsLocalizations
            .getLocale(context)
            .clearCache),
        onTap: () {
          DialogUtil.showConfirmDialog(
              context,
              FsLocalizations
                  .getLocale(context)
                  .confirmClearCache,
                  () => _clearCacheCallback(context));
        },
      ),
      ListTile(
        leading: Icon(Icons.color_lens),
        title: Text(FsLocalizations.getLocale(context).theme),
        onTap: () {
          Navigator.pushNamed(context, RouterConfig.theme);
        },
      ),
      ListTile(
        leading: Icon(Icons.phone_iphone),
        title: Text(FsLocalizations.getLocale(context).deviceInfo),
        onTap: () {
          Navigator.pushNamed(context, RouterConfig.deviceInfo);
        },
      ),
      Visibility(
        visible: model.user != null,
        child: ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text(FsLocalizations.getLocale(context).exitLogin),
          onTap: () {
            DialogUtil.showConfirmDialog(
                context, FsLocalizations.getLocale(context).confirmExitLogin,
                () {
              _exitLogin(context, model);
            });
          },
        ),
      )
    ]).toList();
  }

  /// 用户信息
  Widget _buildInfo(BuildContext context, AppModel model) {
    User currentUser = model.user;
    return UserAccountsDrawerHeader(
      accountName: Text(currentUser == null
          ? FsLocalizations.getLocale(context).login
          : currentUser.login),
      accountEmail: Text(currentUser == null ? '' : currentUser.email),
      onDetailsPressed: () {
        if (currentUser == null) {
          Navigator.pushNamed(context, RouterConfig.account);
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
                Constant.defaultAvatar,
              )
            : NetworkImage(
                currentUser.avatarUrl,
              ),
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(Constant.accountBg))),
    );
  }
}
