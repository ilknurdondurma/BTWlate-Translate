import 'package:btwlate/screens/login.dart';
import 'package:btwlate/screens/splash.dart';
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
    home: MyApp(),
    debugShowCheckedModeBanner: false,
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
        home: SplashPage());
    } else {
      return const MaterialApp(
        home: LoginPage(), // yapilmamişsa
      );
    }
  }
}
