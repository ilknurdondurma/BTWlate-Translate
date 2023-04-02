import 'package:btwlate/auth/facebook_sign.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../ui/helper/ui_text_helper.dart';
import 'google_sign.dart';

class DeleteAccount{
  static Future<void> deleteUser() async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    try{
      User? user = firebaseAuth.currentUser;
      if (user != null) {
        for (UserInfo userInfo in user.providerData) {
          if (userInfo.providerId == GoogleAuthProvider.PROVIDER_ID) {
            await GoogleSign.deleteGoogleAccount();
          } else if (userInfo.providerId == FacebookAuthProvider.PROVIDER_ID) {
            await FacebookSign.deleteFacebookAccount();
          } else if (userInfo.providerId == EmailAuthProvider.PROVIDER_ID) {
            await FacebookSign.deleteFacebookAccount();
          }
        }
        return;
      }
    }
    catch(e){
      print(" silme hatası du :$e");
      Fluttertoast.showToast(
          msg: UITextHelper.deleteFailedError,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }
}
