import 'package:btwlate/auth/firebase/firebase_controller.dart';
import 'package:btwlate/screens/translate.dart';
import 'package:btwlate/ui/styles/myWidgets/my_spinkit_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../screens/login.dart';
import '../ui/helper/constants/ui_text_helper.dart';

class EmailSign{

  static Future<UserCredential?> signUpWithEmailAndPassword(String email, String password) async {
      try {
        UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        Get.offAll(TranslatePage(name: userCredential.user?.email ?? "undefined",photo: userCredential.user?.photoURL??"https://yt3.ggpht.com/ytc/AKedOLS5ajMs0W8nbRxMvKohv2vA1K7bjjhMjvvryNV9dg=s900-c-k-c0x00ffffff-no-rj",));
        FireBaseController.addUserController();
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          Fluttertoast.showToast(
              msg: 'The password provided is too weak.',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0
          );
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          Fluttertoast.showToast(
              msg: 'The account already exists for that email.',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0
          );
          try {
            await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: email,
              password: password,
            ).then((value) => { const MySpinkit()});
            // başarılı giriş
            Get.offAll(TranslatePage(name:FirebaseAuth.instance.currentUser?.email ??"undefined",photo: FirebaseAuth.instance.currentUser?.photoURL??"https://yt3.ggpht.com/ytc/AKedOLS5ajMs0W8nbRxMvKohv2vA1K7bjjhMjvvryNV9dg=s900-c-k-c0x00ffffff-no-rj",));
          } catch (error) {
            // hata durumunda kullanıcıya bildirim göster

          }
        }
        return null;
      } catch (e) {
        print(e);
        return null;
    }

  }
  static Future<void> logOutEmailAccount()async{
   final FirebaseAuth auth = FirebaseAuth.instance;
   await auth.signOut().then((value) => {
     print("email logout basarili"),
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
  static Future<void> deleteEmailAccount() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    if (auth.currentUser == null) {
      print('Kullanıcı oturum açmamış!');
      return;
    }
    else{
      print('Kullanıcı oturum acmıs!');

    }

    FireBaseController.deleteUserController();
    // Kullanıcıyı sil
    await auth.currentUser?.delete()
        .then((_) {
          const MySpinkit();
          Get.offAll(const LoginPage());
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

}