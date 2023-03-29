
import 'package:btwlate/ui/helper/ui_colors_helper.dart';
import 'package:flutter/material.dart';

class UITextStyles {
  static TextStyle splashStyle = const TextStyle(
      fontFamily: "DancingScript",
      color: UIColorsHelper.splashItemColor,
      fontSize: 45,
      fontWeight: FontWeight.w500);

  static TextStyle loginStyle = const TextStyle(
      color: UIColorsHelper.lightTextFontColor,
      fontSize: 25,
      fontWeight: FontWeight.w500);

  static TextStyle translatePageCompanentStyle = const TextStyle(
      color: UIColorsHelper.lightTextFontColor,
      fontSize: 30,
      );

  static TextStyle translatePageResponseTextStyle = const TextStyle(
    color: UIColorsHelper.lightListTileTextColor,
    fontSize: 16,
  );

  static TextStyle translatePageButtonStyle = const TextStyle(
    color: UIColorsHelper.translateButtonItemColor,
    fontSize: 20,
  );

  static TextStyle settingsPageStyle = const TextStyle(
    color: UIColorsHelper.lightListTileTextColor,
    fontSize: 18,
  );
  static TextStyle drawerHeaderTextStyle = const TextStyle(
    color: UIColorsHelper.lightDrawerHeaderTextColor,
    fontSize: 15,
  );

  static TextStyle drawerBodyTextStyle = const TextStyle(
    color: UIColorsHelper.lightDrawerBodyTextColor,
    fontSize: 15,
  );

  static TextStyle pagesHeaderStyle = const TextStyle(
    color: UIColorsHelper.lightTitleTextColor,
    fontSize: 25,
  );

}