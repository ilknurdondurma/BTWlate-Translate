import 'package:btwlate/screens/login.dart';
import 'package:btwlate/screens/translate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp( GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    if (user != null) {
      return MaterialApp(
        home: TranslatePage(
          name: user.displayName??user.email.toString(),
          photo: user.photoURL??"https://yt3.ggpht.com/ytc/AKedOLS5ajMs0W8nbRxMvKohv2vA1K7bjjhMjvvryNV9dg=s900-c-k-c0x00ffffff-no-rj",), // google ile giris yaplmişsa onceden
      );
    } else {
      return const MaterialApp(
        home: LoginPage(), // yapilmamişsa
      );
    }
  }
}
