import 'package:btwlate/screens/login.dart';
import 'package:btwlate/screens/translate.dart';
import 'package:btwlate/ui/helper/uiColorsHelper.dart';
import 'package:btwlate/ui/helper/uiSizeHelper.dart';
import 'package:btwlate/ui/helper/uiSpaceHelper.dart';
import 'package:btwlate/ui/styles/myWidgets/myIconButtonWidget.dart';
import 'package:btwlate/ui/styles/styles/decorationStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/helper/uiTextHelper.dart';
import '../ui/styles/myWidgets/myGeneralWidget.dart';
import '../ui/styles/myWidgets/myListTileWidget.dart';
import '../ui/styles/styles/textStyles.dart';

class settingsPage extends StatefulWidget {
  const settingsPage({Key? key}) : super(key: key);

  @override
  State<settingsPage> createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColorsHelper.light_Background,
      body: SingleChildScrollView(
          child: Column(
            children: [
              GeneralThemeWidgetStyle(
                  child: Text(UITextHelper.settingsHeader,style: UITextStyles.PagesHeaderStyle,),
                  iconChild: Icon(Icons.arrow_back_ios),
                  height: UISpaceHelper.dynamicHeight(context, UISizeHelper.smallHeaderHeight),
                  headerIconFunc: ()=>Get.to(()=>TranslatePage())
              ),
              Column(
                children: [
                  SizedBox(height: UISpaceHelper.dynamicHeight(context, UISizeHelper.seperateHeight_gh_t1),),
                  MyListTileContainer(
                    text: UITextHelper.changeAccount,
                    color: UIColorsHelper.light_settingsIconColor,
                    size: UISizeHelper.inBoxIconsSize,
                    onPressed: (){
                      print("change account");
                      Get.to(()=>LoginPage());
                      },
                    icon: Icons.account_circle_rounded,

                  ),
                  MyListTileContainer(
                    text: UITextHelper.theme,
                    color: UIColorsHelper.light_settingsIconColor,
                    size: UISizeHelper.inBoxIconsSize,
                    onPressed:(){print("theme");},
                    icon: Icons.color_lens,

                  ),
                  MyListTileContainer(
                    text: UITextHelper.logOut,
                    color: UIColorsHelper.light_settingsIconColor,
                    size: UISizeHelper.inBoxIconsSize,
                    onPressed: (){print("exit");},
                    icon: Icons.logout,

                  ),

                ],
              )


            ],
          )),
    );
  }
}


// SizedBox(height: UISpaceHelper.dynamicHeight(context, UISizeHelper.seperateHeight_gh_t1),),
// Divider(color: UIColorsHelper.light_divider_Color,),
// ListTile(
// title: Text(UITextHelper.changeAccount,style: UITextStyles.settingsPageStyle,),
// onTap: ()=>Get.to(()=>null),
// ),
// Divider(color: UIColorsHelper.light_divider_Color,),
//
// ListTile(
// title: Text(UITextHelper.theme,style: UITextStyles.settingsPageStyle,),
// onTap: ()=>Get.to(()=>null),
// ),
// Divider(color: UIColorsHelper.light_divider_Color,),
//
// ListTile(
// title: Text(UITextHelper.logOut,style: UITextStyles.settingsPageStyle,),
// onTap: ()=>Get.to(()=>null),
// ),
// Divider(color: UIColorsHelper.light_divider_Color,),