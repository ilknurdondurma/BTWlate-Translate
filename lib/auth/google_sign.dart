import 'package:btwlate/screens/favorites.dart';
import 'package:btwlate/screens/login.dart';
import 'package:btwlate/screens/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
            return userCredential;
          }

          return null ;
}

  static void asas() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    print("google");
    UserCredential? userCredential = await GoogleSign.signInWithGoogle();
    if (userCredential != null && userCredential.user != null) {
      Get.offAll(TranslatePage(name: userCredential.user?.displayName,));
    } else {
      print("Kullanıcı giriş yapmadı.");
      Get.to(SettingsPage());
    }
  }
}
