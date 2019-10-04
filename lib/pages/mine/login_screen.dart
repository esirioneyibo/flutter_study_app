import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_study_app/config/app_config.dart';
import 'package:flutter_study_app/factory.dart';
import 'package:flutter_study_app/i18n/fs_localization.dart';
import 'package:flutter_study_app/service/http_service.dart';
import 'package:flutter_study_app/service/local_storage.dart';
import 'package:flutter_study_app/utils/index.dart';
import 'package:flutter_study_app/utils/tip_util.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AccountStyle style = ConfigFactory.accountStyle();

  TextEditingController userController;
  TextEditingController pwController;

  String username = '';
  String password = '';

  FocusNode usernameFocusNode;
  FocusNode passwordFocusNode;

  @override
  void initState() {
    super.initState();
    userController = TextEditingController();
    pwController = TextEditingController();
    checkUser();
  }

  @override
  void dispose() {
    super.dispose();
    userController.dispose();
    pwController.dispose();
    usernameFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    usernameFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        NavigatorUtil.back(context, details);
      },
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).primaryColor, BlendMode.screen),
                  image: AssetImage(Constant.loginBg),
                  fit: BoxFit.cover)),
          padding: EdgeInsets.all(50),
          child: Form(
            key: formKey,
            // 弹出键盘不遮挡内容
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: buildTitle() +
                    buildInputs() +
                    buildSubmitButtons() +
                    buildBottom(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  checkUser() async {
    username = await LocalStorage.get(Constant.USERNAME);
    password = await LocalStorage.get(Constant.PASSWORD);
    userController.value = TextEditingValue(text: username ?? '');
    pwController.value = TextEditingValue(text: password ?? '');
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

  //   验证和提交
  Future<void> _validateAndSubmit() async {
    if (_validateAndSave()) {
      HttpService.login(username, password).then((data) {
        if (data.code == 200) {
          LocalStorage.save(Constant.PASSWORD, password);
          var resultData = HttpService.getUserInfo(username);
          if (Constant.debug) {
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

  /// 标题
  List<Widget> buildTitle() {
    return <Widget>[
      Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(
            FsLocalizations.getLocale(context).login,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
      )
    ];
  }

  // 构建输入框
  List<Widget> buildInputs() {
    return <Widget>[
      TextFormField(
        key: Key('email'),
        keyboardType: TextInputType.emailAddress,
        controller: userController,
        focusNode: usernameFocusNode,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.person),
            suffixIcon: Visibility(
              visible: usernameFocusNode.hasFocus,
              child: InkWell(
                  onTap: () {
                    userController.clear();
                  },
                  child: Icon(Icons.backspace)),
            ),
            contentPadding: EdgeInsets.all(10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            labelText: FsLocalizations.getLocale(context).email),
        validator: EmailFieldValidator.validate,
        onSaved: (String value) {
          username = value;
        },
      ),
      SizedBox(
        height: 30,
      ),
      TextFormField(
        key: Key('password'),
        controller: pwController,
        focusNode: passwordFocusNode,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock),
            suffixIcon: Visibility(
              visible: passwordFocusNode.hasFocus,
              child: InkWell(
                  onTap: () {
                    pwController.clear();
                  },
                  child: Icon(Icons.backspace)),
            ),
            contentPadding: EdgeInsets.all(10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            labelText: FsLocalizations.getLocale(context).password),
        validator: PasswordFieldValidator.validate,
        onSaved: (String value) {
          password = value;
        },
      ),
      SizedBox(
        height: 20,
      ),
    ];
  }

  /// 构建提交按钮
  List<Widget> buildSubmitButtons() {
    return <Widget>[
      Padding(
        padding: EdgeInsets.only(top: style.loginButtonPaddingTop),
      ),
      RaisedButton(
          padding: EdgeInsets.all(5),
          color: Theme.of(context).primaryColor,
          key: Key('signIn'),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Text(FsLocalizations.getLocale(context).login,
              style: TextStyle(
                  fontSize: style.loginButtonFontSize,
                  color: style.loginButtonFontColor)),
          onPressed: () => _validateAndSubmit()),
    ];
  }

  List<Widget> buildBottom() {
    return <Widget>[
      Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Text(
          '请输入您的github账号登录',
          style: TextStyle(color: Colors.white60, fontSize: 15),
        ),
      ),
      Container(
        alignment: Alignment.bottomCenter,
        child: Text(
          '右滑退出登录界面',
          style: TextStyle(color: Colors.white60, fontSize: 12),
        ),
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
