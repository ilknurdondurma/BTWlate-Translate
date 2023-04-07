import 'package:btwlate/screens/login.dart';
import 'package:btwlate/screens/translate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

import 'firebase/firebase_controller.dart';

class FacebookSign {
  static Future<UserCredential?> signUpWithFacebook() async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final FacebookAuth facebookAuth = FacebookAuth.instance;
    try {
      final LoginResult result = await facebookAuth.login();

      if (result.status == LoginStatus.success) {
        final accessToken = result.accessToken!.token;

        final facebookAuthCredential =
        FacebookAuthProvider.credential(accessToken);

        final UserCredential userCredential =
        await firebaseAuth.signInWithCredential(facebookAuthCredential);

        final User? user = userCredential.user;

        if (user != null) {
          Get.offAll(TranslatePage(name: firebaseAuth.currentUser?.displayName,photo: firebaseAuth.currentUser?.photoURL,));
          FireBaseController.addUserController();

          return userCredential;
        } else {
          print('Error during Facebook sign up');
          return null;
        }
      } else if (result.status == LoginStatus.cancelled) {
        print('User cancelled login process');
        return null;
      } else {
        print('Facebook login failed');
        return null;
      }
    } catch (e) {
      print('Error during Facebook sign up: $e');
      return null;
    }
  }

  static Future<void> deleteFacebookAccount() async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    User? user = firebaseAuth.currentUser;
    bool isFacebookUser = user?.providerData.any((userInfo) {
      return userInfo.providerId == 'facebook.com';
    }) ?? false;

    if (isFacebookUser) {
      try {
        final AccessToken? accessToken = await FacebookAuth.instance.accessToken;
        final facebookAuthCredential =
        FacebookAuthProvider.credential(accessToken!.token);
        await user!.reauthenticateWithCredential(facebookAuthCredential);
        await FireBaseController.deleteUserController();
        await user.delete();
        await Get.offAll(const LoginPage());

        print('Facebook account has been deleted successfully');
      } catch (e) {
        print('Error deleting Facebook account: $e');
      }
    } else {
      print('User is not signed in with Facebook');
    }
}
  static Future<void> logOutFacebook() async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    User? user = firebaseAuth.currentUser;
    bool isFacebookUser = user?.providerData.any((userInfo) {
      return userInfo.providerId == 'facebook.com';
    }) ?? false;

    if (isFacebookUser) {
      try {
        final AccessToken? accessToken = await FacebookAuth.instance.accessToken;
        final facebookAuthCredential =
        FacebookAuthProvider.credential(accessToken!.token);
        await user!.reauthenticateWithCredential(facebookAuthCredential);
        await FirebaseAuth.instance.signOut();
        await Get.offAll(const LoginPage());
        print('Facebook account has been logout successfully');
      } catch (e) {
        print('Error deleting Facebook account: $e');
      }
    } else {
      print('User is not signed in with Facebook');
    }
  }
}