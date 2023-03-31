import 'package:btwlate/auth/google_sign.dart';
import 'package:btwlate/screens/login.dart';
import 'package:btwlate/screens/translate.dart';
import 'package:btwlate/ui/helper/ui_colors_helper.dart';
import 'package:btwlate/ui/helper/ui_size_helper.dart';
import 'package:btwlate/ui/helper/ui_space_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/helper/ui_text_helper.dart';
import '../ui/styles/myWidgets/myGeneralWidget.dart';
import '../ui/styles/myWidgets/myListTileWidget.dart';
import '../ui/styles/styles/text_styles.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColorsHelper.lightBackground,
      body: SingleChildScrollView(
          child: Column(
            children: [
              GeneralThemeWidgetStyle(
                  iconChild: const Icon(Icons.arrow_back_ios),
                  height: UISpaceHelper.dynamicHeight(context, UISizeHelper.smallHeaderHeight),
                  headerIconFunc: ()=>Get.back(),
                  child: Text(UITextHelper.settingsHeader,style: UITextStyles.pagesHeaderStyle,)
              ),
              Column(
                children: [
                  SizedBox(height: UISpaceHelper.dynamicHeight(context, UISizeHelper.seperateHeight_gh_t1),),
                  MyListTileContainer(
                    text: UITextHelper.changeAccount,
                    color: UIColorsHelper.lightSettingsIconColor,
                    size: UISizeHelper.inBoxIconsSize,
                    onPressed: (){
                      print("change account");
                      GoogleSign.logOutGoogle();
                      Get.to(()=>const LoginPage());
                      },
                    icon: Icons.account_circle_rounded,

                  ),
                  MyListTileContainer(
                    text: UITextHelper.theme,
                    color: UIColorsHelper.lightSettingsIconColor,
                    size: UISizeHelper.inBoxIconsSize,
                    onPressed:(){print("theme");},
                    icon: Icons.color_lens,

                  ),
                  MyListTileContainer(
                    text: UITextHelper.deleteAccount,
                    color: UIColorsHelper.lightSettingsIconColor,
                    size: UISizeHelper.inBoxIconsSize,
                    onPressed: (){
                      GoogleSign.deleteGoogle();

                      print("delete ");


                    },
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