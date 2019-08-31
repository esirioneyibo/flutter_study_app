import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_study_app/app_state.dart';
import 'package:flutter_study_app/components/return_bar.dart';
import 'package:flutter_study_app/service/auth/email.dart';
import 'package:flutter_study_app/utils/dialog_util.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// login and register
class AccountScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AccountScreenState();
  }
}

class _AccountScreenState extends State<AccountScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  EmailAuth emailAuth = EmailAuth();

//  GoogleAuth googleAuth = GoogleAuth();
//  TwitterAuth twitterAuth = TwitterAuth();
//  WechatAuth wechatAuth = WechatAuth();
//  GithubAuth githubAuth = GithubAuth();

  FormType _formType = FormType.LOGIN;

  String _errorMessage;
  String _status = "status";
  Uint8List _image;
  bool _isLoading;

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

  /// 跳到注册页
  void moveToRegister() {
    formKey.currentState.reset();
    _errorMessage = '';
    setState(() {
      _formType = FormType.REGISTER;
    });
  }

  /// 跳到登录页
  void moveToLogin() {
    formKey.currentState.reset();
    _errorMessage = '';
    setState(() {
      _formType = FormType.LOGIN;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReturnBar(_formType == FormType.LOGIN ? "登陆" : "注册"),
      body: Container(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buildInputs() + buildSubmitButtons(),
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
        decoration: InputDecoration(labelText: '邮箱'),
        validator: EmailFieldValidator.validate,
        onSaved: (String value) {
          emailAuth.email = value;
        },
      ),
      TextFormField(
        key: Key('password'),
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(labelText: '密码'),
        validator: PasswordFieldValidator.validate,
        onSaved: (String value) {
          emailAuth.password = value;
        },
      )
    ];
  }

//   验证和提交
  Future<void> _validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (_validateAndSave()) {
      String userId = "";
      try {
        // 登陆账号
        if (_formType == FormType.LOGIN) {
          userId = await emailAuth.signIn(
              emailAuth.email.trim(), emailAuth.password.trim());
          if (userId == null) {
            throw Exception({"code": "UNKOWN_ERROR"});
          }

          emailAuth.isEmailVerified().then((verified) {
            if (!verified) {
              DialogUtil.showAlertDialog(context, "登陆失败", "您的邮箱尚未验证");
            } else {
              Navigator.of(context).pop();
              emailAuth.getCurrentUser().then((user) => currentUser = user);
            }
          });
        } else {
          // 注册账号
          if (userId.length > 0 &&
              userId != null &&
              _formType == FormType.LOGIN) {
            userId = await emailAuth.signUp(
                emailAuth.email.trim(), emailAuth.password.trim());
            emailAuth.sendEmailVerification();
            emailAuth.setDefaultUserInfo();
            DialogUtil.showAlertDialog(
                context, "验证您的邮箱", "请到您的邮箱查看并激活账号", moveToLogin);
          }
          setState(() {
            _isLoading = false;
          });
        }
        emailAuth.getCurrentUser().then((user) => currentUser = user);
      } catch (e) {
        switch (e.code) {
          case EmailErrorCode.invalidEmail:
            DialogUtil.showAlertDialog(context, "登陆失败", "邮箱地址格式错误");
            break;
          case EmailErrorCode.userNotFound:
            DialogUtil.showAlertDialog(context, "登陆失败", "找不到账号，请先注册");
            break;
          case EmailErrorCode.wrongPassword:
            DialogUtil.showAlertDialog(context, "登陆失败", "密码错误，请检查后再试");
            break;
          default:
            DialogUtil.showAlertDialog(context, "登陆失败", "未知错误");
            break;
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _errorMessage = '';
    _isLoading = false;
//    _listWechat();
  }

  @override
  void dispose() {
    super.dispose();
    fluwx.dispose();
  }

  _listWechat() {
    fluwx.onAuthByQRCodeFinished.listen((data) {
      setState(() {
        _status = "errorCode=>${data.errorCode}\nauthCode=>${data.authCode}";
      });
    });
    fluwx.onAuthGotQRCode.listen((image) {
      setState(() {
        _image = image;
        Navigator.pop(context);
      });
    });

    fluwx.onQRCodeScanned.listen((scanned) {
      setState(() {
        _status = "scanned";
      });
    });
  }

  /// 构建提交按钮
  /// 登录注册
  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.LOGIN) {
      return <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10),
        ),
        RaisedButton(
          color: Colors.blue,
          key: Key('signIn'),
          child:
              Text('登录', style: TextStyle(fontSize: 20.0, color: Colors.white)),
          onPressed: _validateAndSubmit,
        ),
        Padding(
          padding: EdgeInsets.only(top: 30),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InkWell(
//              onTap: twitterAuth.loginTwitter,
              onTap: () =>
                  DialogUtil.showAlertDialog(context, 'twitter', '功能开发中'),
              child: Icon(
                FontAwesomeIcons.twitter,
                size: 30,
              ),
            ),
            InkWell(
              onTap: () =>
                  DialogUtil.showAlertDialog(context, 'github', '功能开发中'),
              child: Icon(
                FontAwesomeIcons.github,
                size: 30,
              ),
            ),
            InkWell(
              onTap: () =>
                  DialogUtil.showAlertDialog(context, 'wechat', '功能开发中'),
//              onTap: wechatAuth.login(),
              child: Icon(
                FontAwesomeIcons.weixin,
                size: 30,
              ),
            ),
            InkWell(
              child: Icon(
                FontAwesomeIcons.google,
                size: 30,
              ),
              onTap: () =>
                  DialogUtil.showAlertDialog(context, 'google', '功能开发中'),
//              onTap: () => googleAuth
//                  .googleHandleSignIn()
//                  .then((FirebaseUser user) => setState(() {
//                        username = user.displayName;
//                        print(username);
//                      }))
//                  .catchError((e) {
//                print(e);
//              }),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 30),
        ),
        FlatButton(
          child: Text('创建一个账号', style: TextStyle(fontSize: 20.0)),
          onPressed: moveToRegister,
        ),
      ];
    } else {
      return <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10),
        ),
        RaisedButton(
          color: Colors.blue,
          child: Text('创建一个账号',
              style: TextStyle(fontSize: 20.0, color: Colors.white)),
          onPressed: _validateAndSubmit,
        ),
        Padding(
          padding: EdgeInsets.only(top: 0),
        ),
        FlatButton(
          child: Text('己有账号?去登录', style: TextStyle(fontSize: 20.0)),
          onPressed: moveToLogin,
        ),
      ];
    }
  }
}
