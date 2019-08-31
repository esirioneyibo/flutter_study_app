import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
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

  void setDefaultUserInfo() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    UserUpdateInfo updateInfo = new UserUpdateInfo();
    updateInfo.displayName = user.email;
    updateInfo.photoUrl = "https://image.xiaomo.info/logo/avatar.png";
    user.updateProfile(updateInfo);
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

enum FormType {
  LOGIN,
  REGISTER,
}

class EmailErrorCode {
  static const String invalidEmail = "ERROR_INVALID_EMAIL";
  static const String userNotFound = "ERROR_USER_NOT_FOUND";
  static const String wrongPassword = "ERROR_WRONG_PASSWORD";
}
