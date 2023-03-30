import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

          return null;
}
}
