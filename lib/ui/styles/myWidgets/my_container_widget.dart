import 'package:btwlate/ui/helper/constants/ui_space_helper.dart';
import 'package:flutter/material.dart';

class MyContainerWidget extends StatelessWidget {
  final double dynamicWidth;
  final double dynamicHeight;
  final Decoration decoration;
  final double padding;
  final Widget children;


  const MyContainerWidget({
    super.key,
    required this.dynamicWidth,
    required this.dynamicHeight,
    required this.decoration,
    required this.padding,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width:UISpaceHelper.dynamicWidth(context,  dynamicWidth,),
        height: UISpaceHelper.dynamicWidth(context,  dynamicHeight,),
        decoration: decoration,
        child: Padding(
            padding: EdgeInsets.all(padding),
            child: children
        ));
  }
}