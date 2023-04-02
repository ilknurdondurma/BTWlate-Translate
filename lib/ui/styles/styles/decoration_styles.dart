import 'package:btwlate/ui/helper/ui_colors_helper.dart';
import 'package:btwlate/ui/helper/ui_size_helper.dart';
import 'package:flutter/material.dart';

class UIDecorationStyles {
  static BoxDecoration headerStyle = const BoxDecoration(
      color: UIColorsHelper.lightHeaderBackground,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(UISizeHelper.headerBottomLeftCircular),
        bottomRight: Radius.circular(UISizeHelper.headerBottomRightCircular),
      ));

  
  static BoxDecoration smallHeaderContainerStyle = BoxDecoration(
      color: UIColorsHelper.lightCompanentColor,
      borderRadius: BorderRadius.circular(UISizeHelper.smallHeaderContainerCircular));


  static BoxDecoration translateBoxContainerStyle = BoxDecoration(
      color: UIColorsHelper.lightCompanentColor,
      borderRadius: BorderRadius.circular(UISizeHelper.translateBoxContainerCircular));

  static BoxDecoration translateButtonContainerStyle = BoxDecoration(
      color: UIColorsHelper.lightTranslateButtonBackground,
      borderRadius: BorderRadius.circular(UISizeHelper.translateButtonContainerCircular),);

  static BoxDecoration settingsListTileContainerStyle = BoxDecoration(
    color: UIColorsHelper.lightBackground,
    borderRadius: BorderRadius.circular(UISizeHelper.listTileRadius),
    border: Border.all(strokeAlign:StrokeAlign.outside,color: UIColorsHelper.lightListTileBorderColor, width: 0.25 )

  );

  static BoxDecoration loginPageButtonsStyles = BoxDecoration(
    color: UIColorsHelper.lightTranslateButtonBackground,
    borderRadius: BorderRadius.circular(UISizeHelper.loginButtonsContainerCircular),);

}
