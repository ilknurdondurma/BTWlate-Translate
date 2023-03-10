import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/splash.dart';

void main() {
  runApp(const GetMaterialApp(home: translate()));
}
class translate extends StatelessWidget {
  const translate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return splashPage();
  }
}