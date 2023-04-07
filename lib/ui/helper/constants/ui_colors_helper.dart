import 'package:flutter/material.dart';
import 'package:get/get.dart';

 class UIColorsHelper extends GetxController{
 static  bool theme=true.obs.value;
 static  toggleTheme() {
  theme = !theme;
  return theme;

 }
 //ustteki renk light alttaki dark

  // background color
  static  Color scaffoldBackground =theme==true?  const Color(0xFFFFFFFF): const Color(0xff454749);

  // companent background
  static   Color companentBackgroundColor = theme==true?  const Color(0xfff2f2f7): const Color(0xfff2f2f7); //box1 box2 small  header

  // header color
  static  Color headerBackground = theme==true? const Color(0xff528df9):  const Color(0xFF000000);

  // title text color
  static  Color pagesTitleTextColor =theme==true?  const Color(0xFF000000): const Color(0xFF000000);

  // buttons
  static  Color circleButtonsBackground=theme==true? const Color(0xff528df9):  const Color(0xFF000000);// -translate - login  - signup
  static  Color circleButtonItemColor=theme==true? const Color(0xFFFFFFFF): const Color(0xFFFFFFFF);
  static  Color signUpButtonsItemsColor =theme==true?  const Color(0xFFFFFFFF): const Color(0xFFFFFFFF);

  //  text fonts
  static  Color genelTextFontColor = theme==true? const Color(0xff8d8d8d): const Color(0xFF000000);// tr en terms enter someting

  // Icons colors
  static  Color onHeaderIconColor = theme==true?const Color(0xFFFFFFFF):const Color(0xFFFFFFFF);//menu
  static  Color inBoxIconsColor = theme==true? const Color(0xff8d8d8d):const Color(0xFF000000);//copy like sound
  static  Color listTileIconsColor =theme==true? const Color(0xff528df9):const Color(0xFFFFFFFF); // settings page
  static  Color deleteIconColor = const Color(0xffe30d1f); //favorite page


  //splash colors
  static  Color splashBackgroundColor=theme==true?const Color(0xff528df9):const Color(0xFF000000);
  static  Color splashIconColor=theme==true?const Color(0xFF000000): const Color(0xff528df9);
  static  Color splashItemColor=theme==true?const Color(0xFF000000): const Color(0xff528df9);


  // Drawer colors
  static  Color drawerHeaderBackground =theme==true? const Color(0xff528df9):const Color(0xff454749);
  static  Color drawerBodyBackground =theme==true? const Color(0xFFFFFFFF):const Color(0xFF000000);
  static  Color drawerHeaderTextColor = theme==true?const Color(0xFFFFFFFF):const Color(0xFFFFFFFF);
  static  Color drawerBodyTextColor = theme==true?const Color(0xff8d8d8d):const Color(0xff8d8d8d);

  //popup menu color
  static  Color popupBackgorundColor=theme==true?const Color(0xffc8d8f6):const Color(0xffc8d8f6);

  // border color
  static  Color listTileBorderColor=theme==true?const Color(0xff9fa1a6):const Color(0xff9fa1a6);
  static  Color listTileTextColor=theme==true?const Color(0xff454749):const Color(0xFFFFFFFF);

 //switch color
 static  Color activeTrackColor =theme==true? const Color(0xFFFFFFFF):const Color(0xFFFFFFFF);
 static  Color activeColor =theme==true? const Color(0xffc8d8f6):const Color(0xffe30d1f);






}