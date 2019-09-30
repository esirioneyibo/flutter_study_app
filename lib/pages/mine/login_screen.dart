import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/return_bar.dart';
import 'package:flutter_study_app/config/app_config.dart';
import 'package:flutter_study_app/factory.dart';
import 'package:flutter_study_app/i18n/fs_localization.dart';
import 'package:flutter_study_app/service/http_service.dart';
import 'package:flutter_study_app/service/local_storage.dart';
import 'package:flutter_study_app/utils/index.dart';
import 'package:flutter_study_app/utils/index.dart';
import 'package:flutter_study_app/utils/index.dart';
import 'package:flutter_study_app/utils/tip_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController userController = new TextEditingController();
  final TextEditingController pwController = new TextEditingController();
  String username = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    checkUser();
  }

  @override
  void dispose() {
    super.dispose();
    userController.dispose();
    pwController.dispose();
  }

  checkUser() async {
    username = await LocalStorage.get(AppConfig.USERNAME);
    password = await LocalStorage.get(AppConfig.PASSWORD);
    userController.value = TextEditingValue(text: username ?? '');
    pwController.value = TextEditingValue(text: password ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        NavigatorUtil.back(context, details);
      },
      child: Scaffold(
        appBar: ReturnBar(FsLocalizations.getLocale(context).login),
        body: Container(
          // 弹出键盘不遮挡内容
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: buildInputs() + buildSubmitButtons(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 验证和保存
  bool _validateAndSave() {
    final FormState state = formKey.currentState;
    if (state.validate()) {
      state.save();
      return true;
    }
    return false;
  }

  // 构建输入框
  List<Widget> buildInputs() {
    return <Widget>[
      TextFormField(
        key: Key('email'),
        keyboardType: TextInputType.emailAddress,
        controller: userController,
        decoration: InputDecoration(
            labelText: FsLocalizations.getLocale(context).email),
        validator: EmailFieldValidator.validate,
        onSaved: (String value) {
          username = value;
          print(username);
        },
      ),
      TextFormField(
        key: Key('password'),
        controller: pwController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
            labelText: FsLocalizations.getLocale(context).password),
        validator: PasswordFieldValidator.validate,
        onSaved: (String value) {
          password = value;
          print(password);
        },
      )
    ];
  }

//   验证和提交
  Future<void> _validateAndSubmit() async {
    if (_validateAndSave()) {
      HttpService.login(username, password).then((data) {
        if (data.code == 200) {
          LocalStorage.save(AppConfig.PASSWORD, password);
          var resultData = HttpService.getUserInfo(username);
          if (AppConfig.debug) {
            print("user result " + resultData.result.toString());
            print(data.toString());
          }
//          store.dispatch(new UpdateUserAction(resultData.data));
        } else {
          switch (data.code) {
            case 401:
              TipUtil.showTip(
                  context, FsLocalizations.getLocale(context).networkError_401);
              break;
            case 403:
              TipUtil.showTip(
                  context, FsLocalizations.getLocale(context).networkError_403);
              break;
            case 404:
              TipUtil.showTip(
                  context, FsLocalizations.getLocale(context).networkError_404);
              break;
            default:
              TipUtil.showTip(
                  context, FsLocalizations.getLocale(context).unknownError);
              break;
          }
        }
      }, onError: (error) {
        print(error);
      });
    }
  }

  /// 构建提交按钮
  List<Widget> buildSubmitButtons() {
    AccountStyle style = ConfigFactory.accountStyle();
    return <Widget>[
      Padding(
        padding: EdgeInsets.only(top: style.loginButtonPaddingTop),
      ),
      RaisedButton(
          color: style.loginButtonColor,
          key: Key('signIn'),
          child: Text(FsLocalizations.getLocale(context).login,
              style: TextStyle(
                  fontSize: style.loginButtonFontSize,
                  color: style.loginButtonFontColor)),
          onPressed: () => _validateAndSubmit()),
      Padding(
        padding: EdgeInsets.only(top: style.authPaddingTop),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            onTap: () => DialogUtil.showAlertDialog(
                context, '一键登录', FsLocalizations.getLocale(context).developing),
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

class EmailFieldValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "'邮箱不能为空'";
    } else if (!CommonUtil.isEmail(value)) {
      return "您的邮箱格式不正确";
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
