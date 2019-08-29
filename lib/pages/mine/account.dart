import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/app_state.dart';
import 'package:flutter_study_app/components/my_app_bar.dart';
import 'package:flutter_study_app/config.dart';

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

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String _email;
  String _password;
  FormType _formType;

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
      appBar: MyAppBar(context, '登录', AppBarHeight),
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
        final BaseAuth auth = AuthProvider.of(context).auth;
        if (_formType == FormType.LOGIN) {
          final String userId =
              await auth.signInWithEmailAndPassword(_email, _password);
          print('登录: $userId');
        } else {
          final String userId =
              await auth.createUserWithEmailAndPassword(_email, _password);
          print('注册: $userId');
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
        RaisedButton(
          key: Key('signIn'),
          child: Text('登录', style: TextStyle(fontSize: 20.0)),
          onPressed: () {
            debugPrint('login');
            isLogin = true;
            Navigator.pushNamed(context, Router.home);
          },
        ),
        FlatButton(
          child: Text('创建一个账号', style: TextStyle(fontSize: 20.0)),
          onPressed: moveToRegister,
        ),
      ];
    } else {
      return <Widget>[
        RaisedButton(
          child: Text('创建一个账号', style: TextStyle(fontSize: 20.0)),
          onPressed: () {
            debugPrint('login');
          },
        ),
        FlatButton(
          child: Text('己有账号?去登录', style: TextStyle(fontSize: 20.0)),
          onPressed: moveToLogin,
        ),
      ];
    }
  }
}

class AuthProvider extends InheritedWidget {
  const AuthProvider({Key key, Widget child, this.auth})
      : super(key: key, child: child);
  final BaseAuth auth;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static AuthProvider of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AuthProvider);
  }
}

abstract class BaseAuth {
  Future<String> signInWithEmailAndPassword(String email, String password);

  Future<String> createUserWithEmailAndPassword(String email, String password);

  Future<String> currentUser();

  Future<void> signOut();
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    final AuthResult authResult = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    return authResult.user?.uid;
  }

  @override
  Future<String> createUserWithEmailAndPassword(
      String email, String password) async {
    final AuthResult authResult = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return authResult.user?.uid;
  }

  @override
  Future<String> currentUser() async {
    final FirebaseUser user = await _firebaseAuth.currentUser();
    return user?.uid;
  }

  @override
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}
