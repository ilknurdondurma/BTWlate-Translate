import 'package:btwlate/ui/helper/uiColorsHelper.dart';
import 'package:btwlate/ui/helper/uiSizeHelper.dart';
import 'package:flutter/material.dart';
import '../helper/uiSpaceHelper.dart';
import 'decorationStyles.dart';

class GeneralThemeWidgetStyle extends StatefulWidget {
  final Widget child;// child parametresi burada tanımlanır
  final Widget iconChild;
  final  Function() headerIconFunc;

  const GeneralThemeWidgetStyle({
    super.key,
    required this.child,
    required this.iconChild,
    required this.headerIconFunc,
  });

  @override
  State<GeneralThemeWidgetStyle> createState() => _GeneralThemeWidgetStyleState();
}
class _GeneralThemeWidgetStyleState extends State<GeneralThemeWidgetStyle> {
  @override
  void initState() {
    setState(() {
      super.initState();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        //mavi header
        Container(
          //mavinin görünen kısmı ayarı
            height: UISpaceHelper.dynamicHeight(context, UISizeHelper.headerVisibleHeight),
            decoration: UIDecorationStyles.headerStyle,
           ),

        // header icon Alignment (menu icon)
        Positioned(
          top: 0,
          left: 10,
          child: Container(
            alignment: Alignment.centerLeft,
            height: UISpaceHelper.dynamicHeight(context, 0.1),
            width: UISpaceHelper.dynamicWidth(context, 1),
            child: IconButton(onPressed:()=>widget.headerIconFunc(),icon: widget.iconChild,color: UIColorsHelper.light_heaader_IconColor,),
            color: UIColorsHelper.light_Header_Background,

          ),
        ),

        //grey header(tr-en)
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
              decoration: UIDecorationStyles.smallHeaderContainerStyle,
              child: widget.child,
            ),
        ),
      ],
    );
  }
}
