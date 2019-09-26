import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/return_bar.dart';
import 'package:flutter_study_app/config/app_config.dart';
import 'package:flutter_study_app/factory.dart';
import 'package:flutter_study_app/i18n/fs_localization.dart';
import 'package:flutter_study_app/utils/dialog_util.dart';
import 'package:flutter_study_app/utils/navigator_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum FormType {
  LOGIN,
  REGISTER,
}

/// login and register
class AccountScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AccountScreenState();
  }
}

class _AccountScreenState extends State<AccountScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String username = 'Your Name';

  /// 验证和保存
  bool _validateAndSave() {
    final FormState state = formKey.currentState;
    if (state.validate()) {
      state.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        NavigatorUtil.back(context, details);
      },
      child: Scaffold(
        appBar: ReturnBar(FsLocalizations.of(context).currentLocale.login),
        body: Container(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: buildInputs() + buildSubmitButtons(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildInputs() {
    return <Widget>[
      TextFormField(
        key: Key('email'),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: FsLocalizations.of(context).currentLocale.email),
        validator: EmailFieldValidator.validate,
        onSaved: (String value) {
          currentUser.email = value;
        },
      ),
      TextFormField(
        key: Key('password'),
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
            labelText: FsLocalizations.of(context).currentLocale.password),
        validator: PasswordFieldValidator.validate,
        onSaved: (String value) {
//          currentUser.password = value;
        },
      )
    ];
  }

//   验证和提交
  Future<void> _validateAndSubmit() async {
    if (_validateAndSave()) {
      try {
        // todo 登陆账号

      } catch (e) {
        switch (e.code) {
          case EmailErrorCode.invalidEmail:
            DialogUtil.showAlertDialog(
                context,
                FsLocalizations.of(context).currentLocale.loginError,
                FsLocalizations.of(context).currentLocale.emailIllegal);
            break;
          case EmailErrorCode.userNotFound:
            DialogUtil.showAlertDialog(
                context,
                FsLocalizations.of(context).currentLocale.loginError,
                FsLocalizations.of(context).currentLocale.emailNotFound);
            break;
          case EmailErrorCode.wrongPassword:
            DialogUtil.showAlertDialog(
                context,
                FsLocalizations.of(context).currentLocale.loginError,
                FsLocalizations.of(context).currentLocale.passwordError);
            break;
          default:
            DialogUtil.showAlertDialog(
                context,
                FsLocalizations.of(context).currentLocale.loginError,
                FsLocalizations.of(context).currentLocale.unknownError);
            break;
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// 构建提交按钮
  /// 登录注册
  List<Widget> buildSubmitButtons() {
    AccountStyle style = ConfigFactory.accountStyle();
    return <Widget>[
      Padding(
        padding: EdgeInsets.only(top: style.loginButtonPaddingTop),
      ),
      RaisedButton(
        color: style.loginButtonColor,
        key: Key('signIn'),
        child: Text(FsLocalizations.of(context).currentLocale.login,
            style: TextStyle(
                fontSize: style.loginButtonFontSize,
                color: style.loginButtonFontColor)),
        onPressed: _validateAndSubmit,
      ),
      Padding(
        padding: EdgeInsets.only(top: style.authPaddingTop),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            onTap: () => DialogUtil.showAlertDialog(context, '一键登录',
                FsLocalizations.of(context).currentLocale.developing),
            child: Icon(
              FontAwesomeIcons.github,
              size: style.authButtonSize,
              color: style.authButtonColor,
            ),
          ),
        ],
      )
    ];
  }
}

class AccountStyle {
  // 登录按钮距离顶部的内距离
  double loginButtonPaddingTop = 10;

  // 登录按钮的背景色
  Color loginButtonColor = Colors.blue;

  // 登录按钮的文字大小
  double loginButtonFontSize = 20;

  // 登录按钮的文字颜色
  Color loginButtonFontColor = Colors.white;

  // 三方登录按钮距离顶部的内边距
  double authPaddingTop = 30;

  // 三方登录的按钮颜色
  Color authButtonColor = Colors.black;

  // 三方登录的按钮大小
  double authButtonSize = 40;
}

class EmailFieldValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "'邮箱不能为空'";
    } else if (value.contains(" ") || value.contains("　")) {
      return "邮箱中请不要包含半角或半角空格";
    }
    return null;
  }
}

class PasswordFieldValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "'密码不能为空'";
    } else if (value.contains(" ") || value.contains("　")) {
      return "密码请不要包含半角或半角空格";
    }

    return null;
  }
}

class EmailErrorCode {
  static const String invalidEmail = "ERROR_INVALID_EMAIL";
  static const String userNotFound = "ERROR_USER_NOT_FOUND";
  static const String wrongPassword = "ERROR_WRONG_PASSWORD";
}
