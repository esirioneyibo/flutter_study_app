import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_study_app/service/base_auth.dart';

class WechatAuth extends BaseAuth {
  @override
  Future<FirebaseUser> getCurrentUser() {
    return null;
  }

  @override
  Future<void> signOut() {
    return null;
  }

  @override
  AccountType getAccountType() {
    return AccountType.WECHAT;
  }
}
