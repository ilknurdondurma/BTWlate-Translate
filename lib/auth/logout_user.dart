import 'package:btwlate/auth/email_sign.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../ui/helper/constants/ui_text_helper.dart';
import 'facebook_sign.dart';
import 'google_sign.dart';

class LogOutUser{

  static Future<void> logOutUser() async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    try{
      User? user = firebaseAuth.currentUser;
      if (user != null) {
        for (UserInfo userInfo in user.providerData) {
          if (userInfo.providerId == GoogleAuthProvider.PROVIDER_ID) {
            GoogleSign.logOutGoogleAccount();
            print("googleden cıkıs yapıldı");
          } else if (userInfo.providerId == FacebookAuthProvider.PROVIDER_ID) {
            await FacebookSign.logOutFacebook();
            print("facebooktan cıkıs yapıldı");
          } else if (userInfo.providerId == EmailAuthProvider.PROVIDER_ID) {
            await EmailSign.logOutEmailAccount();
            print("emailden cıkıs yapıldı");
          }
        }
        return;
      }
    }
    catch(e){
      print(" cıkıs hatası lu :$e");
      Fluttertoast.showToast(
          msg: UITextHelper.authFailedError,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0
      );

    }
  }
}