import 'package:btwlate/ui/helper/uiColorsHelper.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: UIColorsHelper.light_Header_Background,
     buttonColor: UIColorsHelper.light_TranslateButton,
      backgroundColor: UIColorsHelper.light_Background

    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: UIColorsHelper.dark_Header_Background,
        buttonColor: UIColorsHelper.dark_TranslateButton,
        backgroundColor: UIColorsHelper.dark_Background

    );
  }
}