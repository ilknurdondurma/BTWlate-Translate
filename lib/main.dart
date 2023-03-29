import 'package:btwlate/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const GetMaterialApp(
    home: Translate(),
    debugShowCheckedModeBanner: false,
  ));
}

class Translate extends StatelessWidget {
  const Translate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const LoginPage();
  }
}
