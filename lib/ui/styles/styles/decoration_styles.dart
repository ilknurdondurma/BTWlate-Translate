import 'package:btwlate/ui/helper/constants/ui_colors_helper.dart';
import 'package:btwlate/ui/helper/constants/ui_size_helper.dart';
import 'package:flutter/material.dart';

class UIDecorationStyles {
  //genel
  static BoxDecoration headerStyle =  BoxDecoration(
      color: UIColorsHelper.headerBackground,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(UISizeHelper.headerBottomLeftCircular),
        bottomRight: Radius.circular(UISizeHelper.headerBottomRightCircular),
      ));

  
  static BoxDecoration smallHeaderContainerStyle = BoxDecoration(
      color: UIColorsHelper.companentBackgroundColor,
      borderRadius: BorderRadius.circular(UISizeHelper.smallHeaderContainerCircular));

//translate page
  static BoxDecoration translateBoxContainerStyle = BoxDecoration(
      color: UIColorsHelper.companentBackgroundColor,
      borderRadius: BorderRadius.circular(UISizeHelper.translateBoxContainerCircular));

  static BoxDecoration translateButtonContainerStyle = BoxDecoration(
      color: UIColorsHelper.circleButtonsBackground,
      borderRadius: BorderRadius.circular(UISizeHelper.translateButtonContainerCircular),);
//setttings page
  static BoxDecoration settingsListTileContainerStyle = BoxDecoration(
    color: UIColorsHelper.scaffoldBackground,
    borderRadius: BorderRadius.circular(UISizeHelper.settingsListTileRadius),
    border: Border.all(color: UIColorsHelper.listTileBorderColor, width: 0.25 )

  );
//login page
  static BoxDecoration loginPageButtonsStyles = BoxDecoration(
    color: UIColorsHelper.circleButtonsBackground,
    borderRadius: BorderRadius.circular(UISizeHelper.loginButtonsContainerCircular),);

  //favorites page
  static BoxDecoration favoritesListTileContainerStyle = BoxDecoration(
  color: UIColorsHelper.scaffoldBackground,
  borderRadius: BorderRadius.circular(UISizeHelper.favoritesListTileRadius),
  border: Border.all(color: UIColorsHelper.listTileBorderColor, width: 0.5 ),);
}
