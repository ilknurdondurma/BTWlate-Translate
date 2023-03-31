import 'package:btwlate/ui/helper/ui_space_helper.dart';
import 'package:flutter/material.dart';

class MyContainerButton extends StatelessWidget {
  final double dynamicwidth;
  final double dynamicheight;
  final Decoration decoration;
  final double padding;
  final Widget children;


  const MyContainerButton({
    super.key,
    required this.dynamicwidth,
    required this.dynamicheight,
    required this.decoration,
    required this.padding,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width:UISpaceHelper.dynamicWidth(context,  dynamicwidth,),
        height: UISpaceHelper.dynamicWidth(context,  dynamicheight,),
        decoration: decoration,
        child: Padding(
            padding: EdgeInsets.all(padding),
            child: children
        ));
  }
}