import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String> signIn(String email, String password) {
    return null;
  }

  AccountType getAccountType();

  Future<String> signUp(String email, String password) {
    return null;
  }

  Future<FirebaseUser> getCurrentUser();

  Future<void> sendEmailVerification() {
    return null;
  }

  Future<void> signOut();

  Future<bool> isEmailVerified() {
    return null;
  }
}

enum AccountType { GOOGLE, TWITTER, GITHUB, WECHAT, EMAIL }
