import 'package:btwlate/ui/helper/uiSizeHelper.dart';
import 'package:btwlate/ui/helper/uiSpaceHelper.dart';
import 'package:btwlate/ui/styles/decorationStyles.dart';
import 'package:flutter/material.dart';

import '../ui/helper/uiColorsHelper.dart';
import '../ui/styles/generalThemeWidgetStyle.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColorsHelper.light_Background,
      body: Column(
        children: [
          generalThemeWidgetStyle(),
          SizedBox(
            height: UISpaceHelper.dynamicHeight(context, UISizeHelper.seperateHeight_gh_t1),
          ),
          Container(
            alignment: Alignment.center,
            //grinin genişlik ve yukseklik oranları
            width: UISpaceHelper.dynamicWidth(context, UISizeHelper.smallHeaderWidth),
            height: UISpaceHelper.dynamicHeight(context, UISizeHelper.translateBox1Height),
            decoration: UIDecorationStyles.translateBoxContainerStyle,
          ),
        ],
      ),
    );
  }
}
