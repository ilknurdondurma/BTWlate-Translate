import 'package:flutter/material.dart';

class UISpaceHelper {
  // SPACE
  static dynamicHeight(BuildContext context ,double height) => MediaQuery.of(context).size.height*height;
  static dynamicWidth(BuildContext context ,double width) => MediaQuery.of(context).size.width*width;
}
