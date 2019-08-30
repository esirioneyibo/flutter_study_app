import 'package:flutter/material.dart';
import 'package:flutter_study_app/app_state.dart';
import 'package:flutter_study_app/components/return_bar.dart';
import 'package:flutter_study_app/config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum FormType {
  LOGIN,
  REGISTER,
}

class EmailFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? '邮箱不能为空' : null;
  }
}

class PasswordFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? '密码不能为空' : null;
  }
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

  String _email;
  String _password;
  FormType _formType = FormType.LOGIN;

  /// 验证和保存
  bool validateAndSave() {
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
    setState(() {
      _formType = FormType.REGISTER;
    });
  }

  /// 跳到登录页
  void moveToLogin() {
    formKey.currentState.reset();
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
          _email = value;
        },
      ),
      TextFormField(
        key: Key('password'),
        decoration: InputDecoration(labelText: '密码'),
        validator: PasswordFieldValidator.validate,
        onSaved: (String value) {
          _password = value;
        },
      )
    ];
  }

  /// 验证和提交
  Future<void> validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formType == FormType.LOGIN) {
          print('登录');
        } else {
          print('注册');
        }
      } catch (e) {
        print('Error: $e');
      }
    }
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
          onPressed: () {
            debugPrint('login');
            isLogin = true;
            Navigator.pushNamed(context, RouterConfig.home);
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: 30),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              FontAwesomeIcons.twitter,
              size: 30,
            ),
            Icon(
              FontAwesomeIcons.github,
              size: 30,
            ),
            Icon(
              FontAwesomeIcons.weixin,
              size: 30,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 30),
        ),
        FlatButton(
          child: Text('创建一个账号',
              style: TextStyle(fontSize: 20.0)),
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
          child: Text('创建一个账号', style: TextStyle(fontSize: 20.0,color: Colors.white)),
          onPressed: () {
            debugPrint('login');
          },
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
