import 'package:btwlate/ui/helper/ui_colors_helper.dart';
import 'package:btwlate/ui/helper/ui_size_helper.dart';
import 'package:flutter/material.dart';
import '../../helper/ui_space_helper.dart';
import '../styles/decoration_styles.dart';

class MyGeneralWidget extends StatefulWidget {
  final Widget child;// child parametresi burada tanımlanır
  final Widget iconChild;
  final  Function() headerIconFunc;
  final double? height;

  const MyGeneralWidget({
    super.key,
    required this.child,
    required this.iconChild,
    required this.headerIconFunc,
    this.height

  });

  @override
  State<MyGeneralWidget> createState() => _MyGeneralWidgetState();
}
class _MyGeneralWidgetState extends State<MyGeneralWidget> {
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
            color: UIColorsHelper.lightHeaderBackground,
            child: IconButton(onPressed:()=>widget.headerIconFunc(),icon: widget.iconChild,color: UIColorsHelper.lightHeaaderIconColor,),

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
