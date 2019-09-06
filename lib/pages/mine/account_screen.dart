import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_study_app/app_state.dart';
import 'package:flutter_study_app/components/return_bar.dart';
import 'package:flutter_study_app/i10n/localization_intl.dart';
import 'package:flutter_study_app/service/auth/email.dart';
import 'package:flutter_study_app/state/account_model.dart';
import 'package:flutter_study_app/utils/dialog_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';

/// login and register
class AccountScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>();

  final EmailAuth emailAuth = EmailAuth();

//  GoogleAuth googleAuth = GoogleAuth();
//  TwitterAuth twitterAuth = TwitterAuth();
//  WechatAuth wechatAuth = WechatAuth();
//  GithubAuth githubAuth = GithubAuth();

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
  void moveToRegister(AccountModel model) {
    formKey.currentState.reset();
    model.changeType(FormType.REGISTER);
  }

  /// 跳到登录页
  void moveToLogin(AccountModel model) {
    formKey.currentState.reset();
    model.changeType(FormType.LOGIN);
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: AccountModel(),
      child: ScopedModelDescendant(builder:
          (BuildContext context, _, AccountModel model) {
        return Scaffold(
          appBar: ReturnBar(model.formType == FormType.LOGIN
              ? MyLocalizations.of(context).login
              : MyLocalizations.of(context).register),
          body: Container(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.stretch,
                children: buildInputs(context) +
                    buildSubmitButtons(context, model),
              ),
            ),
          ),
        );
      }),
    );
  }

  List<Widget> buildInputs(BuildContext context) {
    return <Widget>[
      TextFormField(
        key: Key('email'),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: MyLocalizations.of(context).email),
        validator: EmailFieldValidator.validate,
        onSaved: (String value) {
          emailAuth.email = value;
        },
      ),
      TextFormField(
        key: Key('password'),
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
            labelText:
                MyLocalizations.of(context).password),
        validator: PasswordFieldValidator.validate,
        onSaved: (String value) {
          emailAuth.password = value;
        },
      )
    ];
  }

//   验证和提交
  Future<void> _validateAndSubmit(
      BuildContext context, AccountModel model) async {
    if (_validateAndSave()) {
      String userId = "";
      try {
        // 登陆账号
        if (model.formType == FormType.LOGIN) {
          userId = await emailAuth.signIn(
              emailAuth.email.trim(),
              emailAuth.password.trim());
          if (userId == null) {
            throw Exception({"code": "UNKOWN_ERROR"});
          }

          emailAuth.isEmailVerified().then((verified) {
            if (!verified) {
              DialogUtil.showAlertDialog(
                  context,
                  MyLocalizations.of(context).loginError,
                  MyLocalizations.of(context)
                      .validateEmailTitle);
            } else {
              Navigator.of(context).pop();
              emailAuth
                  .getCurrentUser()
                  .then((user) => currentUser = user);
            }
          });
        } else {
          // 注册账号
          if (userId.length > 0 &&
              userId != null &&
              model.formType == FormType.LOGIN) {
            userId = await emailAuth.signUp(
                emailAuth.email.trim(),
                emailAuth.password.trim());
            emailAuth.sendEmailVerification();
            emailAuth.setDefaultUserInfo();
            DialogUtil.showAlertDialog(
                context,
                MyLocalizations.of(context)
                    .validateEmailTitle,
                MyLocalizations.of(context)
                    .validateEmailContent,
                callback: moveToLogin,
                model: model);
          }
        }
        emailAuth
            .getCurrentUser()
            .then((user) => currentUser = user);
      } catch (e) {
        switch (e.code) {
          case EmailErrorCode.invalidEmail:
            DialogUtil.showAlertDialog(
                context,
                MyLocalizations.of(context).loginError,
                MyLocalizations.of(context).emailIllegal);
            break;
          case EmailErrorCode.userNotFound:
            DialogUtil.showAlertDialog(
                context,
                MyLocalizations.of(context).loginError,
                MyLocalizations.of(context).emailNotFound);
            break;
          case EmailErrorCode.wrongPassword:
            DialogUtil.showAlertDialog(
                context,
                MyLocalizations.of(context).loginError,
                MyLocalizations.of(context).passwordError);
            break;
          default:
            DialogUtil.showAlertDialog(
                context,
                MyLocalizations.of(context).loginError,
                MyLocalizations.of(context).unknownError);
            break;
        }
      }
    }
  }

//  _listWechat() {
//    fluwx.onAuthByQRCodeFinished.listen((data) {
//    });
//    fluwx.onAuthGotQRCode.listen((image) {
//      setState(() {
//        Navigator.pop(context);
//      });
//    });
//
//    fluwx.onQRCodeScanned.listen((scanned) {
//      setState(() {
//      });
//    });
//  }

  /// 构建提交按钮
  /// 登录注册
  List<Widget> buildSubmitButtons(
      BuildContext context, AccountModel model) {
    if (model.formType == FormType.LOGIN) {
      var pressed = () {
        formKey.currentState.reset();
        model.changeType(FormType.REGISTER);
      };
      return <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10),
        ),
        RaisedButton(
          key: Key('moveToRegister'),
          color: Theme.of(context).primaryColor,
          child: Text(MyLocalizations.of(context).login,
              style: TextStyle(
                  fontSize: 20.0, color: Colors.white)),
          onPressed: () =>
              _validateAndSubmit(context, model),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InkWell(
//              onTap: twitterAuth.loginTwitter,
              onTap: () => DialogUtil.showAlertDialog(
                  context,
                  'twitter',
                  MyLocalizations.of(context).developing),
              child: Icon(
                FontAwesomeIcons.twitter,
                size: 30,
              ),
            ),
            InkWell(
              onTap: () => DialogUtil.showAlertDialog(
                  context,
                  'github',
                  MyLocalizations.of(context).developing),
              child: Icon(
                FontAwesomeIcons.github,
                size: 30,
              ),
            ),
            InkWell(
              onTap: () => DialogUtil.showAlertDialog(
                  context,
                  'wechat',
                  MyLocalizations.of(context).developing),
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
              onTap: () => DialogUtil.showAlertDialog(
                  context,
                  'google',
                  MyLocalizations.of(context).developing),
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
          key: Key('SignUp'),
          child: Text(
              MyLocalizations.of(context).moveToRegister,
              style: TextStyle(fontSize: 20.0)),
          onPressed: pressed,
        ),
      ];
    } else {
      return <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10),
        ),
        RaisedButton(
          key: Key('Register'),
          color: Theme.of(context).primaryColor,
          child: Text(MyLocalizations.of(context).register,
              style: TextStyle(
                  fontSize: 20.0, color: Colors.white)),
          onPressed: () =>
              _validateAndSubmit(context, model),
        ),
        Padding(
          padding: EdgeInsets.only(top: 0),
        ),
        FlatButton(
          key: Key('moveToLogin'),
          child: Text(
              MyLocalizations.of(context).moveToLogin,
              style: TextStyle(fontSize: 20.0)),
          onPressed: () => moveToLogin(model),
        ),
      ];
    }
  }
}
