import 'package:btwlate/ui/helper/uiColorsHelper.dart';
import 'package:btwlate/ui/helper/uiSizeHelper.dart';
import 'package:flutter/material.dart';

class UIDecorationStyles {
  static BoxDecoration headerStyle = const BoxDecoration(
      color: UIColorsHelper.light_Header_Background,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(UISizeHelper.HeaderBottomLeftCircular),
        bottomRight: Radius.circular(UISizeHelper.HeaderBottomRightCircular),
      ));

  
  static BoxDecoration smallHeaderContainerStyle = BoxDecoration(
      color: UIColorsHelper.light_companenet_color,
      borderRadius: BorderRadius.circular(UISizeHelper.smallHeaderContainerCircular));

  static BoxDecoration translateBoxContainerStyle = BoxDecoration(
      color: UIColorsHelper.light_companenet_color,
      borderRadius: BorderRadius.circular(UISizeHelper.translateBoxContainerCircular));

  static BoxDecoration translateButtonContainerStyle = BoxDecoration(
      color: UIColorsHelper.light_TranslateButtonBackground,
      borderRadius: BorderRadius.circular(UISizeHelper.translateButtonContainerCircular),);

  static BoxDecoration settingsListTileContainerStyle = BoxDecoration(
    color: UIColorsHelper.light_Background,
    borderRadius: BorderRadius.circular(UISizeHelper.listTileRadius),
    border: Border.all(strokeAlign:1,color: UIColorsHelper.light_ListTile_border_Color, width: 0.25 )

  );
}