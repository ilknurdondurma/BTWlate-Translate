import 'package:btwlate/auth/firebase/firebase_controller.dart';
import 'package:btwlate/screens/login.dart';
import 'package:btwlate/ui/helper/constants/ui_text_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../screens/translate.dart';

class GoogleSign {
  static Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      FireBaseController.addUserController();
      return userCredential;

    }
    return null ;
}
  static void logInWithGoogle() async {
    print("google ile giris");
    UserCredential? userCredential = await GoogleSign.signInWithGoogle();
    if (userCredential != null && userCredential.user != null) {
      Get.offAll(TranslatePage(name: userCredential.user?.displayName??"undefined",photo: userCredential.user?.photoURL??"https://yt3.ggpht.com/ytc/AKedOLS5ajMs0W8nbRxMvKohv2vA1K7bjjhMjvvryNV9dg=s900-c-k-c0x00ffffff-no-rj",));
    } else {
      print("Kullanıcı giriş yapmadı.");
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

  static Future<void> deleteGoogleAccount() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = googleSignIn.currentUser;


    try{
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await auth.currentUser!.reauthenticateWithCredential(credential);
    }
    catch(e){
      print("kullanici yok $e");
    }
    GoogleSign.logOutGoogleAccount();
    FireBaseController.deleteUserController();
    await auth.currentUser!.delete().then((value){
      print("Hesap silme işlemi başarılı");
    }).catchError((error) {
      print("Hesap silme işlemi başarısız: $error");
      Fluttertoast.showToast(
          msg: UITextHelper.deleteFailedError,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0
      );

    });
  }

  static void logOutGoogleAccount()async{
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut().then((value) => {
      print("google logout basarili"),
      Get.offAll(const LoginPage())
    }).catchError((onError){
      print("logout basarısız");
      Fluttertoast.showToast(
          msg: UITextHelper.authFailedError,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0
      );
    });

  }
}
