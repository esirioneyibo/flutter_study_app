import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/service/base_auth.dart';

class EmailAuth implements BaseAuth {
  String email;
  String password;

  String _errorMessage;

  bool _isLoading;

  String username = 'Your Name';

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return result.user.uid;
  }

  Future<String> signUp(String email, String password) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return result.user.uid;
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }

  @override
  AccountType getAccountType() {
    return AccountType.EMAIL;
  }
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

enum FormType {
  LOGIN,
  REGISTER,
}

class EmailErrorCode {
  static const String invalidEmail = "ERROR_INVALID_EMAIL";
  static const String userNotFound = "ERROR_USER_NOT_FOUND";
  static const String wrongPassword = "ERROR_WRONG_PASSWORD";
}
