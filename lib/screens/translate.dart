import 'package:btwlate/ui/styles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:btwlate/ui/helper/uiSizeHelper.dart';
import 'package:btwlate/ui/helper/uiSpaceHelper.dart';
import 'package:btwlate/ui/styles/decorationStyles.dart';


import '../controller/translatePageController.dart';
import '../ui/helper/uiColorsHelper.dart';
import '../ui/styles/generalThemeWidgetStyle.dart';

class translatePage extends StatefulWidget {
  translatePage({Key? key}) : super(key: key);
  String initialLang1="tr";
  String initialLang2="en";

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
          GeneralThemeWidgetStyle(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(widget.initialLang1, style: UITextStyles.translateStyle),
                InputLangController(
                  onSelected: (selectedValue){
                    setState(() {
                      widget.initialLang1 = selectedValue;
                      print(widget.initialLang1);
                    });
                  },
                ),
                IconButton(onPressed: ChangeLangIconController.changeLangIconController, icon: Icon(Icons.swap_horiz_outlined,size: UISizeHelper.iconChangeLangSize,color: UIColorsHelper.light_body_IconColor,)),
                Text(widget.initialLang2, style: UITextStyles.translateStyle),
                OutputLangController(
                  onSelected: (selectedValue){
                    setState(() {
                      widget.initialLang2 = selectedValue;
                      print(widget.initialLang2);
                    });
                  },
                ),

              ],
            ),
            iconChild:Icon(Icons.menu) ,
            headerIconFunc: MenuIconController.menuIconController,

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
          ),
        ],
      ),
    );
  }
}
