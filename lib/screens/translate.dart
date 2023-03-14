import 'package:btwlate/ui/styles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:btwlate/ui/helper/uiSizeHelper.dart';
import 'package:btwlate/ui/helper/uiSpaceHelper.dart';
import 'package:btwlate/ui/styles/decorationStyles.dart';
import 'package:get/get.dart';

import '../controller/translatePageController.dart';
import '../ui/helper/uiColorsHelper.dart';
import '../ui/styles/generalThemeWidgetStyle.dart';

class translatePage extends StatefulWidget {
  translatePage({Key? key}) : super(key: key);
  String initialLang="tr";

  @override
  State<translatePage> createState() => _translatePageState();
}

class _translatePageState extends State<translatePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColorsHelper.light_Background,
      body: Column(
        children: [
          //generalHeader
          generalThemeWidgetStyle(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.initialLang, style: UITextStyles.translateStyle,
                ),
                InputLangController(
                  onSelected: (selectedValue){
                    setState(() {
                      widget.initialLang = selectedValue;
                      print(widget.initialLang);
                    });
                  },
                ),
              ],
            ),
          ),
          //seperator gh_t1
          SizedBox(
            height: UISpaceHelper.dynamicHeight(context, UISizeHelper.seperateHeight_gh_t1),
          ),
          //translateBox1
          Container(
            alignment: Alignment.center,
            //translate Box un genişlik ve yukseklik oranları
            width: UISpaceHelper.dynamicWidth(context, UISizeHelper.translateBox1Width),
            height: UISpaceHelper.dynamicHeight(context, UISizeHelper.translateBox1Height),
            decoration: UIDecorationStyles.translateBoxContainerStyle,
            child: Text(
              widget.initialLang,
              style: UITextStyles.translateStyle,
            ),
          ),
        ],
      ),
    );
  }
}
