
import 'package:btwlate/ui/helper/uiColorsHelper.dart';
import 'package:flutter/material.dart';

class UITextStyles {
  static TextStyle splashStyle = const TextStyle(
      fontFamily: "DancingScript",
      color: UIColorsHelper.splashItemColor,
      fontSize: 45,
      fontWeight: FontWeight.w500);

  static TextStyle loginStyle = const TextStyle(
      color: UIColorsHelper.light_TextFont_Color,
      fontSize: 25,
      fontWeight: FontWeight.w500);

  static TextStyle translatePageCompanentStyle = const TextStyle(
      color: UIColorsHelper.light_TextFont_Color,
      fontSize: 30,
      );

  static TextStyle translatePageResponseTextStyle = const TextStyle(
    color: UIColorsHelper.light_ListTile_text_color,
    fontSize: 16,
  );

  static TextStyle translatePageButtonStyle = const TextStyle(
    color: UIColorsHelper.translateButtonItemColor,
    fontSize: 20,
  );

  static TextStyle settingsPageStyle = const TextStyle(
    color: UIColorsHelper.light_ListTile_text_color,
    fontSize: 18,
  );
  static TextStyle drawerHeaderTextStyle = const TextStyle(
    color: UIColorsHelper.light_Drawer_header_textColor,
    fontSize: 15,
  );

  static TextStyle drawerBodyTextStyle = const TextStyle(
    color: UIColorsHelper.light_Drawer_body_textColor,
    fontSize: 15,
  );

  static TextStyle PagesHeaderStyle = const TextStyle(
    color: UIColorsHelper.light_title_textColor,
    fontSize: 25,
  );

}