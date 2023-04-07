
import 'package:btwlate/ui/helper/constants/ui_colors_helper.dart';
import 'package:flutter/material.dart';

class UITextStyles {
  // splash page
  static TextStyle splashStyle =  TextStyle(
      fontFamily: "DancingScript",
      color: UIColorsHelper.splashItemColor,
      fontSize: 45,
      fontWeight: FontWeight.w500);

  //login page
  static TextStyle loginPageTermsStyle =  TextStyle(
      color: UIColorsHelper.genelTextFontColor,
      decoration: TextDecoration.underline,
      fontSize: 10,);
  static TextStyle loginPageStyle =  TextStyle(
    color: UIColorsHelper.genelTextFontColor,
    decoration: TextDecoration.underline,
    fontSize: 17,);

  static TextStyle loginButtonsStyle =  TextStyle(
      color: UIColorsHelper.signUpButtonsItemsColor,
      fontSize: 15,);

  //translate page
  static TextStyle translatePageCompanentStyle =  TextStyle(
      color: UIColorsHelper.genelTextFontColor,
      fontSize: 25,
      );

  static TextStyle translatePageResponseTextStyle =  TextStyle(
    color: UIColorsHelper.listTileTextColor,
    fontSize: 16,
  );

  static TextStyle translatePageButtonStyle =  TextStyle(
    color: UIColorsHelper.circleButtonItemColor,
    fontSize: 15,
  );
  //settings page
  static TextStyle settingsPageStyle =  TextStyle(
    color: UIColorsHelper.listTileTextColor,
    fontSize: 18,
  );

    //drawer widget
  static TextStyle drawerHeaderTextStyle =  TextStyle(
    color: UIColorsHelper.drawerHeaderTextColor,
    fontSize: 15,
  );

  static TextStyle drawerBodyTextStyle =  TextStyle(
    color: UIColorsHelper.drawerBodyTextColor,
    fontSize: 15,
  );

  // genel widget
  static TextStyle pagesHeaderStyle =  TextStyle(
    color: UIColorsHelper.pagesTitleTextColor,
    fontSize: 20,
  );

}