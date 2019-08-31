import 'dart:async';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/app_state.dart';
import 'package:flutter_study_app/components/return_bar.dart';
import 'package:flutter_study_app/service/auth/email.dart';
import 'package:flutter_study_app/service/auth/google.dart';
import 'package:flutter_study_app/service/auth/twitter.dart';
import 'package:flutter_study_app/service/auth/wechat.dart';
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

  FormType _formType = FormType.LOGIN;

//  GithubAuth githubAuth = GithubAuth();
  GoogleAuth googleAuth = GoogleAuth();
  TwitterAuth twitterAuth = TwitterAuth();
  EmailAuth emailAuth = EmailAuth();
  WechatAuth wechatAuth = WechatAuth();

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
      appBar: ReturnBar(''),
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
        decoration: InputDecoration(labelText: '邮箱'),
        validator: EmailFieldValidator.validate,
        onSaved: (String value) {
          emailAuth.email = value;
        },
      ),
      TextFormField(
        key: Key('password'),
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
        if (_formType == FormType.LOGIN) {
          userId = await emailAuth.signIn(emailAuth.email, emailAuth.password);
          if (userId != null) {
            isLogin = true;
            Navigator.of(context).pop();
          }
          print('Signed in: $userId');
        } else {
          userId = await emailAuth.signUp(emailAuth.email, emailAuth.password);
          emailAuth.sendEmailVerification();
          emailAuth.showVerifyEmailSentDialog(context, moveToLogin);
          print('注册');
        }
        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 &&
            userId != null &&
            _formType == FormType.LOGIN) {
//          emailAuth.onSignedIn();
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _errorMessage = '';
    _isLoading = false;
    _listWechat();
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
              onTap: twitterAuth.loginTwitter,
              child: Icon(
                FontAwesomeIcons.twitter,
                size: 30,
              ),
            ),
            InkWell(
              onTap: null,
              child: Icon(
                FontAwesomeIcons.github,
                size: 30,
              ),
            ),
            InkWell(
              onTap: wechatAuth.login(),
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
              onTap: () => googleAuth
                  .googleHandleSignIn()
                  .then((FirebaseUser user) => setState(() {
                        username = user.displayName;
                        print(username);
                      }))
                  .catchError((e) {
                print(e);
              }),
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
