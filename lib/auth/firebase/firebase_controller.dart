import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../ui/helper/ui_text_helper.dart';

class FireBaseController{
  static void addUserController ()async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final docRef = firestore.collection('users').doc(currentUser.email);
      await docRef.set({})
          .then((value) => print('kullanici firebase e başarıyla eklendi.')).catchError(
              (error) => print('kullanici firebase e  eklenirken hata oluştu: $error'));
    } else {
      print('Kullanıcı oturumu açmamış.');
    }
    return null;
  }
  static Future<void> deleteUserController() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final docRef = firestore.collection('users').doc(auth.currentUser?.email);

    try {
      await docRef.delete();
      print("Silme başarılı");
    } catch (e) {
      print("Silme hatası: $e");
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
  static void addFavoriteController(String textKey, String textValue) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser?.email;

    FirebaseFirestore.instance
        .collection("users")
        .doc(user)
        .update({textKey: textValue})
        .then((value) => {
      Fluttertoast.showToast(
          msg: UITextHelper.likeText,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0)
    });
  }
  static void deleteFavoriteController(field) {
    final FirebaseAuth auth = FirebaseAuth.instance;
     FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser?.email)
        .update({field.split('   :   ')[0]: FieldValue.delete()});
  }

}


// class FireBaseController{
//   static final box = GetStorage();
//   @override
//   static void addFavoriteController(String textKey, String textValue) {
//     print("favoriteController cagrıldı");
//     List<dynamic> favorites = box.read('favorites') ?? [];
//     favorites.add({"kelime": textKey, "anlami": textValue});
//     box.write('favorites', favorites);
//     Fluttertoast.showToast(
//       //     //
//         msg: UITextHelper.likeText,
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         backgroundColor: Colors.grey,
//         textColor: Colors.white,
//         fontSize: 16.0);
//   }
//
//   static List<dynamic> get favoritesList =>
//       (box.read<List<dynamic>>('favorites') ?? []);
// }