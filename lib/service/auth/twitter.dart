import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_study_app/config.dart';
import 'package:flutter_study_app/service/base_auth.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';

class TwitterAuth extends BaseAuth {
  static final TwitterLogin twitterLogin = new TwitterLogin(
      consumerKey: AppConfig.twitterApiKey,
      consumerSecret: AppConfig.twitterApiSecret);

  void loginTwitter() async {
    final TwitterLoginResult result = await twitterLogin.authorize();
    String newMessage;

    switch (result.status) {
      case TwitterLoginStatus.loggedIn:
        newMessage = 'Logged in! username: ${result.session.username}';
        break;
      case TwitterLoginStatus.cancelledByUser:
        newMessage = 'Login cancelled by user.';
        break;
      case TwitterLoginStatus.error:
        newMessage = 'Login error: ${result.errorMessage}';
        break;
    }
  }

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
    return AccountType.TWITTER;
  }
}
