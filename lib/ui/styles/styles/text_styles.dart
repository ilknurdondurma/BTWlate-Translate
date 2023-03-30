
import 'package:btwlate/ui/helper/ui_colors_helper.dart';
import 'package:flutter/material.dart';

class UITextStyles {
  // splash page
  static TextStyle splashStyle = const TextStyle(
      fontFamily: "DancingScript",
      color: UIColorsHelper.splashItemColor,
      fontSize: 45,
      fontWeight: FontWeight.w500);

  //login page
  static TextStyle loginPageTermsStyle = const TextStyle(
      color: UIColorsHelper.lightTextFontColor,
      decoration: TextDecoration.underline,
      fontSize: 10,);
  static TextStyle loginPageStyle = const TextStyle(
    color: UIColorsHelper.lightTextFontColor,
    decoration: TextDecoration.underline,
    fontSize: 17,);

  static TextStyle loginButtonsStyle = const TextStyle(
      color: UIColorsHelper.lightLoginPageButtonsIconColor,
      fontSize: 17,);

  //translate page
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
  //settings page
  static TextStyle settingsPageStyle = const TextStyle(
    color: UIColorsHelper.lightListTileTextColor,
    fontSize: 18,
  );

    //drawer widget
  static TextStyle drawerHeaderTextStyle = const TextStyle(
    color: UIColorsHelper.lightDrawerHeaderTextColor,
    fontSize: 15,
  );

  static TextStyle drawerBodyTextStyle = const TextStyle(
    color: UIColorsHelper.lightDrawerBodyTextColor,
    fontSize: 15,
  );

  // genel widget
  static TextStyle pagesHeaderStyle = const TextStyle(
    color: UIColorsHelper.lightTitleTextColor,
    fontSize: 25,
  );

}