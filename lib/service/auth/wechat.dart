import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_study_app/config.dart';
import 'package:flutter_study_app/service/base_auth.dart';
import 'package:flutter_study_app/utils/TimeUtil.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

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

  login() {
    fluwx.authByQRCode(
        appId: AppConfig.weChatAppId,
        scope: "noncestr",
        nonceStr: "nonceStr",
        timeStamp: TimeUtil.nowOfMillsStr(),
        signature: "429eaaa13fd71efbc3fd344d0a9a9126835e7303");
  }
}
