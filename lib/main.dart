import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/splash.dart';

void main() {
  runApp(const GetMaterialApp(
    home: Translate(),
    debugShowCheckedModeBanner: false,
  ));
}

class Translate extends StatelessWidget {
  const Translate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SplashPage();
  }
}
