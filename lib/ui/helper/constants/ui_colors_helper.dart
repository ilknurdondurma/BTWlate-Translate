import 'package:flutter/material.dart';

class UIColorsHelper{
 static  bool theme =false;
 static void toggleTheme() {
  theme = !theme;
 }
 //ustteki renk light alttaki dark

  // background color
  static  Color scaffoldBackground =theme==true?  const Color(0xFFFFFFFF): Color(0xff454749);

  // companent background
  static   Color companentBackgroundColor = theme==true?  Color(0xfff2f2f7): Color(0xfff2f2f7); //box1 box2 small  header

  // header color
  static  Color headerBackground = theme==true? Color(0xff528df9):  Color(0xFF000000);

  // title text color
  static  Color pagesTitleTextColor =theme==true?  Color(0xFF000000): Color(0xFF000000);

  // buttons
  static  Color circleButtonsBackground=theme==true? Color(0xff528df9):  Color(0xFF000000);// -translate - login  - signup
  static  Color circleButtonItemColor=theme==true? Color(0xFFFFFFFF): Color(0xFFFFFFFF);
  static  Color signUpButtonsItemsColor =theme==true?  Color(0xFFFFFFFF): Color(0xFFFFFFFF);

  //  text fonts
  static  Color genelTextFontColor = theme==true? Color(0xff8d8d8d): Color(0xFF000000);// tr en terms enter someting

  // Icons colors
  static  Color onHeaderIconColor = theme==true?Color(0xFFFFFFFF):Color(0xFFFFFFFF);//menu
  static  Color inBoxIconsColor = theme==true? Color(0xff8d8d8d):Color(0xFF000000);//copy like sound
  static  Color listTileIconsColor =theme==true? Color(0xff528df9):Color(0xFFFFFFFF); // settings page
  static  Color deleteIconColor = Color(0xffe30d1f); //favorite page


  //splash colors
  static  Color splashBackgroundColor=theme==true?Color(0xff528df9):Color(0xFF000000);
  static  Color splashIconColor=theme==true?Color(0xFF000000): Color(0xff528df9);
  static  Color splashItemColor=theme==true?Color(0xFF000000): Color(0xff528df9);


  // Drawer colors
  static  Color drawerHeaderBackground =theme==true? Color(0xff528df9):Color(0xff454749);
  static  Color drawerBodyBackground =theme==true? Color(0xFFFFFFFF):Color(0xFF000000);
  static  Color drawerHeaderTextColor = theme==true?Color(0xFFFFFFFF):Color(0xFFFFFFFF);
  static  Color drawerBodyTextColor = theme==true?Color(0xff8d8d8d):Color(0xff8d8d8d);

  //popup menu color
  static  Color popupBackgorundColor=theme==true?Color(0xffc8d8f6):Color(0xffc8d8f6);

  // border color
  static  Color listTileBorderColor=theme==true?Color(0xff9fa1a6):Color(0xff9fa1a6);
  static  Color listTileTextColor=theme==true?Color(0xff454749):Color(0xFFFFFFFF);

 //switch color
 static  Color activeTrackColor =theme==true? Color(0xFFFFFFFF):Color(0xFFFFFFFF);
 static  Color activeColor =theme==true? Color(0xffc8d8f6):Color(0xffe30d1f);






}