
import 'package:btwlate/ui/helper/uiColorsHelper.dart';
import 'package:flutter/material.dart';

class UITextStyles {
  static TextStyle splashStyle = const TextStyle(
      fontFamily: "DancingScript",
      color: UIColorsHelper.splashItemColor,
      fontSize: 45,
      fontWeight: FontWeight.w500);

  static TextStyle loginStyle = const TextStyle(
      fontFamily: "DancingScript",
      color: UIColorsHelper.light_TextFont_Color,
      fontSize: 20,
      fontWeight: FontWeight.w500);

  static TextStyle translatePageCompanentStyle = const TextStyle(
      color: UIColorsHelper.light_TextFont_Color,
      fontSize: 30,
      );

  static TextStyle translatePageButtonStyle = const TextStyle(
    color: UIColorsHelper.translateButtonItemColor,
    fontSize: 20,
  );
  static TextStyle errorTextStyle = const TextStyle(
    color: UIColorsHelper.errorColor,
    fontSize: 20,
  );


}