import 'package:btwlate/ui/helper/uiSizeHelper.dart';
import 'package:flutter/material.dart';
import '../helper/uiSpaceHelper.dart';
import 'decorationStyles.dart';

class generalThemeWidgetStyle extends StatefulWidget {
  const generalThemeWidgetStyle({
    super.key,
  });

  @override
  State<generalThemeWidgetStyle> createState() => _generalThemeWidgetStyleState();
}

class _generalThemeWidgetStyleState extends State<generalThemeWidgetStyle> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          //mavinin görünen kısmı ayarı
            height: UISpaceHelper.dynamicHeight(context, UISizeHelper.headerVisibleHeight),
            decoration: UIDecorationStyles.headerStyle),
        Positioned(
          //grinin sagdan soldan ve ustten yerleşim oranları
            left: UISpaceHelper.dynamicWidth(context, UISizeHelper.smallHeaderLeftSpace),
            right: UISpaceHelper.dynamicWidth(context, UISizeHelper.smallHeaderRightSpace),
            top: UISpaceHelper.dynamicHeight(context, UISizeHelper.smallHeaderTopSpace),
            child: Container(
              alignment: Alignment.center,
              //grinin genişlik ve yukseklik oranları
              width: UISpaceHelper.dynamicWidth(context, UISizeHelper.smallHeaderWidth),
              height: UISpaceHelper.dynamicHeight(context, UISizeHelper.smallHeaderHeight),
              decoration: UIDecorationStyles.headerSmallContainerStyle,
            ),
        )
      ],
    );
  }
}