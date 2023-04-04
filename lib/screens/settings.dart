import 'package:btwlate/auth/delete_user.dart';
import 'package:btwlate/auth/logout_user.dart';
import 'package:btwlate/screens/login.dart';
import 'package:btwlate/ui/helper/ui_colors_helper.dart';
import 'package:btwlate/ui/helper/ui_size_helper.dart';
import 'package:btwlate/ui/helper/ui_space_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/helper/ui_text_helper.dart';
import '../ui/styles/myWidgets/my_General_Widget.dart';
import '../ui/styles/myWidgets/my_ListTile_Widget.dart';
import '../ui/styles/myWidgets/my_spinkit_Widget.dart';
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
              MyGeneralWidget(
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
                    onPressed: ()async{
                      print("change account");
                      Get.dialog(
                        const MySpinkit(),
                      );
                      await LogOutUser.logOutUser();
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
                    onPressed: ()=>buildShowDialog(context),
                    icon: Icons.logout,

                  ),

                ],
              )


            ],
          )),
    );
  }

  Future<dynamic> buildShowDialog(BuildContext context) {
    return showDialog(
                    context: context,
                    builder: (context) {
                      return Opacity(
                        opacity: 0.9,
                        child: AlertDialog(
                          icon: const Icon(Icons.cloud_outlined),
                          actionsAlignment: MainAxisAlignment.start,
                          title: const Text(UITextHelper.showDialogHeader),
                          actions: <Widget>[
                            GestureDetector(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.delete),
                                    Text(UITextHelper.okShowDialog, textAlign: TextAlign.center),
                                  ],
                                ),
                              onTap: ()async {

                                 await DeleteAccount.deleteUser();
                                  print("settingste silmeye basildi");
                              },

                            ),
                          ],
                        ),
                      );
                    },
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