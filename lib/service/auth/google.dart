import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_study_app/service/base_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth extends BaseAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<FirebaseUser> googleHandleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final AuthResult result = await _auth.signInWithCredential(credential);
    return result.user;
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
    return AccountType.GOOGLE;
  }
}
