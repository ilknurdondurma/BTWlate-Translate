import 'package:btwlate/auth/firebase_controller.dart';
import 'package:btwlate/screens/login.dart';
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
      FireBaseController.addUserController();
      return userCredential;

    }
    return null ;
}
  static void loginButtonGoogle() async {
    print("google ile giris");
    UserCredential? userCredential = await GoogleSign.signInWithGoogle();
    if (userCredential != null && userCredential.user != null) {
      Get.offAll(TranslatePage(name: userCredential.user?.displayName,));
    } else {
      print("Kullanıcı giriş yapmadı.");
    }
  }

  static Future<void> deleteGoogle() async {
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
      Get.offAll(const LoginPage());
    }
    GoogleSign.logOutGoogle();
    await auth.currentUser!.delete().then((value) async {
      // Hesap silme işlemi başarılı olduğunda yapılacaklar
      FireBaseController.deleteUserController();
      print("Hesap silme işlemi başarılı");
    }).catchError((error) {
      // Hesap silme işlemi başarısız olduğunda yapılacaklar
      print("Hesap silme işlemi başarısız: $error");
    });
  }

  static void logOutGoogle()async{
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut().then((value) => {
      print("logout basarili"),
      Get.offAll(const LoginPage())
    });

  }
}
