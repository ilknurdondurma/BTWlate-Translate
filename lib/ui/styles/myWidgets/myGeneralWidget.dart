import 'package:btwlate/ui/helper/uiColorsHelper.dart';
import 'package:btwlate/ui/helper/uiSizeHelper.dart';
import 'package:flutter/material.dart';
import '../../helper/uiSpaceHelper.dart';
import '../styles/decorationStyles.dart';

class GeneralThemeWidgetStyle extends StatefulWidget {
  final Widget child;// child parametresi burada tanımlanır
  final Widget iconChild;
  final  Function() headerIconFunc;
  final double? height;

  const GeneralThemeWidgetStyle({
    super.key,
    required this.child,
    required this.iconChild,
    required this.headerIconFunc,
    this.height

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
          top: 10,
          left: 10,
          child: Container(
            alignment: Alignment.centerLeft,
            height: UISpaceHelper.dynamicHeight(context, 0.1),
            width: UISpaceHelper.dynamicWidth(context, 1),
            color: UIColorsHelper.light_Header_Background,
            child: IconButton(onPressed:()=>widget.headerIconFunc(),icon: widget.iconChild,color: UIColorsHelper.light_heaader_IconColor,),

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
              height: widget.height,
              decoration: UIDecorationStyles.smallHeaderContainerStyle,
              child: widget.child,
            ),
        ),
      ],
    );
  }
}
